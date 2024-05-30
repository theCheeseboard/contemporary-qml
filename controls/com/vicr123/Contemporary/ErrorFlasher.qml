import QtQuick

Rectangle {
    id: root
    color: Qt.rgba(1, 0, 0, root.flashStage)
    radius: 4

    property real flashStage: 0

    function flash() {
        root.state = "flash"
        root.state = "off"
    }

    state: "off"

    states: [
        State {
            name: "off"
            PropertyChanges {
                target: root
                flashStage: 0
            }
        },
        State {
            name: "flash"
            PropertyChanges {
                target: root
                flashStage: 1
                state: "off"
            }
        }
    ]

    transitions: [
        Transition {
            from: "flash"
            to: "off"
            reversible: false
            NumberAnimation {
                properties: "flashStage"
                duration: 500
            }
        }
    ]
}
