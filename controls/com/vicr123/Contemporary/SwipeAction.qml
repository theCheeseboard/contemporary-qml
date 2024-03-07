import QtQuick
import QtQuick.Controls
import Contemporary
import com.vicr123.Contemporary.impl

Item {
    id: root
    property alias text: label.text
    property alias icon: label.icon
    property bool leftSide
    property bool destructive: false

    implicitWidth: childrenRect.width + 6
    implicitHeight: childrenRect.height

    ButtonBackground {
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: root.leftSide ? parent.left : undefined
        anchors.right: root.leftSide ? undefined : parent.right

        buttonColor: root.destructive ? Contemporary.destructiveAccent : Contemporary.accent
        pressed: SwipeDelegate?.pressed ?? false
        enabled: true

        IconLabel {
            id: label
            anchors.centerIn: parent

            display: AbstractButton.TextUnderIcon
            color: Contemporary.foreground

            icon.width: 24
            icon.height: 24
            spacing: 9
            icon.color: Contemporary.foreground
        }
    }
}