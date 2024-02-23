import QtQuick 2.15
import QtQuick.Templates as T
import Contemporary
import QtQuick.Controls.impl

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
                control.flat && !control.down ? (control.visualFocus ? control.palette.highlight : control.palette.windowText) : control.palette.buttonText

    contentItem: IconLabel {
        spacing: control.spacing
        mirrored: control.mirrored
        display: control.display

        icon: control.icon
        text: control.text
        font: control.font
        color: control.checked || control.highlighted ? control.palette.brightText :
               control.flat && !control.down ? (control.visualFocus ? control.palette.highlight : control.palette.windowText) : control.palette.buttonText
    }

    background: Rectangle {
        id: background
        implicitWidth: 100
        implicitHeight: 40

        color: baseColor()
        border.color: control.palette.highlight
        border.width: control.visualFocus ? 2 : 0
        radius: 5

        function baseColor() {
            if (control.flat) {
                return Contemporary.background;
            } else {
                return Contemporary.accent;
            }
        }

        states: [
            State {
                name: "off"
                PropertyChanges {
                    target: background
                    color: baseColor()
                }
            },
            State {
                name: "disabled"
                when: !control.enabled
                PropertyChanges {
                    target: background
                    color: Contemporary.disabled(baseColor())
                }
            },
            State {
                name: "pressed"
                when: control.highlighted || control.checked || control.pressed
                PropertyChanges {
                    target: background
                    color: Contemporary.pressed(baseColor())
                }
            },
            State {
                name: "hovered"
                when: control.hovered
                PropertyChanges {
                    target: background
                    color: Contemporary.hovered(baseColor())
                }
            }
        ]

        transitions: [
            Transition {
                ColorAnimation {
                    duration: 150
                    easing.type: Easing.InOutCubic
                }
            }
        ]
    }
}
