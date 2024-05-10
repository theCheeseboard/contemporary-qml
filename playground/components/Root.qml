import QtQuick
import QtQuick.Controls
import com.vicr123.Contemporary
import Contemporary
import "." as Pages

Item {
    Rectangle {
        id: sidebarContainer

        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.top: parent.top
        color: Contemporary.calculateLayer(1).value
        radius: 4
        width: 300
        z: 10

        Grandstand {
            id: title

            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            color: Contemporary.calculateLayer(2).value
            innerTopMargin: SafeZone.top
            text: qsTr("Components")
            z: 10
        }
        ListView {
            id: sidebar

            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: title.bottom
            anchors.topMargin: 6
            delegate: leftDelegate
            displayMarginBeginning: SafeZone.top
            displayMarginEnd: SafeZone.bottom
            focus: true

            highlight: Item {
                Rectangle {
                    anchors.fill: parent
                    anchors.leftMargin: 3
                    anchors.rightMargin: 3
                    color: Contemporary.accent
                    radius: 4
                }
            }
            model: ListModel {
                ListElement {
                    name: qsTr("Buttons")
                }
                ListElement {
                    name: qsTr("Checkboxes and Radio Buttons")
                }
                ListElement {
                    name: qsTr("Text Input")
                }
                ListElement {
                    name: qsTr("Combo Box")
                }
                ListElement {
                    name: qsTr("Progress")
                }
                ListElement {
                    name: qsTr("Ranges")
                }
                ListElement {
                    name: qsTr("Tumbler")
                }
                ListElement {
                    name: qsTr("Scrollable")
                }
            }

            onCurrentIndexChanged: stack.currentIndex = sidebar.currentIndex

            Component {
                id: leftDelegate

                Item {
                    implicitHeight: childrenRect.height + 3
                    implicitWidth: sidebar.width

                    MouseArea {
                        anchors.fill: parent

                        onClicked: sidebar.currentIndex = index
                    }
                    Label {
                        id: leftDelegateLabel

                        anchors.left: parent.left
                        anchors.leftMargin: 6
                        anchors.right: parent.right
                        anchors.rightMargin: 6
                        anchors.top: parent.top
                        anchors.topMargin: 3
                        text: name
                    }
                }
            }
        }
    }
    Pager {
        id: stack

        anchors.bottom: parent.bottom
        anchors.left: sidebarContainer.right
        anchors.leftMargin: 3
        anchors.right: parent.right
        anchors.top: parent.top
        currentAnimation: Pager.Animation.Lift

        Pages.Buttons {
        }
        Pages.CheckboxesRadioButtons {
        }
        Pages.TextInput {
        }
        Pages.ComboBoxPage {
        }
        Pages.Progress {
        }
        Pages.Ranges {
        }
        Pages.TumblerPage {
        }
        Pages.Scrollable {
        }
    }
}
