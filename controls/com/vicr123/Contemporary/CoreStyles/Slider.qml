import QtQuick
import QtQuick.Controls.impl
import QtQuick.Templates as T
import Contemporary
import com.vicr123.Contemporary.impl

T.Slider {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset, implicitHandleWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset, implicitHandleHeight + topPadding + bottomPadding)

    padding: 6

    readonly property var foreground: control.enabled ? Contemporary.foreground : Contemporary.disabled(Contemporary.foreground)
    readonly property var accent: control.enabled ? Contemporary.accent : Contemporary.disabled(Contemporary.accent)
    readonly property int thickness: 24

    handle: Item {
        x: control.leftPadding + (control.horizontal ? control.visualPosition * (control.availableWidth - width) : (control.availableWidth - width) / 2)
        y: control.topPadding + (control.horizontal ? (control.availableHeight - height) / 2 : control.visualPosition * (control.availableHeight - height))
        implicitWidth: control.thickness
        implicitHeight: control.thickness

        Rectangle {
            id: thumb
            property int adjustment: 0

            anchors.centerIn: parent
            implicitWidth: control.thickness - adjustment
            implicitHeight: control.thickness - adjustment

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

    background: Rectangle {
        x: control.leftPadding + (control.horizontal ? 0 : (control.availableWidth - width) / 2)
        y: control.topPadding + (control.horizontal ? (control.availableHeight - height) / 2 : 0)
        implicitWidth: control.horizontal ? 200 : control.thickness
        implicitHeight: control.horizontal ? control.thickness : 200
        width: control.horizontal ? control.availableWidth : implicitWidth
        height: control.horizontal ? implicitHeight : control.availableHeight
        radius: 4
        color: Contemporary.layer
        scale: control.horizontal && control.mirrored ? -1 : 1

        Rectangle {
            y: control.horizontal ? 0 : control.visualPosition * (parent.height - control.thickness)
            width: control.horizontal ? control.thickness + control.position * (parent.width - control.thickness) : control.thickness
            height: control.horizontal ? control.thickness : control.thickness + control.position * (parent.height - control.thickness)

            radius: 4
            color: control.accent
        }

        Rectangle {
            anchors.fill: parent
            radius: 4
            color: "transparent"
            border.color: control.enabled ? Contemporary.translucentBorder : Contemporary.disabled(Contemporary.translucentBorder)
        }
    }
}
