import QtQuick
import QtQuick.Templates as T
import QtQuick.Controls.impl
import Contemporary
import com.vicr123.Contemporary.impl

T.RadioButton {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding,
                             implicitIndicatorHeight + topPadding + bottomPadding)

    padding: 6
    spacing: 6

    indicator: Rectangle {
        id: outerIndicator

        x: control.text ? (control.mirrored ? control.width - width - control.rightPadding : control.leftPadding) : control.leftPadding + (control.availableWidth - width) / 2
        y: control.topPadding + (control.availableHeight - height) / 2
        width: 16
        height: 16
        radius: outerIndicator.width / 2

        color: "transparent"
        border.color: control.enabled ? Contemporary.foreground : Contemporary.disabled(Contemporary.foreground)
        border.width: 1

        states: [
            State {
                name: "off"
                PropertyChanges {
                    target: outerIndicator.border
                    width: 1
                }
            },
            State {
                name: "on"
                when: control.checked
                PropertyChanges {
                    target: outerIndicator.border
                    width: outerIndicator.width / 4
                }
            }
        ]

        Behavior on border.width {
            NumberAnimation {
                duration: 200
                easing.type: Easing.OutCubic
            }
        }

        FocusDecoration {
            id: focusDecoration
            anchors.fill: parent
            visible: control.visualFocus
            radius: (focusDecoration.width + 3) / 2
            renderOutside: true
        }
    }

    contentItem: Text {
        leftPadding: control.indicator && !control.mirrored ? control.indicator.width + control.spacing : 0
        rightPadding: control.indicator && control.mirrored ? control.indicator.width + control.spacing : 0

        text: control.text
        font: control.font
        color: control.palette.windowText
        elide: Text.ElideRight
        verticalAlignment: Text.AlignVCenter
    }
}
