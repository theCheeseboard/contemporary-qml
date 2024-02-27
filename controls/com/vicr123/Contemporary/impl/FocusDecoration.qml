import QtQuick
import Contemporary

Item {
    id: root
    property alias radius: rect.radius
    property bool renderOutside: false
    property bool focused
    readonly property real baseMargins: root.renderOutside ? -3 : 0

    Rectangle {
        id: rect
        border.color: Contemporary.focusDecoration
        border.width: 3

        property real plusMargins: 0

        anchors.fill: parent
        anchors.margins: root.baseMargins - rect.plusMargins

        color: "transparent"
        z: 100000
        opacity: 0

        SequentialAnimation {
            running: true
            loops: Animation.Infinite
            ColorAnimation {
                target: rect.border
                property: "color"
                from: Contemporary.focusDecoration
                to: Contemporary.focusDecoration.lighter()
                duration: 500
                easing.type: Easing.InOutCubic
            }
            ColorAnimation {
                target: rect.border
                property: "color"
                from: Contemporary.focusDecoration.lighter()
                to: Contemporary.focusDecoration
                duration: 500
                easing.type: Easing.InOutCubic
            }
        }

        states: [
            State {
                name: "off"
                when: !root.focused
                PropertyChanges {
                    target: rect
                    plusMargins: 6
                    opacity: 0
                }
            },
            State {
                name: "on"
                when: root.focused
                PropertyChanges {
                    target: rect
                    plusMargins: 0
                    opacity: 1
                }
            }
        ]

        transitions: [
            Transition {
                to: "on"
                NumberAnimation {
                    properties: "plusMargins,opacity"
                    easing.type: Easing.OutCubic
                    duration: 150
                }
            },
            Transition {
                to: "off"
                NumberAnimation {
                    properties: "plusMargins,opacity"
                    easing.type: Easing.OutCubic
                    duration: 150
                }
            }
        ]
    }
}
