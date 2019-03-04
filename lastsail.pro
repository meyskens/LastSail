# NOTICE:
#
# Application name defined in TARGET has a corresponding QML filename.
# If name defined in TARGET is changed, the following needs to be done
# to match new name:
#   - corresponding QML filename must be changed
#   - desktop icon filename must be changed
#   - desktop filename must be changed
#   - icon definition filename in desktop file must be changed
#   - translation filenames have to be changed

# The name of your application
TARGET = lastsail

CONFIG += sailfishapp

SOURCES += src/lastsail.cpp

DISTFILES += qml/lastsail.qml \
    qml/cover/CoverPage.qml \
    qml/pages/FirstPage.qml \
    qml/pages/SecondPage.qml \
    rpm/lastsail.changes.in \
    rpm/lastsail.changes.run.in \
    rpm/lastsail.spec \
    rpm/lastsail.yaml \
    translations/*.ts \
    lastsail.desktop \
    lastpass/LastPassClient.py \
    lastpass/lib/* \
    lastpass/lib/lastpass-python/example/credentials.json.example \
    lastpass/lib/lastpass-python/lastpass_python.egg-info/dependency_links.txt \
    lastpass/lib/lastpass-python/lastpass_python.egg-info/PKG-INFO \
    lastpass/lib/lastpass-python/lastpass_python.egg-info/requires.txt \
    lastpass/lib/lastpass-python/lastpass_python.egg-info/SOURCES.txt \
    lastpass/lib/lastpass-python/lastpass_python.egg-info/top_level.txt \
    lastpass/lib/lastpass-python/LICENSE \
    lastpass/lib/lastpass-python/requirements.txt \
    lastpass/lib/lastpass-python/tox.ini \
    lastpass/lib/lastpass-python/example/example.py \
    lastpass/lib/lastpass-python/lastpass/__init__.py \
    lastpass/lib/lastpass-python/lastpass/account.py \
    lastpass/lib/lastpass-python/lastpass/blob.py \
    lastpass/lib/lastpass-python/lastpass/chunk.py \
    lastpass/lib/lastpass-python/lastpass/exceptions.py \
    lastpass/lib/lastpass-python/lastpass/fetcher.py \
    lastpass/lib/lastpass-python/lastpass/parser.py \
    lastpass/lib/lastpass-python/lastpass/session.py \
    lastpass/lib/lastpass-python/lastpass/vault.py \
    lastpass/lib/lastpass-python/tests/__init__.py \
    lastpass/lib/lastpass-python/tests/test_account.py \
    lastpass/lib/lastpass-python/tests/test_blob.py \
    lastpass/lib/lastpass-python/tests/test_chunk.py \
    lastpass/lib/lastpass-python/tests/test_data.py \
    lastpass/lib/lastpass-python/tests/test_fetcher.py \
    lastpass/lib/lastpass-python/tests/test_http.py \
    lastpass/lib/lastpass-python/tests/test_parser.py \
    lastpass/lib/lastpass-python/tests/test_session.py \
    lastpass/lib/lastpass-python/tests/test_vault.py \
    lastpass/lib/lastpass-python/setup.py \
    lastpass/LastPassClient.py \
    lastpass/lib/lastpass-python/README.rst \
    qml/pages/ErrorDialog.qml \
    qml/pages/LoginDialog.qml


LpClient.path = /usr/share/lastsail/lastpass
LpClient.files = lastpass/*

INSTALLS += LpClient
SAILFISHAPP_ICONS = 86x86 108x108 128x128 172x172

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n

# German translation is enabled as an example. If you aren't
# planning to localize your app, remember to comment out the
# following TRANSLATIONS line. And also do not forget to
# modify the localized app name in the the .desktop file.
TRANSLATIONS += translations/lastsail-de.ts

HEADERS +=
