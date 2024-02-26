import QtQuick
import QtQuick.Controls.impl
import QtQuick.Templates as T
import Contemporary
import com.vicr123.Contemporary.impl

T.SpinBox {
    id: control

    // Note: the width of the indicators are calculated into the padding
    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            contentItem.implicitWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding,
                             up.implicitIndicatorHeight, down.implicitIndicatorHeight)

    leftPadding: padding + (control.mirrored ? (up.indicator ? up.indicator.width : 0) : (down.indicator ? down.indicator.width : 0))
    rightPadding: padding + (control.mirrored ? (down.indicator ? down.indicator.width : 0) : (up.indicator ? up.indicator.width : 0))

    hoverEnabled: true

    validator: IntValidator {
        locale: control.locale.name
        bottom: Math.min(control.from, control.to)
        top: Math.max(control.from, control.to)
    }

    contentItem: TextInput {
        z: 2
        text: control.displayText
        clip: width < implicitWidth
        padding: 6

        font: control.font
        color: control.palette.text
        selectionColor: control.palette.highlight
        selectedTextColor: control.palette.highlightedText
        horizontalAlignment: Qt.AlignHCenter
        verticalAlignment: Qt.AlignVCenter

        readOnly: !control.editable
        validator: control.validator
        inputMethodHints: control.inputMethodHints
    }

    up.indicator: ButtonBackground {
        x: control.mirrored ? 0 : control.width - width
        height: control.height
        implicitWidth: 40
        implicitHeight: 40
        pressed: control.up.pressed
        hovered: control.up.hovered
        buttonColor: Contemporary.background
        border.color: Contemporary.line

        Rectangle {
            x: (parent.width - width) / 2
            y: (parent.height - height) / 2
            width: parent.width / 3
            height: 2
            color: enabled ? Contemporary.foreground : Contemporary.disabled(Contemporary.foreground)
        }
        Rectangle {
            x: (parent.width - width) / 2
            y: (parent.height - height) / 2
            width: 2
            height: parent.width / 3
            color: enabled ? Contemporary.foreground : Contemporary.disabled(Contemporary.foreground)
        }
    }

    down.indicator: ButtonBackground {
        x: control.mirrored ? parent.width - width : 0
        height: control.height
        implicitWidth: 40
        implicitHeight: 40
        pressed: control.down.pressed
        hovered: control.down.hovered
        buttonColor: Contemporary.background
        border.color: Contemporary.line

        Rectangle {
            x: (parent.width - width) / 2
            y: (parent.height - height) / 2
            width: parent.width / 3
            height: 2
            color: enabled ? Contemporary.foreground : Contemporary.disabled(Contemporary.foreground)
        }
    }

    background: Rectangle {
        implicitWidth: 140
        radius: 5
        border.color: Contemporary.line
    }
}
