import QtQuick
import QtQuick.Templates as T
import QtQuick.Controls.impl
import Contemporary

T.CheckBox {
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
        radius: 4

        color: "transparent"
        border.color: control.enabled ? Contemporary.foreground : Contemporary.disabled(Contemporary.foreground)

        Rectangle {
            id: innerIndicator
            anchors.left: outerIndicator.left
            anchors.top: outerIndicator.top
            anchors.bottom: outerIndicator.bottom
            width: 0
            radius: 4
            color: control.enabled ? Contemporary.foreground : Contemporary.disabled(Contemporary.foreground)

            states: [
                State {
                    name: "off"
                    when: control.checkState === Qt.Unchecked
                    PropertyChanges {
                        target: innerIndicator
                        width: 0
                    }
                },
                State {
                    name: "indeterminate"
                    when: control.checkState === Qt.PartiallyChecked
                    PropertyChanges {
                        target: innerIndicator
                        width: outerIndicator.width / 2
                    }
                },
                State {
                    name: "checked"
                    when: control.checkState === Qt.Checked
                    PropertyChanges {
                        target: innerIndicator
                        width: outerIndicator.width
                    }
                }
            ]

            Behavior on width {
                NumberAnimation {
                    duration: 150
                    easing.type: Easing.InOutCubic
                }
            }
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
