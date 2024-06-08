import QtQuick
import QtQuick.Controls as QQ
import QtQuick.Layouts
import Contemporary
import com.vicr123.Contemporary.impl

Item {
    id: root

    property string titleText
    property string messageText
    property string informativeText
    property list<Item> buttons

    component Button: QQ.Button {
        id: control
        Layout.fillWidth: true

        property bool destructive: false

        background: ButtonBackground {
            buttonColor: control.flat ? "transparent" : (control.destructive ? Contemporary.destructiveAccent : Contemporary.accent)
            flat: control.flat
            highlighted: control.highlighted
            checked: control.checked
            pressed: control.pressed
            enabled: control.enabled
            hovered: control.hovered

            // FocusDecoration {
            //     anchors.fill: parent
            //     focused: control.visualFocus
            //     radius: 4
            // }
        }
    }

    component CancelButton: Button {
        text: qsTr("Cancel")
        icon.name: "dialog-cancel"
    }
    component OkButton: Button {
        text: qsTr("OK")
        icon.name: "dialog-ok"
    }
    component NoButton: Button {
        text: qsTr("No")
        icon.name: "dialog-cancel"
    }
    component YesButton: Button {
        text: qsTr("Yes")
        icon.name: "dialog-ok"
    }
    component SaveButton: Button {
        text: qsTr("Save")
        icon.name: "document-save"
    }
    component DiscardButton: Button {
        text: qsTr("Discard")
        icon.name: "list-remove"
        destructive: true
    }
    component CloseButton: Button {
        text: qsTr("Close")
        icon.name: "dialog-ok"
    }

    function open() {
        popup.open()
    }

    function close() {
        popup.close()
    }

    QQ.Popup {
        id: popup
        parent: QQ.Overlay.overlay
        visible: root.isOpen
        modal: true
        closePolicy: Popup.CloseOnEscape

        x: Math.round((parent.width - width) / 2)
        y: Math.round((parent.height - height) / 2)
        width: Math.min(layout.implicitWidth, parent.width - 50, 900)
        height: Math.min(layout.implicitHeight, parent.height - 50)

        ColumnLayout {
            id: layout
            anchors.fill: parent

            Layer {
                Layout.fillWidth: true
                Layout.preferredHeight: childrenRect.height + 20
                visible: root.titleText

                QQ.Label {
                    x: 10
                    y: 10
                    text: root.titleText
                    font.pointSize: 15
                }
            }

            QQ.Label {
                Layout.fillHeight: true
                Layout.fillWidth: true

                text: root.messageText
                verticalAlignment: Qt.AlignVCenter
                visible: root.messageText !== ""
                padding: 10
                wrapMode: QQ.Label.Wrap

                height: Math.max(contentHeight + 40, 80)
            }

            QQ.Label {
                Layout.fillHeight: true
                Layout.fillWidth: true

                text: root.informativeText
                verticalAlignment: Qt.AlignVCenter
                visible: root.informativeText !== ""
                padding: 10
                color: Contemporary.disabled(Contemporary.foreground)
                wrapMode: QQ.Label.Wrap

                height: Math.max(contentHeight + 40, 80)
            }

            Layer {
                Layout.fillWidth: true
                Layout.preferredHeight: childrenRect.height + 20

                GridLayout {
                    x: 10
                    y: 10
                    width: parent.width - 20

                    readonly property bool verticalLayout: width < 600
                    columns: 1
                    rows: 1
                    flow: verticalLayout ? Grid.LeftToRight : Grid.TopToBottom

                    id: buttonContainer
                    data: root.buttons
                }
            }
        }
    }
}
