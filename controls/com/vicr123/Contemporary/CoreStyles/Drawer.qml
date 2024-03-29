import QtQuick
import QtQuick.Controls.impl
import QtQuick.Templates as T
import Contemporary

T.Drawer {
    id: control

    parent: T.Overlay.overlay

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
        contentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
        contentHeight + topPadding + bottomPadding)

    topPadding: control.edge === Qt.BottomEdge
    leftPadding: control.edge === Qt.RightEdge
    rightPadding: control.edge === Qt.LeftEdge
    bottomPadding: control.edge === Qt.TopEdge

    enter: Transition {
        SmoothedAnimation {
            velocity: 7.5
            easing.type: Easing.InCubic
        }
    }
    exit: Transition {
        SmoothedAnimation {
            velocity: 7.5
            easing.type: Easing.OutCubic
        }
    }

    background: Rectangle {
        color: Contemporary.background
    }

    T.Overlay.modal: Rectangle {
        color: Color.transparent(Contemporary.background, 0.75)
    }

    T.Overlay.modeless: Rectangle {
        color: Color.transparent(Contemporary.background, 0.75)
    }
}
