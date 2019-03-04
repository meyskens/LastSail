import QtQuick 2.0
import Sailfish.Silica 1.0
import io.thp.pyotherside 1.4

Page {
    id: listPage
    property bool updating: false


    // The effective value will be restricted by ApplicationWindow.allowedOrientations
    allowedOrientations: Orientation.All

    ListModel {
        id: passwordsModel
    }

    // To enable PullDownMenu, place our content in a SilicaFlickable
    SilicaFlickable {
        anchors.fill: parent

        // PullDownMenu and PushUpMenu must be declared in SilicaFlickable, SilicaListView or SilicaGridView
        PullDownMenu {
            MenuItem {
                text: qsTr("Logout")
                onClicked: {
                    python.logout();
                }
            }
            MenuItem {
                text: qsTr("Refresh")
                onClicked: {
                    python.startUpdate();
                }
            }
        }

        // Tell SilicaFlickable the height of its content.
        contentHeight: column.height

        ProgressBar {
            id: dlprogress
            label: "Updating password list"
            indeterminate: true
            anchors.verticalCenter: parent.verticalCenter
            width: parent.width
            visible: listPage.updating
        }


        SilicaListView {
            id: passwordListModel
            header: PageHeader {
                title: qsTr("Passwords")
            }

            visible: !listPage.updating // Hide list to make progress bar central

            anchors.fill: parent

            model: passwordsModel

            delegate: BackgroundItem {
                id: delegate

                Label {
                    x: Theme.horizontalPageMargin
                    text: qsTr("Item") + " " + name
                    anchors.verticalCenter: parent.verticalCenter
                }
                onClicked: console.log("Clicked " + index)
            }
            VerticalScrollDecorator {}
        }

    }

    Python {
        id: python

        Component.onCompleted: {
            addImportPath(Qt.resolvedUrl('../../lastpass'));
            print(Qt.resolvedUrl('../../lastpass'))

            setHandler('loginFinished', function(success) {
                listPage.updating = false;
                if (!success) {
                    var dialog = pageStack.push(Qt.resolvedUrl("ErrorDialog.qml"))
                    dialog.error = "Login Error"
                    dialog.open()
                }
            });

            setHandler('notLoggedIn', function(success) {
                listPage.updating = false;
                var dialog = pageStack.push(Qt.resolvedUrl("LoginDialog.qml"))
                dialog.accepted.connect(function() {
                    listPage.updating = true;
                    login(dialog.email, dialog.password, dialog.mfa)
                })

                dialog.open()
            });

            setHandler("passwords_list", function(passwords) {
                passwordsModel.clear()
                for (var i=0; i<passwords.length; i++) {
                    passwordsModel.append(passwords[i])
                }
                listPage.updating = false;
            })


            importModule('LastPassClient', function () {});
            checkLoggedin()
        }


        function startUpdate() {
            listPage.updating = true;
            call("LastPassClient.lastPassClient.updateList", function() {})
        }

        function login(email, password, mfa) {
            console.log("Login sent for", email, password, mfa)
            call("LastPassClient.lastPassClient.login",[email, password, mfa], function() {})
        }

        function logout() {
            call("LastPassClient.lastPassClient.logout", function() {})
            checkLoggedin()
        }

        function checkLoggedin() {
            call("LastPassClient.lastPassClient.checkLogin()", function() {})
        }

        onError: {
            // when an exception is raised, this error handler will be called
            console.log('python error: ' + traceback);
        }

        onReceived: {
            // asychronous messages from Python arrive here
            // in Python, this can be accomplished via pyotherside.send()
            console.log('got message from python: ' + data);
        }
    }
}
