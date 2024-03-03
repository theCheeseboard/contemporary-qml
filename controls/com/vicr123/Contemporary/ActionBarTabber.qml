import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Contemporary
import com.vicr123.Contemporary.impl

Rectangle {
    color: Contemporary.accent
    radius: 4

    Layout.fillHeight: true
    Layout.preferredWidth: childrenRect.width

    RowLayout {
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        spacing: 2

        Repeater {
            model: 2
            Button {
                required property int index
                text: qsTr("Button %1").arg(index)
                icon.name: "configure"
                checkable: true
                autoExclusive: true
                checked: index === 0
            }
        }
    }
}
