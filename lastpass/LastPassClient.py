#!/usr/bin/env python
# -*- coding: utf-8 -*-

import pyotherside
import threading
import time
import random

import json
import os
from lastpass import (
    fetcher,
    Vault,
    LastPassIncorrectYubikeyPasswordError,
    LastPassIncorrectGoogleAuthenticatorCodeError
)

DEVICE_ID = "LastSail - Sailfish OS"

class LastPassClient:
    vault = None
    session = None
    def __init__(self):
        # Set bgthread to a finished thread so we never
        # have to check if it is None.
        self.bgthread = threading.Thread()
        self.bgthread.start()
    def login(self, username, password, mfa=None):
        try:
            if mfa == "":
                mfa = None
            self.session = fetcher.login(username, password, mfa, DEVICE_ID)
            blob = fetcher.fetch(self.session)
            self.vault = Vault.open_remote(blob, username, password)
            pyotherside.send('loginFinished', True)
            print("Login success")
            return
        except:
            print("Login failed")
            pyotherside.send('loginFinished', False)
            pyotherside.send('loginFinished', False)
            return
    def logout(self):
        fetcher.logout(self.session)
        self.session = None
    def checkLogin(self):
        print("Check Login")
        if self.session is None:
            pyotherside.send('notLoggedIn', True)
    def updateList(self):
        # TODO: add a fetcher here
        list_model = []
        for index, i in enumerate(self.vault.accounts):
            dict = {}
            dict["name"] = i.name
            dict["username"] = i.username
            dict["password"] = i.password
            dict["url"] = i.url
            dict["group"] = i.group
            dict["notes"] = i.notes
            list_model.append(dict)

        pyotherside.send('passwords_list', sorted(list_model, key=lambda u:u['name']))


lastPassClient = LastPassClient()
