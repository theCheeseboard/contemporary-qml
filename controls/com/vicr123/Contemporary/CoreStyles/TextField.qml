import QtQuick
import QtQuick.Controls.impl
import QtQuick.Templates as T
import Contemporary

T.TextField {
    id: control

    implicitWidth: implicitBackgroundWidth + leftInset + rightInset
        || Math.max(contentWidth, placeholder.implicitWidth) + leftPadding + rightPadding
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
        contentHeight + topPadding + bottomPadding,
        placeholder.implicitHeight + topPadding + bottomPadding)

    padding: 0
    leftPadding: padding + 4

    color: control.enabled ? Contemporary.foreground : Contemporary.disabled(Contemporary.foreground)
    selectionColor: Contemporary.accent
    selectedTextColor: Contemporary.foreground
    placeholderTextColor: Contemporary.disabled(Contemporary.foreground)
    verticalAlignment: TextInput.AlignVCenter

    PlaceholderText {
        id: placeholder
        x: control.leftPadding
        y: control.topPadding
        width: control.width - (control.leftPadding + control.rightPadding)
        height: control.height - (control.topPadding + control.bottomPadding)

        text: control.placeholderText
        font: control.font
        color: control.placeholderTextColor
        verticalAlignment: control.verticalAlignment
        visible: !control.length && !control.preeditText && (!control.activeFocus || control.horizontalAlignment !== Qt.AlignHCenter)
        elide: Text.ElideRight
        renderType: control.renderType
    }

    background: Rectangle {
        id: rectangle
        implicitWidth: 200
        implicitHeight: 40
        color: "transparent"

        Rectangle {
            id: borderBottom
            anchors.left: rectangle.left
            anchors.right: rectangle.right
            anchors.bottom: rectangle.bottom
            height: 1
            color: Contemporary.line


            Rectangle {
                id: focusBorder
                anchors.centerIn: borderBottom
                height: 1
                width: 0
                color: Contemporary.foreground

                states: [
                    State {
                        name: ""
                        PropertyChanges {
                            target: focusBorder
                            width: 0
                        }
                    },
                    State {
                        name: "on"
                        when: control.activeFocus && !control.readOnly
                        PropertyChanges {
                            target: focusBorder
                            width: borderBottom.width
                        }
                    }
                ]

                Behavior on width {
                    NumberAnimation {
                        duration: 150
                        easing.type: Easing.OutCubic
                    }
                }
            }
        }
    }
}
