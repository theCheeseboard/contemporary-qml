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

    icon.width: 16
    icon.height: 16
    icon.color: control.enabled ? Contemporary.foreground : Contemporary.disabled(Contemporary.foreground)

    contentItem: IconLabel {
        spacing: control.spacing
        mirrored: control.mirrored
        display: control.display

        icon: control.icon
        text: control.text
        font: control.font
        color: control.enabled ? Contemporary.foreground : Contemporary.disabled(Contemporary.foreground)
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
