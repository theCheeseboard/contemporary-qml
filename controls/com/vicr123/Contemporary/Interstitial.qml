import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.impl
import Contemporary
import com.vicr123.Contemporary.impl

Item {
    id: root
    property alias text: label.text
    property alias icon: label.icon
    property var color: Contemporary.foreground
    property string subtitle

    implicitWidth: childrenRect.width + 6
    implicitHeight: childrenRect.height

    ColumnLayout {
        anchors.fill: parent
        spacing: 9

        Item {
            Layout.fillHeight: true
        }

        IconLabel {
            id: label
            Layout.alignment: Qt.AlignHCenter

            display: AbstractButton.TextUnderIcon
            color: root.color
            font.pointSize: 20

            icon.width: 128
            icon.height: 128
            spacing: 20
            icon.color: Contemporary.disabled(root.color)
        }

        Label {
            Layout.alignment: Qt.AlignHCenter
            text: root.subtitle
            color: root.color
            visible: root.subtitle !== ""
            wrapMode: Text.Wrap
        }

        Item {
            Layout.fillHeight: true
        }
    }
}
