import QtQuick
import QtQuick.Controls
import Contemporary

Button {
    id: jobButton
    icon.name: "star-shape"
    icon.color: Contemporary.foreground
    flat: true
    icon.width: 16
    icon.height: 16
    visible: jobModel.jobButtonVisible

    onClicked: {
        openJobPane();
    }

    function openJobPane() {
        jobModel.jobsShown();
        jobPopup.open();
    }

    JobModel {
        id: jobModel
    }

    Item {
        anchors.centerIn: parent
        width: 24
        height: 24
        z: 5

        Rectangle {
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            height: 4
            visible: jobModel.jobsPending

            color: "transparent"
            border.color: Contemporary.translucentBorder

            Rectangle {
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                color: Contemporary.foreground
                width: parent.width * jobModel.totalProgress
            }
        }

        Item {
            id: ping
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            width: 8
            height: 8
            visible: jobModel.ping !== 0

            // Pings:
            // 0: None
            // 1: Success
            // 2: Failure
            // 3: Attention required
            property color pingColor: [Qt.rgba(0, 0, 0, 0), Qt.rgba(0, 255, 0, 255), Qt.rgba(255, 0, 0, 255), Qt.rgba(255, 100, 0, 255)][jobModel.ping]

            Rectangle {
                anchors.fill: parent
                color: ping.pingColor
                radius: 4
            }

            Rectangle {
                id: pingBorder
                anchors.centerIn: parent
                width: 8
                height: 8
                radius: pingBorder.width / 2
                color: "transparent"
                border.color: ping.pingColor
                opacity: 1

                ParallelAnimation {
                    running: ping.visible
                    loops: Animation.Infinite

                    NumberAnimation {
                        target: pingBorder
                        property: "width"
                        from: 8
                        to: 24
                        duration: 2000
                        easing.type: Easing.OutCubic
                    }
                    NumberAnimation {
                        target: pingBorder
                        property: "height"
                        from: 8
                        to: 24
                        duration: 2000
                        easing.type: Easing.OutCubic
                    }
                    NumberAnimation {
                        target: pingBorder
                        property: "opacity"
                        from: 1
                        to: 0
                        duration: 2000
                        easing.type: Easing.OutCubic
                    }
                }
            }
        }
    }

    JobPopup {
        id: jobPopup
        x: jobButton.width - jobPopup.width
    }
}
