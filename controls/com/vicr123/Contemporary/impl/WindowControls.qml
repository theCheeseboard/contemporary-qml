import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

MouseArea {
    id: root
    Layout.fillWidth: false
    Layout.fillHeight: false
    Layout.preferredWidth: childrenRect.width
    Layout.preferredHeight: childrenRect.height

    implicitHeight: childrenRect.height
    implicitWidth: nmin.haveWindowControls ? childrenRect.width : 0

    visible: nmin.haveWindowControls

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

            Rectangle {
                Layout.preferredWidth: 3
            }
        }

        Button {
            id: min
            Layout.preferredWidth: min.height
            icon.source: "qrc:/com/vicr123/Contemporary/qml/icons/min.svg"
            flat: true
            onClicked: Window.window.showMinimized()
            visible: !nmin.haveNativeControls
            icon.width: 24
            icon.height: 24
        }

        Button {
            id: max
            Layout.preferredWidth: max.height
            icon.source: `qrc:/com/vicr123/Contemporary/qml/icons/${Window.window.visibility === Window.Maximized ? "res" : "max"}.svg`
            flat: true
            onClicked: Window.window.visibility === Window.Maximized ? Window.window.showNormal() : Window.window.showMaximized()
            visible: !nmin.haveNativeControls
            icon.width: 24
            icon.height: 24
        }

        Button {
            id: close
            Layout.preferredWidth: close.height
            icon.source: "qrc:/com/vicr123/Contemporary/qml/icons/close.svg"
            flat: true
            onClicked: Window.window.close()
            visible: !nmin.haveNativeControls
            icon.width: 24
            icon.height: 24
        }
    }

    onPressed: Window.window.startSystemMove();
}
