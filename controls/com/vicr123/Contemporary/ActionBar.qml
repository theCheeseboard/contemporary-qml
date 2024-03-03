import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Contemporary
import com.vicr123.Contemporary.impl

MouseArea {
    id: root
    height: childrenRect.height
    Layout.fillWidth: true

    property Window control
    default property alias contents: contentContainer.data
    property alias menuItems: windowMenu.contentData

    implicitHeight: childrenRect.height

    RowLayout {
        height: childrenRect.height
        anchors.left: root.left
        anchors.right: root.right

        Button {
            id: menuButton
            icon.name: "com.vicr123.thebeat"
            icon.color: "transparent"
            flat: true
            Layout.preferredWidth: menuButton.height
            icon.width: 24
            icon.height: 24

            onClicked: {
                windowMenu.open()
            }

            Menu {
                id: windowMenu
                y: menuButton.height
            }
        }

        Flickable {
            Layout.fillHeight: true
            Layout.fillWidth: true
            contentWidth: contentContainer.width

            clip: true

            RowLayout {
                anchors.fill: parent
                id: contentContainer
            }
        }

        // TODO: Add jobs button
    }

    onPressed: root.control.startSystemMove();
}
