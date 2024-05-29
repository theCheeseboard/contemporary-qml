import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts
import com.vicr123.Contemporary
import Contemporary

Control {
    id: rectangle

    LayerCalculator {
        id: layer2
        layer: 2
    }

    Grandstand {
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right

        id: grandstand

        innerTopMargin: SafeZone.top

        z: 10
        text: "Text Input";
        color: layer2.color
    }

    ColumnLayout {
        anchors.top: grandstand.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottomMargin: SafeZone.bottom
        anchors.topMargin: 6

        GroupBox {
            title: qsTr("Text Fields")
            implicitWidth: Math.min(600, parent.width - 12)

            Layout.alignment: Qt.AlignHCenter | Qt.AlignTop

            ColumnLayout {
                anchors.fill: parent

                TextField {
                    Layout.fillWidth: true
                    placeholderText: qsTr("Text Field")
                }

                TextField {
                    Layout.fillWidth: true
                    enabled: false
                    placeholderText: qsTr("Disabled")
                }
            }
        }

        GroupBox {
            title: qsTr("Text Areas")
            implicitWidth: Math.min(600, parent.width - 12)

            Layout.alignment: Qt.AlignHCenter | Qt.AlignTop

            ColumnLayout {
                anchors.fill: parent

                TextArea {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 100
                    placeholderText: qsTr("Text Area")
                }

                TextArea {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 100
                    enabled: false
                    placeholderText: qsTr("Disabled")
                }
            }
        }
    }
}
