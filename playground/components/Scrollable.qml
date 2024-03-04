import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts

Control {
    id: rectangle
    Layout.fillHeight: true
    Layout.fillWidth: true

    ScrollView {
        anchors.fill: parent
        clip: true

        Image {
            id: largeImage
            source: "/com/vicr123/Contemporary/playground/exploration.jpeg"
            anchors.top: parent.top
            anchors.left: parent.left
        }
    }
}