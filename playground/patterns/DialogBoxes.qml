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
        text: "Dialog Boxes";
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

                Label {
                    Layout.fillWidth: true
                    text: qsTr("Click on a button to open a dialog box.")
                }

                Button {
                    Layout.fillWidth: true
                    text: qsTr("Informational Dialog Box")
                    onClicked: informationalBox.open()
                }

                Button {
                    Layout.fillWidth: true
                    text: qsTr("Oh no! Goblins!")
                    onClicked: goblinBox.open()
                }

                Button {
                    Layout.fillWidth: true
                    text: qsTr("Shut down the nuclear reactor!")
                    onClicked: dangerBox.open()
                }
            }
        }

        Item {
            Layout.fillHeight: true
        }
    }

    DialogBox {
        id: informationalBox
        titleText: qsTr("Message Box Title")
        messageText: qsTr("This is the main text of the message box. It conveys the primary information or message that needs to be communicated to the user.")

        buttons: [
            DialogBox.CloseButton {
                onClicked: informationalBox.close()
            }
        ]
    }

    DialogBox {
        id: goblinBox
        messageText: qsTr(`After battling through hordes of goblins, you finally stand before the throne of the Goblin King himself. The grotesque creature eyes you with contempt from his towering seat.

"So, you're the meddlesome adventurer who's been causing trouble in my kingdom," he growls. "I'll give you one chance to save your miserable hide. Swear fealty to me, and I'll let you live as my servant. Refuse, and you'll spend the rest of your days in the darkest pit of my dungeons!"

The Goblin King leans forward, his putrid breath washing over you as he awaits your answer. The weight of your decision could shape the fate of the entire goblin realm.`)

        buttons: [
            DialogBox.Button {
                text: qsTr("Refuse")
                onClicked: goblinBox.close()
            },
            DialogBox.Button {
                text: qsTr("Swear Fealty")
                onClicked: goblinBox.close()
            }
        ]
    }

    DialogBox {
        id: dangerBox
        titleText: qsTr("Danger! Extremely Hazardous Operation")
        messageText: qsTr(`You are attempting to perform an extremely hazardous operation that could result in catastrophic consequences if not executed with extreme caution.

This operation has the potential to cause:
- Complete data loss
- Irreversible system damage
- Breach of security protocols
- Unrecoverable corruption

Only proceed if you are an expert user and fully understand the risks involved. Improper handling could lead to disastrous and irreparable results.`)
        informativeText: qsTr("This is the informative text displayed in grey below the main text. It provides additional context and warnings about the dangerous operation. Attempting this operation without proper expertise and precautions could lead to permanent and devastating damage to your systems and data. Proceed at your own risk.")

        buttons: [
            DialogBox.CancelButton {
                onClicked: dangerBox.close()
            },
            DialogBox.OkButton {
                destructive: true
                onClicked: dangerBox.close()
            }
        ]
    }
}
