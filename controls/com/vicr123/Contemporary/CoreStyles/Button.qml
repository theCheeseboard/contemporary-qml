import QtQuick 2.15
import QtQuick.Templates as T
import Contemporary
import QtQuick.Controls.impl
import com.vicr123.Contemporary.impl

T.Button {
    id: control

    hoverEnabled: true

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding)

    padding: 6
    horizontalPadding: padding + 2
    spacing: 6

    icon.width: 24
    icon.height: 24
    icon.color: control.checked || control.highlighted ? control.palette.brightText :
        (control.flat && !control.down ? control.palette.windowText : control.palette.buttonText)

    contentItem: IconLabel {
        spacing: control.spacing
        mirrored: control.mirrored
        display: control.display

        icon: control.icon
        text: control.text
        font: control.font
        color: control.checked || control.highlighted ? control.palette.brightText :
            (control.flat && !control.down ? control.palette.windowText : control.palette.buttonText)
    }

    background: ButtonBackground {
        buttonColor: control.flat ? "transparent" : Contemporary.accent
        flat: control.flat
        highlighted: control.highlighted
        checked: control.checked
        pressed: control.pressed
        enabled: control.enabled
        hovered: control.hovered

        FocusDecoration {
            anchors.fill: parent
            focused: control.visualFocus
            radius: 4
        }
    }
}
