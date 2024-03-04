import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts
import com.vicr123.Contemporary
import Contemporary

Control {
    id: rectangle
    Layout.fillHeight: true
    Layout.fillWidth: true

    Grandstand {
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right

        id: grandstand

        innerTopMargin: SafeZone.top

        z: 10
        text: "Buttons";
        color: Contemporary.calculateLayer(2)
    }

    ColumnLayout {
        anchors.top: grandstand.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottomMargin: SafeZone.bottom
        anchors.topMargin: 6

        GroupBox {
            title: qsTr("Normal Buttons")
            implicitWidth: 600

            Layout.alignment: Qt.AlignHCenter | Qt.AlignTop

            RowLayout {
                anchors.fill: parent
                Button {
                    text: qsTr("Default Button")
                    onClicked: popover1.open()
                }

                Button {
                    enabled: false
                    text: qsTr("Disabled Button")
                }

                Button {
                    checkable: true
                    text: qsTr("Checkable Button")
                }
            }
        }

        GroupBox {
            title: qsTr("Flat Buttons")
            implicitWidth: 600

            Layout.alignment: Qt.AlignHCenter | Qt.AlignTop

            RowLayout {
                anchors.fill: parent
                Button {
                    text: qsTr("Flat Default Button")
                    flat: true
                }

                Button {
                    enabled: false
                    flat: true
                    text: qsTr("Flat Disabled Button")
                }

                Button {
                    checkable: true
                    flat: true
                    text: qsTr("Flat Checkable Button")
                }
            }
        }

        Item {
            Layout.fillHeight: true
        }
    }

    Drawer {
        id: popover1
        width: window.width + 1
        height: window.height
        edge: Qt.RightEdge
        interactive: false


        Drawer {
            id: popover2
            width: window.width - 400
            height: window.height
            edge: Qt.RightEdge
            interactive: false

            ColumnLayout {
                anchors.centerIn: parent

                Label {
                    text: "Popover 2 Contents"
                }

                Button {
                    text: "Close"
                    onClicked: popover2.close()
                }
            }
        }

        ColumnLayout {
            anchors.centerIn: parent

            Label {
                text: "Popover Contents"
            }

            Button {
                text: "Open another"
                onClicked: popover2.open()
            }

            Button {
                text: "Close"
                onClicked: popover1.close()
            }
        }
    }
}
