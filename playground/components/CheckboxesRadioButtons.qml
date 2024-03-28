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
        text: "Checkboxes and Radio Buttons";
        color: Contemporary.calculateLayer(2).value
    }

    ColumnLayout {
        anchors.top: grandstand.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottomMargin: SafeZone.bottom
        anchors.topMargin: 6

        GroupBox {
            title: qsTr("Checkboxes")
            implicitWidth: Math.min(600, parent.width - 12)

            Layout.alignment: Qt.AlignHCenter | Qt.AlignTop

            Grid {
                anchors.fill: parent
                columns: 3

                CheckBox {
                    text: qsTr("Off")
                }

                CheckBox {
                    checked: true
                    text: qsTr("On")
                }

                CheckBox {
                    checkState: Qt.PartiallyChecked
                    tristate: true
                    text: qsTr("Indeterminate")
                }

                CheckBox {
                    enabled: false
                    text: qsTr("Disabled Off")
                }

                CheckBox {
                    enabled: false
                    checked: true
                    text: qsTr("Disabled On")
                }

                CheckBox {
                    checkState: Qt.PartiallyChecked
                    tristate: true
                    enabled: false
                    text: qsTr("Disabled Indeterminate")
                }
            }
        }

        GroupBox {
            title: qsTr("Radio Buttons")
            implicitWidth: Math.min(600, parent.width - 12)

            Layout.alignment: Qt.AlignHCenter | Qt.AlignTop

            Grid {
                anchors.fill: parent
                columns: 2

                RadioButton {
                    text: qsTr("Off")
                }

                RadioButton {
                    checked: true
                    text: qsTr("On")
                }

                RadioButton {
                    enabled: false
                    text: qsTr("Disabled Off")
                }

                RadioButton {
                    enabled: false
                    checked: true
                    text: qsTr("Disabled On")
                }
            }
        }

        GroupBox {
            title: qsTr("Switches")
            implicitWidth: Math.min(600, parent.width - 12)

            Layout.alignment: Qt.AlignHCenter | Qt.AlignTop

            Grid {
                anchors.fill: parent
                columns: 2

                Switch {
                    text: qsTr("Off")
                }

                Switch {
                    checked: true
                    text: qsTr("On")
                }

                Switch {
                    enabled: false
                    text: qsTr("Disabled Off")
                }

                Switch {
                    enabled: false
                    checked: true
                    text: qsTr("Disabled On")
                }
            }
        }
    }
}
