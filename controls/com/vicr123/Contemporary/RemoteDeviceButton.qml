import QtQuick
import QtQuick.Controls

Button {
    id: root
    icon.name: "computer"

    enum HealthStatus {
        Healthy,
        Alarm,
        Unresponsive
    }
    property int healthStatus: RemoteDeviceButton.HealthStatus.Healthy

    flat: true

    component StatusRectangle : Rectangle {
        id: statusRect
        border.color: borderColor
        border.width: 3

        property real plusMargins: 0
        property color borderColor
        property int targetHealthStatus

        anchors.fill: parent
        anchors.margins: -statusRect.plusMargins

        color: "transparent"
        z: 10
        opacity: 0
        radius: 4

        SequentialAnimation {
            running: statusRect.state === "on"
            loops: Animation.Infinite
            ColorAnimation {
                target: statusRect.border
                property: "color"
                from: statusRect.borderColor
                to: statusRect.borderColor.lighter()
                duration: 500
                easing.type: Easing.InOutCubic
            }
            ColorAnimation {
                target: statusRect.border
                property: "color"
                from: statusRect.borderColor.lighter()
                to: statusRect.borderColor
                duration: 500
                easing.type: Easing.InOutCubic
            }
        }

        states: [
            State {
                name: "off"
                when: root.healthStatus !== statusRect.targetHealthStatus
                PropertyChanges {
                    target: statusRect
                    plusMargins: 3
                    opacity: 0
                }
            },
            State {
                name: "on"
                when: root.healthStatus === statusRect.targetHealthStatus
                PropertyChanges {
                    target: statusRect
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

    StatusRectangle {
        borderColor: "#AA0000"
        targetHealthStatus: RemoteDeviceButton.HealthStatus.Unresponsive
    }
    StatusRectangle {
        borderColor: "orange"
        targetHealthStatus: RemoteDeviceButton.HealthStatus.Alarm
    }
}
