import QtQuick
import QtQuick.Controls
import QtQuick.Templates as T
import Contemporary
import com.vicr123.Contemporary.impl

T.Switch {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset, implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset, implicitContentHeight + topPadding + bottomPadding, implicitIndicatorHeight + topPadding + bottomPadding)

    readonly property var foreground: control.enabled ? Contemporary.foreground : Contemporary.disabled(Contemporary.foreground)
    readonly property var accent: control.enabled ? Contemporary.accent : Contemporary.disabled(Contemporary.accent)

    padding: 6
    spacing: 6

    indicator: Rectangle {
        implicitWidth: 48
        implicitHeight: 24

        clip: true

        x: control.text ? (control.mirrored ? control.width - width - control.rightPadding : control.leftPadding) : control.leftPadding + (control.availableWidth - width) / 2
        y: control.topPadding + (control.availableHeight - height) / 2

        radius: 4
        color: Contemporary.background

        Rectangle {
            radius: 4
            color: Contemporary.accent
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.right: thumbContainer.right
        }

        Item {
            id: thumbContainer
            x: Math.max(0, Math.min(parent.width - width, control.visualPosition * parent.width - (width / 2)))
            y: (parent.height - height) / 2
            width: parent.height
            height: parent.height

            Behavior on x {
                enabled: !control.pressed
                SmoothedAnimation {
                    velocity: 200
                }
            }

            Rectangle {
                id: thumb
                property int adjustment: 0

                anchors.centerIn: parent
                implicitWidth: thumbContainer.width - adjustment
                implicitHeight: thumbContainer.height - adjustment

                Behavior on adjustment {
                    NumberAnimation {
                        duration: 50
                        easing.type: Easing.OutCubic
                    }
                }

                states: [
                    State {
                        name: "PRESSED"
                        when: control.pressed
                        PropertyChanges {
                            target: thumb
                            color: Contemporary.pressed(control.foreground)
                            adjustment: 6
                        }
                    },
                    State {
                        name: "RELEASED"
                        when: !control.pressed
                        PropertyChanges {
                            target: thumb
                            color: control.foreground
                            adjustment: 0
                        }
                    }
                ]

                transitions: [
                    Transition {
                        from: "PRESSED"
                        to: "RELEASED"
                        ColorAnimation {
                            target: thumb
                            properties: "color"
                            duration: 100
                            easing.type: Easing.OutCubic
                        }
                        NumberAnimation {
                            target: thumb
                            properties: "adjustment"
                            duration: 100
                            easing.type: Easing.OutCubic
                        }
                    },
                    Transition {
                        from: "RELEASED"
                        to: "PRESSED"
                        ColorAnimation {
                            target: thumb
                            properties: "color"
                            duration: 100
                            easing.type: Easing.OutCubic
                        }
                        NumberAnimation {
                            target: thumb
                            properties: "adjustment"
                            duration: 100
                            easing.type: Easing.OutCubic
                        }
                    }
                ]

                radius: 4
                color: control.foreground
            }

            FocusDecoration {
                anchors.fill: parent
                focused: control.visualFocus
                radius: 4
            }
        }

        Rectangle {
            anchors.fill: parent
            radius: 4
            color: "transparent"
            border.color: control.enabled ? Contemporary.translucentBorder : Contemporary.disabled(Contemporary.translucentBorder)
        }

        Label {
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: thumbContainer.right
            width: 24
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            text: "O"
        }

        Label {
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: thumbContainer.left
            width: 24
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            text: "I"
        }
    }

    contentItem: Label {
        leftPadding: control.indicator && !control.mirrored ? control.indicator.width + control.spacing : 0
        rightPadding: control.indicator && control.mirrored ? control.indicator.width + control.spacing : 0

        text: control.text
        font: control.font
        color: Contemporary.foreground
    }
}
