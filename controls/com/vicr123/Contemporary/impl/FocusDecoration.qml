import QtQuick
import Contemporary

Item {
    id: root
    property alias radius: rect.radius
    property bool renderOutside: false

    Rectangle {
        id: rect
        border.color: Contemporary.focusDecoration
        border.width: 3

        anchors.fill: parent
        anchors.margins: root.renderOutside ? -3 : 0

        color: "transparent"
        z: 100000

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
    }
}
