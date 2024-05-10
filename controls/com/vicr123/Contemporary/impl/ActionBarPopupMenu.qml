import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Contemporary

ColumnLayout {
    id: root
    property Menu menu
    property bool showBackButton
    property alias icon: title.icon
    property string text

    signal close
    signal goBack
    signal triggerMenu(Menu menu)

    IconLabel {
        id: title
        text: root.text
        visible: root.text != ""
        spacing: 9
        color: Contemporary.foreground
    }

    Button {
        flat: true
        Layout.fillWidth: true
        text: qsTr("Go Back")
        icon.name: "go-previous"
        visible: showBackButton

        onClicked: root.goBack()
    }

    Repeater {
        model: root.menu.contentData

        Item {
            id: rootItem
            Layout.fillWidth: true

            implicitHeight: button.visible ? button.height : separator.height
            implicitWidth: rootItem.itemType === "separator" ? 30 : button.implicitWidth

            required property var modelData;
            required property int index;
            readonly property string itemType: modelData.subMenu ? "menu" : modelData.action ? "menuItem" : "separator"
            readonly property var icon: modelData.icon

            Button {
                id: button
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.right: parent.right
                text: rootItem.modelData.text ?? rootItem.modelData.title
                icon: rootItem.icon
                flat: true
                visible: rootItem.itemType !== "separator"
                enabled: rootItem.modelData?.enabled

                contentItem: RowLayout {
                    IconLabel {
                        icon.name: rootItem.modelData.action?.checked ? "dialog-ok" : ""
                        icon.color: Contemporary.foreground
                        visible: rootItem.modelData.action?.checkable
                    }

                    IconLabel {
                        spacing: button.spacing
                        mirrored: button.mirrored
                        display: button.display

                        alignment: Qt.AlignLeft | Qt.AlignVCenter

                        icon: button.icon
                        text: button.text
                        font: button.font
                        color: button.enabled ? Contemporary.foreground : Contemporary.disabled(Contemporary.foreground)
                    }

                    Item {
                        Layout.fillWidth: true
                        implicitWidth: 20
                    }

                    Label {
                        text: rootItem.modelData.shortcut ?? ""
                        color: Contemporary.disabled(Contemporary.foreground)
                    }

                    IconLabel {
                        icon.name: "go-next"
                        icon.color: Contemporary.foreground
                        visible: rootItem.itemType == "menu"
                    }
                }

                onClicked: () => {
                    switch (rootItem.itemType) {
                        case "menu":
                            root.triggerMenu(modelData.subMenu)
                            break;
                        case "menuItem":
                            const action = modelData.action

                            if (action.checkable) {
                                // Toggle the action
                                action.checked = !action.checked;
                            } else {
                                action.triggered();
                            }

                            root.close()
                            break;
                    }
                }
            }


            Rectangle {
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
}
