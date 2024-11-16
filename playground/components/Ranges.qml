import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts
import com.vicr123.Contemporary
import Contemporary

Control {
    id: root

    property int value: 50

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
        text: "Ranges"
        color: layer2.color
    }

    ColumnLayout {
        anchors.top: grandstand.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottomMargin: SafeZone.bottom
        anchors.topMargin: 6

        GroupBox {
            title: qsTr("Spin Boxes")
            implicitWidth: Math.min(600, parent.width - 12)

            Layout.alignment: Qt.AlignHCenter | Qt.AlignTop

            ColumnLayout {
                anchors.fill: parent

                SpinBox {
                    id: spin1
                    from: 0
                    to: 100
                    value: root.value
                    onValueChanged: root.value = spin1.value
                }

                SpinBox {
                    from: 0
                    to: items.length - 1
                    value: 1 // "Medium"

                    property var items: ["Small", "Medium", "Large"]

                    textFromValue: function (value) {
                        return items[value];
                    }

                    valueFromText: function (text) {
                        for (var i = 0; i < items.length; ++i) {
                            if (items[i].toLowerCase().indexOf(text.toLowerCase()) === 0)
                                return i;
                        }
                        return sb.value;
                    }
                }
            }
        }

        GroupBox {
            title: qsTr("Horizontal Sliders")
            implicitWidth: Math.min(600, parent.width - 12)

            Layout.alignment: Qt.AlignHCenter | Qt.AlignTop

            ColumnLayout {
                anchors.fill: parent

                Slider {
                    id: slider1
                    from: 0
                    to: 100
                    value: root.value
                    onValueChanged: root.value = slider1.value
                }

                Slider {
                    id: slider2
                    from: 0
                    to: 100
                    value: root.value
                    onValueChanged: root.value = slider2.value
                    enabled: false
                }
            }
        }

        GroupBox {
            title: qsTr("Vertical Sliders")
            implicitWidth: Math.min(600, parent.width - 12)

            Layout.alignment: Qt.AlignHCenter | Qt.AlignTop

            RowLayout {
                anchors.fill: parent

                Slider {
                    id: slider3
                    from: 0
                    to: 100
                    value: root.value
                    onValueChanged: root.value = slider3.value
                    orientation: Qt.Vertical
                }

                Slider {
                    id: slider4
                    from: 0
                    to: 100
                    value: root.value
                    onValueChanged: root.value = slider4.value
                    enabled: false
                    orientation: Qt.Vertical
                }
            }
        }
    }
}
