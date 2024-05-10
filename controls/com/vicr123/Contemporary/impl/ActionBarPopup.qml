import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Contemporary
import com.vicr123.Contemporary

Popup {
    id: root
    clip: true

    property Menu menu

    property bool exitButtonEnabled: true
    property bool exitButtonVisible: true

    signal aboutClicked

    modal: true
    transformOrigin: Item.TopLeft

    onClosed: menuPager.pop(firstMenu, StackView.Immediate)

    FocusScope {
        id: item

        implicitHeight: childrenRect.height + 12
        implicitWidth: childrenRect.width + 12

        Behavior on implicitHeight {
            NumberAnimation {
                duration: 50
            }
        }

        ColumnLayout {
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.margins: 6

            spacing: 2

            IconLabel {
                icon.source: "qrc:/libcontemporary-appassets/appicon.svg"
                icon.color: "transparent"
                icon.width: 24
                icon.height: 24
                spacing: 6
                text: Application.displayName
                color: Contemporary.foreground
            }

            Item {
                implicitHeight: 7
            }

            ContemporaryStackView {
                id: menuPager
                Layout.fillWidth: true
                implicitHeight: currentItem.implicitHeight
                implicitWidth: currentItem.implicitWidth
                // currentAnimation: ContemporaryStackView.Animation.Lift

                initialItem: firstMenu

                Item {
                    id: firstMenu
                    implicitHeight: childrenRect.height
                    implicitWidth: childrenRect.width

                    ColumnLayout {
                        anchors.left: parent.left
                        anchors.right: parent.right

                        ActionBarPopupMenu {
                            menu: root.menu
                            onClose: root.close()
                            onTriggerMenu: menu => menuPager.pushItem(submenuComponent, {"menu": menu})
                        }

                        RowLayout {
                            Button {
                                id: helpButton
                                icon.name: "help-contents"
                                implicitWidth: helpButton.height
                                flat: true

                                onClicked: menuPager.pushItem(helpComponent)
                            }

                            Item {
                                Layout.fillWidth: true
                            }

                            Button {
                                id: exitButton
                                icon.name: "application-exit"
                                implicitWidth: exitButton.height
                                flat: true

                                visible: root.exitButtonVisible
                                enabled: root.exitButtonEnabled

                                onClicked: Qt.quit()
                            }
                        }
                    }
                }

                Component {
                    id: submenuComponent

                    ActionBarPopupMenu {
                        onClose: root.close()
                        onGoBack: menuPager.pop()
                        showBackButton: true
                        onTriggerMenu: menu => menuPager.push(submenuComponent, {"menu": menu})
                    }
                }

                Component {
                    id: helpComponent

                    ActionBarPopupMenu {
                        showBackButton: true
                        onGoBack: menuPager.pop()
                        onClose: root.close()

                        icon.name: "help-contents"
                        icon.color: Contemporary.foreground
                        text: qsTr("Help")

                        menu: Menu {
                            Action {
                                id: fileBugAction
                                icon.name: "tools-report-bug"
                                text: qsTr("File Bug")
                                onTriggered: Qt.openUrlExternally(ContemporaryApplication.fileBugUrl)
                                enabled: ContemporaryApplication.fileBugUrl != ""
                            }

                            Action {
                                id: sourcesAction
                                icon.name: "commit"
                                text: qsTr("Sources")
                                onTriggered: Qt.openUrlExternally(ContemporaryApplication.sourcesUrl)
                                enabled: ContemporaryApplication.sourcesUrl != ""
                            }

                            MenuSeparator {}

                            Action {
                                icon.name: "help-about"
                                text: qsTr("About %1").arg(Application.displayName)
                                onTriggered: root.aboutClicked()
                            }
                        }
                    }
                }
            }
        }
    }

    Overlay.modal: Rectangle {
        id: overlay
        opacity: 0.7
        color: "black"
    }

    enter: Transition {
        ParallelAnimation {
            NumberAnimation {
                property: "scale"
                from: 0.7
                to: 1
                duration: 150
                easing.type: Easing.OutCubic
            }
            NumberAnimation {
                property: "opacity"
                from: 0
                to: 1
                duration: 150
                easing.type: Easing.OutCubic
            }
        }
    }

    exit: Transition {
        ParallelAnimation {
            NumberAnimation {
                property: "scale"
                from: 1
                to: 0.7
                duration: 150
                easing.type: Easing.OutCubic
            }
            NumberAnimation {
                property: "opacity"
                from: 1
                to: 0
                duration: 150
                easing.type: Easing.OutCubic
            }
        }
    }
}
