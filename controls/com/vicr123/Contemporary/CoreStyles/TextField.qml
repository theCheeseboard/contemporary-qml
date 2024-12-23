import QtQuick
import QtQuick.Controls.impl
import QtQuick.Templates as T
import Contemporary
import com.vicr123.Contemporary.impl

T.TextField {
    id: control

    implicitWidth: implicitBackgroundWidth + leftInset + rightInset || Math.max(contentWidth, placeholder.implicitWidth) + leftPadding + rightPadding
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset, contentHeight + topPadding + bottomPadding, placeholder.implicitHeight + topPadding + bottomPadding)

    padding: 4
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
        implicitHeight: 30
        radius: 4
        color: Contemporary.layer
        border.color: control.enabled ? Contemporary.translucentBorder : Contemporary.disabled(Contemporary.translucentBorder)

        FocusDecoration {
            anchors.fill: parent
            focused: control.visualFocus || control.activeFocus
            radius: 4
        }
    }
}
