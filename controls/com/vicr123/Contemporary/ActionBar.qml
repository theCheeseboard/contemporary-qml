import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import com.vicr123.Contemporary.impl

MouseArea {
    id: root
    height: childrenRect.height
    Layout.fillWidth: true
    property Window control

    implicitHeight: childrenRect.height

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
    }

    onPressed: root.control.startSystemMove();
}
