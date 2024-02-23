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
        visible: Qt.platform.os === "osx"

        Button {
            id: min
            width: min.height
            icon.source: "qrc:/com/vicr123/Contemporary/qml/icons/min.svg"
            flat: true
            onClicked: root.control.showMinimized()
        }

        Button {
            id: max
            width: max.height
            icon.source: `qrc:/com/vicr123/Contemporary/qml/icons/${root.control.Maximized ? "res" : "max"}.svg`
            flat: true
            onClicked: root.control.Maximized ? root.control.showNormal() : root.control.showMaximized()
        }

        Button {
            id: close
            width: close.height
            icon.source: "qrc:/com/vicr123/Contemporary/qml/icons/close.svg"
            flat: true
            onClicked: root.control.close()
        }
    }
}
