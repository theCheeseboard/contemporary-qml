import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    id: root
    Layout.fillWidth: false
    Layout.fillHeight: false
    Layout.preferredWidth: childrenRect.width
    Layout.preferredHeight: childrenRect.height

    property Window control

    RowLayout {
        spacing: 0
        // visible: Qt.platform.os === "osx"

        Button {
            id: min
            Layout.preferredWidth: min.height
            icon.source: "qrc:/com/vicr123/Contemporary/qml/icons/min.svg"
            flat: true
            onClicked: root.control.showMinimized()
        }

        Button {
            id: max
            Layout.preferredWidth: max.height
            icon.source: `qrc:/com/vicr123/Contemporary/qml/icons/${root.control.visibility === Window.Maximized ? "res" : "max"}.svg`
            flat: true
            onClicked: root.control.visibility === Window.Maximized ? root.control.showNormal() : root.control.showMaximized()
        }

        Button {
            id: close
            Layout.preferredWidth: close.height
            icon.source: "qrc:/com/vicr123/Contemporary/qml/icons/close.svg"
            flat: true
            onClicked: root.control.close()
        }
    }
}
