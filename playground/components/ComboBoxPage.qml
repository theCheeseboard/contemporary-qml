import QtQuick 2.15
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
        text: "Combo Box";
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
            title: qsTr("Combo Boxes")
            implicitWidth: Math.min(600, parent.width - 12)

            Layout.alignment: Qt.AlignHCenter | Qt.AlignTop

            ColumnLayout {
                anchors.fill: parent

                ComboBox {
                    model: 100
                }

                ComboBox {
                    enabled: false
                    model: 100
                }
            }
        }

        GroupBox {
            title: qsTr("Editable Combo Boxes")
            implicitWidth: Math.min(600, parent.width - 12)

            Layout.alignment: Qt.AlignHCenter | Qt.AlignTop

            ColumnLayout {
                anchors.fill: parent

                ComboBox {
                    model: 100
                    editable: true
                }

                ComboBox {
                    enabled: false
                    model: 100
                    editable: true
                }
            }
        }

        GroupBox {
            title: qsTr("Flat Combo Boxes")
            implicitWidth: Math.min(600, parent.width - 12)

            Layout.alignment: Qt.AlignHCenter | Qt.AlignTop

            ColumnLayout {
                anchors.fill: parent

                ComboBox {
                    model: 100
                    flat: true
                }

                ComboBox {
                    enabled: false
                    model: 100
                    flat: true
                }
            }
        }

        Item {
            Layout.fillHeight: true
        }
    }
}
