import QtQuick
import QtQuick.Controls.impl
import QtQuick.Templates as T
import Contemporary

T.GroupBox {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
        contentWidth + leftPadding + rightPadding,
        implicitLabelWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
        contentHeight + topPadding + bottomPadding)

    spacing: 6
    padding: 12
    topPadding: padding + (implicitLabelWidth > 0 ? implicitLabelHeight + spacing : 0)

    label: Text {
        id: label
        x: control.leftPadding
        y: 6
        width: control.availableWidth

        text: control.title.toLocaleUpperCase()
        font.family: control.font.name
        font.bold: true
        color: Contemporary.foreground
        elide: Text.ElideRight
        verticalAlignment: Text.AlignVCenter
    }

    background: Rectangle {
        // y: control.topPadding - control.bottomPadding
        y: 0
        width: parent.width
        // height: parent.height - control.topPadding + control.bottomPadding
        height: parent.height

        radius: 4

        color: Contemporary.layer
    }
}
