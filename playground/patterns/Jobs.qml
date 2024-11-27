import QtQuick 2.15
import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts
import com.vicr123.Contemporary
import Contemporary
import playground

Control {
    id: rectangle

    JobsPaneController {
        id: controller
    }

    LayerCalculator {
        id: layer2
        layer: 2
    }

    Grandstand {
        id: grandstand
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right

        innerTopMargin: SafeZone.top

        z: 10
        text: qsTr("Jobs")
        color: layer2.color
    }

    ColumnLayout {
        anchors.top: grandstand.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottomMargin: SafeZone.bottom
        anchors.topMargin: 6

        GroupBox {
            title: qsTr("Jobs")
            implicitWidth: Math.min(600, parent.width - 12)

            Layout.alignment: Qt.AlignHCenter | Qt.AlignTop

            ColumnLayout {
                anchors.fill: parent

                Label {
                    Layout.fillWidth: true
                    text: qsTr("Jobs represent long running processes that are currently running in the background. When a job is added, it shows in the Jobs pane in the top right corner of the window.")
                    wrapMode: Text.WordWrap
                }

                Button {
                    Layout.fillWidth: true
                    text: qsTr("Start Normal Job")
                    onClicked: controller.addJob()
                }
                Button {
                    Layout.fillWidth: true
                    text: qsTr("Start Indeterminate Processing Job")
                    onClicked: controller.addIndeterminateJob()
                }
                Button {
                    Layout.fillWidth: true
                    text: qsTr("Start Transient Job")
                    onClicked: controller.addTransientJob()
                }
                Button {
                    Layout.fillWidth: true
                    text: qsTr("Start Failing Job")
                    onClicked: controller.addFailingJob()
                }
            }
        }

        Item {
            Layout.fillHeight: true
        }
    }
}
