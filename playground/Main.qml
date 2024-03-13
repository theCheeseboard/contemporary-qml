import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "components" as Pages
import com.vicr123.Contemporary
import Contemporary
import Qt.labs.platform as Labs

ContemporaryWindow {
    id: window

    height: 480
    overlayActionBar: true
    title: qsTr("Contemporary Playground")
    visible: true
    width: 640

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
            MenuSeparator {
            },
            Action {
                shortcut: "Ctrl+Q"
                text: qsTr("Exit")

                onTriggered: window.close()
            }
        ]

        ActionBarTabber {
            ActionBarTabber.Button {
                text: qsTr("Components")
                checked: stack.currentIndex === 0
                onActivated: stack.currentIndex = 0
            }
            ActionBarTabber.Button {
                text: qsTr("Patterns")
                checked: stack.currentIndex === 1
                onActivated: stack.currentIndex = 1
            }
        }
    }

    Labs.MenuBar {
        Labs.Menu {
            title: qsTr("&File")

            Labs.MenuItem {
                text: qsTr("&New...")
            }
            Labs.MenuItem {
                text: qsTr("&Open...")
            }
            Labs.MenuItem {
                text: qsTr("&Save")
            }
            Labs.MenuItem {
                text: qsTr("Save &As...")
            }
            MenuSeparator {
            }
            Labs.MenuItem {
                text: qsTr("&Quit")

                onTriggered: window.close()
            }
        }
        Labs.Menu {
            title: qsTr("&Edit")

            Labs.MenuItem {
                text: qsTr("Cu&t")
            }
            Labs.MenuItem {
                text: qsTr("&Copy")
            }
            Labs.MenuItem {
                text: qsTr("&Paste")
            }
        }
        Labs.Menu {
            title: qsTr("&Help")

            Labs.MenuItem {
                text: qsTr("&About")
            }
        }
    }

    Pager {
        id: stack
        anchors.fill: parent

        Pages.Root { }
    }
}
