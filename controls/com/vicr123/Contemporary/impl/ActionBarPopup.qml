import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Contemporary

Popup {
    id: root

    property list<QtObject> menuItems

    // width: item.width
    // height: item.height

    // y: parent.height + 9

    modal: true
    transformOrigin: Item.TopLeft

    Item {
        id: item

        implicitHeight: childrenRect.height + 12
        implicitWidth: childrenRect.width + 12

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

            Repeater {
                model: root.menuItems

                Item {
                    id: rootItem
                    Layout.fillWidth: true

                    implicitHeight: button.visible ? button.height : separator.height
                    implicitWidth: childrenRect.width

                    required property var modelData;
                    readonly property string itemType: modelData.addMenu ? "menu" : modelData.triggered ? "menuItem" : "separator"

                    Button {
                        id: button
                        anchors.top: parent.top
                        anchors.left: parent.left
                        anchors.right: parent.right
                        text: rootItem.modelData.text ?? rootItem.modelData.title
                        icon: rootItem.modelData.icon
                        flat: true
                        visible: rootItem.itemType !== "separator"

                        contentItem: IconLabel {
                            spacing: button.spacing
                            mirrored: button.mirrored
                            display: button.display

                            alignment: Qt.AlignLeft | Qt.AlignVCenter

                            icon: button.icon
                            text: button.text
                            font: button.font
                            color: button.enabled ? Contemporary.foreground : Contemporary.disabled(Contemporary.foreground)
                        }

                        onClicked: () => {
                                       switch (rootItem.itemType) {
                                           case "menu":
                                           break;
                                           case "menuItem":
                                           rootItem.modelData.triggered()
                                           root.close()
                                           break;
                                       }
                       }
                    }

                    Rectangle {
                        property bool exitButtonVisible: true
                        property bool exitButtonEnabled: true
                        id: separator
                        anchors.top: parent.top
                        anchors.left: parent.left
                        anchors.right: parent.right
                        implicitHeight: 1
                        color: Contemporary.line
                        visible: rootItem.itemType === "separator"
                    }
                }
            }

            RowLayout {
                Button {
                    id: helpButton
                    icon.name: "help-contents"
                    implicitWidth: helpButton.height
                    flat: true
                }

                Item {
                    Layout.fillWidth: true
                }

                Button {
                    id: exitButton
                    icon.name: "application-exit"
                    implicitWidth: exitButton.height
                    flat: true
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
