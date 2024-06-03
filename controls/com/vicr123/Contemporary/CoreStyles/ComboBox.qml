import QtQuick
import QtQuick.Controls.impl
import QtQuick.Templates as T
import QtQuick.Controls.Basic as Basic
import com.vicr123.Contemporary
import com.vicr123.Contemporary.impl
import Contemporary

T.ComboBox {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding,
                             implicitIndicatorHeight + topPadding + bottomPadding)

    leftPadding: padding + (!control.mirrored || !indicator || !indicator.visible ? 0 : indicator.width + spacing)
    rightPadding: padding + (control.mirrored || !indicator || !indicator.visible ? 0 : indicator.width + spacing)

    delegate: Basic.ItemDelegate {
        required property var model
        required property int index

        width: ListView.view.width
        text: model[control.textRole]
        palette.text: control.palette.text
        palette.highlightedText: control.palette.highlightedText
        font.weight: control.currentIndex === index ? Font.DemiBold : Font.Normal
        highlighted: control.highlightedIndex === index
        hoverEnabled: control.hoverEnabled
    }

    indicator: IconLabel {
        mirrored: control.mirrored
        display: control.display
        x: control.mirrored ? control.leftPadding : control.width - width - control.rightPadding
        y: control.topPadding + (control.availableHeight - height) / 2

        transform: Scale {
            xScale: control.mirrored ? -1 : 1
            origin.x: indicator.width / 2
            origin.y: indicator.height / 2
        }

        icon.name: "arrow-down"
        icon.color: control.enabled ? Contemporary.foreground : Contemporary.disabled(Contemporary.foreground)
    }

    contentItem: TextField {
        id: textField
        leftPadding: !control.mirrored ? 12 : (control.editable && activeFocus ? 3 : 1) + indicator.width + 3
        rightPadding: control.mirrored ? 12 : (control.editable && activeFocus ? 3 : 1) + indicator.width + 3
        topPadding: 6 - control.padding
        bottomPadding: 6 - control.padding

        text: control.editable ? control.editText : control.displayText

        enabled: control.editable
        autoScroll: control.editable
        readOnly: control.down
        inputMethodHints: control.inputMethodHints
        validator: control.validator
        selectByMouse: control.selectTextByMouse
        color: control.enabled ? Contemporary.foreground : Contemporary.disabled(Contemporary.foreground)

        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: (control.flat ^ control.mirrored) ? Text.AlignRight : Text.AlignLeft

        TextMetrics {
            id: textFieldMetrics
            text: textField.text
            font: textField.font
        }

        background: Item {

        }
    }

    background: Layer {
        implicitWidth: control.flat ? textFieldMetrics.advanceWidth : 140
        implicitHeight: 40

        visible: !control.flat || control.down

        FocusDecoration {
            anchors.fill: parent
            focused: control.visualFocus || textField.activeFocus
            radius: 4
        }
    }

    popup: T.Popup {
        y: control.height
        width: control.flat ? Math.max(control.width, 140) : control.width
        height: Math.min(contentItem.implicitHeight, 300, control.Window.height - topMargin - bottomMargin)
        topMargin: 10
        bottomMargin: 10

        contentItem: ListView {
            clip: true
            implicitHeight: contentHeight
            model: control.delegateModel
            currentIndex: control.highlightedIndex
            highlightMoveDuration: 0

            Rectangle {
                z: 10
                width: parent.width
                height: parent.height
                color: "transparent"
                border.color: Contemporary.line
                radius: 4
            }

            // T.ScrollIndicator.vertical: ScrollIndicator { }
        }

        background: Rectangle {
            color: Contemporary.background
            radius: 4
        }
    }
}
