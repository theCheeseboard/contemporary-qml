import QtQuick
import QtQuick.Controls
import Contemporary

Rectangle {
    id: control
    implicitWidth: 100
    implicitHeight: 40

    radius: 5

    property var buttonColor
    property bool flat
    property bool highlighted
    property bool checked
    property bool pressed
    property bool enabled
    property bool hovered

    color: buttonColor

    states: [
        State {
            name: "off"
            PropertyChanges {
                target: background
                color: control.buttonColor
            }
        },
        State {
            name: "disabled"
            when: !control.enabled
            PropertyChanges {
                target: background
                color: Contemporary.disabled(control.buttonColor)
            }
        },
        State {
            name: "pressed"
            when: control.highlighted || control.checked || control.pressed
            PropertyChanges {
                target: background
                color: Contemporary.pressed(control.buttonColor)
            }
        },
        State {
            name: "hovered"
            when: control.hovered
            PropertyChanges {
                target: background
                color: Contemporary.hovered(control.buttonColor)
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
