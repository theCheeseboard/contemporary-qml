import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "components" as Components
import "patterns" as Patterns
import com.vicr123.Contemporary
import Contemporary
import Qt.labs.platform as Labs

import com.vicr123.Contemporary.CoreStyles

ContemporaryWindow {
    id: window

    width: 800
    height: 600
    title: qsTr("Contemporary Playground")
    visible: true

    LayerCalculator {
        id: layer1
        layer: 1
    }

    NativeMenuBar {
        Labs.Menu {
            title: qsTr("&File")

            Labs.MenuItem {
                text: qsTr("&Quit")

                onTriggered: window.close()
            }
        }
        Labs.Menu {
            title: qsTr("&Theme")

            Labs.MenuItem {
                id: followSystemAction
                text: qsTr("Follow System")
                checked: Contemporary.followSystemColorTheme
                checkable: true
                onCheckedChanged: followSystemAction.checked && (Contemporary.followSystemColorTheme = true)
            }
            Labs.MenuItem {
                id: lightAction
                text: qsTr("Light")
                checked: !Contemporary.followSystemColorTheme && Contemporary.colorTheme == Contemporary.Light
                checkable: true
                onCheckedChanged: lightAction.checked && Contemporary.setColorTheme(Contemporary.Light)
            }
            Labs.MenuItem {
                id: darkAction
                text: qsTr("Dark")
                checked: !Contemporary.followSystemColorTheme && Contemporary.colorTheme == Contemporary.Dark
                checkable: true
                onCheckedChanged: darkAction.checked && Contemporary.setColorTheme(Contemporary.Dark)
            }
        }
        Labs.Menu {
            title: qsTr("&Help")

            Labs.MenuItem {
                text: qsTr("&About")
                onTriggered: outerStack.push(aboutSurface)
            }
        }
    }

    ContemporaryStackView {
        id: outerStack
        anchors.fill: parent

        currentAnimation: ContemporaryStackView.Animation.Lift

        initialItem: ContemporaryWindowSurface {
            actionBar: ActionBar {
                menu: Menu {
                    Action {
                        text: qsTr("Add Surface")
                        icon.name: "list-add"
                        shortcut: "Ctrl+N"
                        onTriggered: outerStack.push(stackPush)
                    }
                    MenuSeparator { }
                    Menu {
                        title: qsTr("Theme")

                        Action {
                            id: followSystemAction
                            text: qsTr("Follow System")
                            checked: Contemporary.followSystemColorTheme
                            checkable: true
                            onCheckedChanged: followSystemAction.checked && (Contemporary.followSystemColorTheme = true)
                        }
                        Action {
                            id: lightAction
                            text: qsTr("Light")
                            checked: !Contemporary.followSystemColorTheme && Contemporary.colorTheme == Contemporary.Light
                            checkable: true
                            onCheckedChanged: lightAction.checked && Contemporary.setColorTheme(Contemporary.Light)
                        }
                        Action {
                            id: darkAction
                            text: qsTr("Dark")
                            checked: !Contemporary.followSystemColorTheme && Contemporary.colorTheme == Contemporary.Dark
                            checkable: true
                            onCheckedChanged: darkAction.checked && Contemporary.setColorTheme(Contemporary.Dark)
                        }
                    }
                }

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

                onAboutClicked: () => outerStack.push(aboutSurface)
            }
            overlayActionBar: true

            Pager {
                id: stack
                anchors.fill: parent

                Components.Root { }
                Patterns.Root { }
            }
        }

        Component {
            id: stackPush

            ContemporaryWindowSurface {
                actionBar: ActionBar {

                }
                overlayActionBar: true

                Grandstand {
                    id: grandstand
                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.right: parent.right
                    innerTopMargin: SafeZone.top
                    z: 20

                    text: qsTr("Extra Surface")
                    color: layer1.color

                    backButtonVisible: true
                    onBackButtonClicked: outerStack.pop()
                }
            }
        }

        Component {
            id: aboutSurface
            AboutSurface {
            }
        }
    }
}
