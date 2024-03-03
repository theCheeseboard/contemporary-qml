import QtQuick
import QtQuick.Controls.impl
import QtQuick.Templates as T
import Contemporary

T.MenuSeparator {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
        implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
        implicitContentHeight + topPadding + bottomPadding)

    padding: 2
    verticalPadding: padding + 4

    contentItem: Rectangle {
        implicitWidth: 188
        implicitHeight: 1
        color: Contemporary.line
    }
}
