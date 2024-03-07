import QtQuick
import QtQuick.Controls
import Contemporary

Item {
    property alias text: label.text

    implicitWidth: childrenRect.width
    implicitHeight: childrenRect.height + 3

    Rectangle {
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 3

        implicitWidth: childrenRect.width
        implicitHeight: childrenRect.height

        color: Contemporary.layer
        radius: 4

        Label {
            id: label
            padding: 9
        }
    }
}
