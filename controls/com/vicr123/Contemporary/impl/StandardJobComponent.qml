import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import com.vicr123.Contemporary

Item {
    required property var job
    implicitHeight: childrenRect.height
    implicitWidth: 600

    GroupBox {
        anchors.left: parent.left
        anchors.right: parent.right
        title: job.title

        ColumnLayout {
            id: mainLayout
            anchors.left: parent.left
            anchors.right: parent.right

            Label {
                Layout.fillWidth: true
                text: job.status
                wrapMode: Text.WordWrap
            }

            ProgressBar {
                indeterminate: job.totalProgress === 0
                from: 0
                to: job.totalProgress
                value: job.progress
                Layout.fillWidth: true
                visible: job.state !== 1 && job.state !== 2 // Not finished or failed
            }
        }
    }
}
