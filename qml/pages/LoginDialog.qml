import QtQuick 2.0
import Sailfish.Silica 1.0

Dialog {
    id: dialog
    canAccept: emailField.text != "" && passwordField.text != ""

    property alias email: emailField.text
    property alias password: passwordField.text
    property alias mfa: mfaField.text

    Column {
        width: parent.width

        DialogHeader {
            title: "Login"
        }

        TextField {
            width: parent.width
            id: emailField
            focus: true
            label: "Email"
            placeholderText: "Email"

            EnterKey.iconSource: "image://theme/icon-m-enter-next"
            EnterKey.onClicked: passwordField.focus = true
        }

        PasswordField {
            id: passwordField
        }

        TextField {
            width: parent.width
            id: mfaField
            focus: true
            label: "Multi-Factor token"
            placeholderText: "Multi-Factor token"

            EnterKey.iconSource: "image://theme/icon-m-enter-next"
            EnterKey.onClicked: dialog.accept()
        }
    }


}
