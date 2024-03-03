import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Contemporary

Rectangle {
    id: root

    property real innerTopMargin
    property alias text: label.text
    property bool backButtonVisible: false

    color: Contemporary.layer
    implicitHeight: label.implicitHeight + innerTopMargin + 15

    Layout.preferredHeight: implicitHeight

    radius: 4

    Item {
        anchors.fill: parent
        anchors.topMargin: innerTopMargin + 3

        Button {
            id: backButton
            icon.name: "go-previous"
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            width: backButtonVisible ? 32 : 0
            flat: true
        }

        Label {
            id: label
            anchors.left: backButton.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            anchors.margins: 6
            font.pointSize: 15
        }
    }
}