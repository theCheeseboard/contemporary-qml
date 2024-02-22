import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

MouseArea {
    id: root
    height: childrenRect.height
    Layout.fillWidth: true
    property Window control

    RowLayout {
        height: childrenRect.height
        anchors.left: root.left
        anchors.right: root.right

        Button {
            text: qsTr("Button");
            onClicked: root.control.close()
        }

        Button {
            text: qsTr("Button");
            onClicked: root.control.showFullScreen()
        }

        Rectangle {
            Layout.fillWidth: true
        }
    }

    onPressed: root.control.startSystemMove();
}
