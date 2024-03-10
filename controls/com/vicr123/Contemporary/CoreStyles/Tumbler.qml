import QtQuick
import QtQuick.Controls.impl
import QtQuick.Templates as T
import Contemporary
import com.vicr123.Contemporary.impl

T.Tumbler {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
        implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
        implicitContentHeight + topPadding + bottomPadding)

    delegate: Text {
        text: modelData
        color: Contemporary.foreground
        font: control.font
        opacity: 1.0 - Math.abs(Tumbler.displacement) / (control.visibleItemCount / 2)
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter

        // We use required property here to satisfy qmllint, but that means
        // we also need to declare the index for the attached properties
        // (see QQuickTumblerAttachedPrivate::init).
        required property var modelData
        required property int index
    }

    contentItem: TumblerView {
        implicitWidth: 60
        implicitHeight: 200
        model: control.model
        delegate: control.delegate
        path: Path {
            startX: control.contentItem.width / 2
            startY: -control.contentItem.delegateHeight / 2
            PathLine {
                x: control.contentItem.width / 2
                y: (control.visibleItemCount + 1) * control.contentItem.delegateHeight - control.contentItem.delegateHeight / 2
            }
        }

        property real delegateHeight: control.availableHeight / control.visibleItemCount

        Rectangle {
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter

            color: Contemporary.layer
            radius: 4
            height: control.contentItem.delegateHeight

            FocusDecoration {
                id: focusDecoration
                anchors.fill: parent
                focused: control.visualFocus
                radius: 4
                renderOutside: true
            }
        }
    }
}
