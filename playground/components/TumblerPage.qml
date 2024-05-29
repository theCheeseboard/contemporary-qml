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
        text: "Tumbler";
        color: layer2.color
    }

    ColumnLayout {
        anchors.top: grandstand.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottomMargin: SafeZone.bottom
        anchors.topMargin: 6

        GroupBox {
            title: qsTr("Tumblers")
            implicitWidth: Math.min(600, parent.width - 12)

            Layout.alignment: Qt.AlignHCenter | Qt.AlignTop

            RowLayout {
                anchors.fill: parent

                Item {
                    Layout.fillWidth: true
                }

                Tumbler {
                    model: 100
                }

                Tumbler {
                    enabled: false
                    model: 100
                }

                Item {
                    Layout.fillWidth: true
                }
            }
        }
    }
}
