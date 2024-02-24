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

        Rectangle {
            Layout.preferredWidth: 3
            visible: nmin.visible
        }

        NativeWindowButton {
            id: nmin
            Layout.preferredWidth: 16
            Layout.preferredHeight: 16
            systemWindowType: 0
        }

        NativeWindowButton {
            id: nmax
            Layout.preferredWidth: 16
            Layout.preferredHeight: 16
            systemWindowType: 1
        }

        NativeWindowButton {
            id: nclose
            Layout.preferredWidth: 16
            Layout.preferredHeight: 16
            systemWindowType: 2
        }

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
            visible: !nclose.haveNativeControls
        }
    }

    onPressed: root.control.startSystemMove();
}
