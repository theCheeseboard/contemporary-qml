import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts
import com.vicr123.Contemporary
import Contemporary

Control {
    id: rectangle

    Grandstand {
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right

        id: grandstand

        innerTopMargin: SafeZone.top

        z: 10
        text: "Progress";
        color: Contemporary.calculateLayer(2).value
    }

    ColumnLayout {
        anchors.top: grandstand.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottomMargin: SafeZone.bottom
        anchors.topMargin: 6

        // BusyIndicator {
        //     Layout.preferredHeight: 64
        //     Layout.preferredWidth: 64
        // }
        //
        // BusyIndicator {
        //
        // }
        //
        // BusyIndicator {
        //     Layout.preferredHeight: 16
        //     Layout.preferredWidth: 16
        // }

        GroupBox {
            title: qsTr("Progress Bars")
            implicitWidth: Math.min(600, parent.width - 12)

            Layout.alignment: Qt.AlignHCenter | Qt.AlignTop

            ColumnLayout {
                anchors.fill: parent

                ProgressBar {
                    Layout.fillWidth: true
                    from: 0
                    to: 100
                    value: 24
                }

                ProgressBar {
                    Layout.fillWidth: true
                    indeterminate: true
                }
            }
        }
    }
}
