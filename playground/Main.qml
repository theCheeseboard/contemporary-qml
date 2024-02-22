import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "pages" as Pages
import com.vicr123.Contemporary
import Contemporary

ContemporaryWindow {
    id: window
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    actionBar: ActionBar {
        control: window
    }

    RowLayout {
        ListView {
            id: sidebar
            Layout.fillHeight: true
            width: 300

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
                    name: qsTr("Ranges")
                }
                ListElement {
                    name: qsTr("Tumbler")
                }
            }

            delegate: Text {
                text: name
                width: sidebar.width

                MouseArea {
                    anchors.fill: parent
                    onClicked: sidebar.currentIndex = index
                }
            }

            highlight: Rectangle {
                color: Contemporary.accent;
                radius: 5
            }

            focus: true

            onCurrentIndexChanged: stack.currentIndex = sidebar.currentIndex
        }

        StackLayout {
            id: stack
            Layout.fillHeight: true

            Pages.Buttons { }
            Pages.CheckboxesRadioButtons { }
            Pages.TextInput { }
            Pages.ComboBoxPage { }
            Pages.Ranges { }
            Pages.TumblerPage { }
        }
    }
}
