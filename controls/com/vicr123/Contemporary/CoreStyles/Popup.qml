import QtQuick
import QtQuick.Controls.impl
import QtQuick.Templates as T
import Contemporary

T.Popup {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
        contentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
        contentHeight + topPadding + bottomPadding)

    padding: 1

    background: Rectangle {
        color: Contemporary.background
        border.color: Contemporary.line
        radius: 4
    }

    T.Overlay.modal: Rectangle {
        color: Color.transparent(control.palette.shadow, 0.5)
    }

    T.Overlay.modeless: Rectangle {
        color: Color.transparent(control.palette.shadow, 0.12)
    }
}
