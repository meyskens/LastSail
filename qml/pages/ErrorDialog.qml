import QtQuick 2.2
import Sailfish.Silica 1.0

Dialog {
    property string error

    canAccept: false

    Column {
        width: parent.width

        DialogHeader {
            title: qsTr(error)
        }
    }
}
