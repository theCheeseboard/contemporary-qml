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
        id: grandstand
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right

        innerTopMargin: SafeZone.top

        z: 10
        text: qsTr("Admonitions")
        color: layer2.color
    }

    ColumnLayout {
        anchors.top: grandstand.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottomMargin: SafeZone.bottom
        anchors.topMargin: 6

        GroupBox {
            title: qsTr("Admonitions")
            implicitWidth: Math.min(600, parent.width - 12)

            Layout.alignment: Qt.AlignHCenter | Qt.AlignTop

            ColumnLayout {
                anchors.fill: parent

                Admonition {
                    Layout.fillWidth: true
                    severity: Admonition.Info
                    title: qsTr("Informational Admonition")
                    text: qsTr("This is a string with information")
                }

                Admonition {
                    Layout.fillWidth: true
                    severity: Admonition.Warning
                    title: qsTr("Warning Admonition")
                    text: qsTr("This is a warning")
                }

                Admonition {
                    Layout.fillWidth: true
                    severity: Admonition.Error
                    title: qsTr("Error Admonition")
                    text: qsTr("This is an error")
                }
            }
        }
    }
}
