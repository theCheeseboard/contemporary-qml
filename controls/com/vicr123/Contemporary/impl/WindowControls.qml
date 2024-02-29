import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    id: root
    Layout.fillWidth: false
    Layout.fillHeight: false
    Layout.preferredWidth: childrenRect.width
    Layout.preferredHeight: childrenRect.height

    implicitHeight: childrenRect.height
    implicitWidth: childrenRect.width

    property Window control

    RowLayout {
        height: Math.max(childrenRect.height, 24)
        spacing: 0

        RowLayout {
            visible: nmin.haveNativeControls

            Rectangle {
                Layout.preferredWidth: 3
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
        }

        Button {
            id: min
            Layout.preferredWidth: min.height
            icon.source: "qrc:/com/vicr123/Contemporary/qml/icons/min.svg"
            flat: true
            onClicked: root.control.showMinimized()
            visible: !nmin.haveNativeControls
        }

        Button {
            id: max
            Layout.preferredWidth: max.height
            icon.source: `qrc:/com/vicr123/Contemporary/qml/icons/${root.control.visibility === Window.Maximized ? "res" : "max"}.svg`
            flat: true
            onClicked: root.control.visibility === Window.Maximized ? root.control.showNormal() : root.control.showMaximized()
            visible: !nmin.haveNativeControls
        }

        Button {
            id: close
            Layout.preferredWidth: close.height
            icon.source: "qrc:/com/vicr123/Contemporary/qml/icons/close.svg"
            flat: true
            onClicked: root.control.close()
            visible: !nmin.haveNativeControls
        }
    }
}
