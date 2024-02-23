import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import com.vicr123.Contemporary.impl

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
            id: menuButton
            icon.name: "com.vicr123.thebeat"
            icon.color: "transparent"
            flat: true
            Layout.preferredWidth: menuButton.height
        }

        Rectangle {
            Layout.fillWidth: true
        }

        WindowControls {
            control: root.control
        }
    }

    onPressed: root.control.startSystemMove();
}
