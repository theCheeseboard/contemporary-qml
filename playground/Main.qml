import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "pages" as Pages
import com.vicr123.Contemporary
import Contemporary
import Qt.labs.platform as Labs

ContemporaryWindow {
    id: window
    width: 640
    height: 480
    visible: true
    title: qsTr("Contemporary Playground")

    actionBar: ActionBar {
        control: window

        menuItems: [
            Menu {
                title: qsTr("Theme")

                Action {
                    text: qsTr("Light")
                }
                Action {
                    text: qsTr("Dark")
                }
            },
            MenuSeparator {},
            Action {
                text: qsTr("Exit")
                shortcut: "Ctrl+Q"
                onTriggered: window.close()
            }
        ]

        ActionBarTabber {

        }
    }

    overlayActionBar: true

    Labs.MenuBar {
        Labs.Menu {
            title: qsTr("&File")
            Labs.MenuItem { text: qsTr("&New...") }
            Labs.MenuItem { text: qsTr("&Open...") }
            Labs.MenuItem { text: qsTr("&Save") }
            Labs.MenuItem { text: qsTr("Save &As...") }
            MenuSeparator { }
            Labs.MenuItem { text: qsTr("&Quit"); onTriggered: window.close() }
        }
        Labs.Menu {
            title: qsTr("&Edit")
            Labs.MenuItem { text: qsTr("Cu&t") }
            Labs.MenuItem { text: qsTr("&Copy") }
            Labs.MenuItem { text: qsTr("&Paste") }
        }
        Labs.Menu {
            title: qsTr("&Help")
            Labs.MenuItem { text: qsTr("&About") }
        }
    }

    Rectangle {
        id: sidebarContainer
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        width: 300

        color: Contemporary.calculateLayer(1)
        radius: 4

        z: 10

        Grandstand {
            id: title
            anchors.top: parent.top;
            anchors.left: parent.left;
            anchors.right: parent.right

            innerTopMargin: SafeZone.top

            z: 10
            text: "Contemporary Playground";
            color: Contemporary.calculateLayer(2)
        }

        ListView {
            id: sidebar
            displayMarginBeginning: SafeZone.top
            displayMarginEnd: SafeZone.bottom
            anchors.top: title.bottom
            anchors.left: parent.left;
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.topMargin: 6

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

            Component {
                id: leftDelegate
                Item {
                    height: childrenRect.height + 3
                    width: sidebar.width

                    MouseArea {
                        anchors.fill: parent
                        onClicked: sidebar.currentIndex = index
                    }

                    Label {
                        id: leftDelegateLabel
                        anchors.top: parent.top
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.topMargin: 3
                        anchors.leftMargin: 6
                        anchors.rightMargin: 6

                        text: name
                    }
                }
            }

            delegate: leftDelegate

            highlight: Item {
                Rectangle {
                    anchors.fill: parent
                    anchors.leftMargin: 3
                    anchors.rightMargin: 3
                    color: Contemporary.accent;
                    radius: 4
                }
            }

            focus: true

            onCurrentIndexChanged: stack.currentIndex = sidebar.currentIndex
        }
    }

    Pager {
        id: stack
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.left: sidebarContainer.right
        anchors.leftMargin: 3

        currentAnimation: Pager.Animation.SlideHorizontal

        Pages.Buttons { }
        Pages.CheckboxesRadioButtons { }
        Pages.TextInput { }
        Pages.ComboBoxPage { }
        Pages.Progress { }
        Pages.Ranges { }
        Pages.TumblerPage { }
        Pages.Scrollable { }
    }
}
