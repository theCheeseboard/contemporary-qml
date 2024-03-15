import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Contemporary
import com.vicr123.Contemporary.impl

MouseArea {
    id: root
    height: childrenRect.height
    Layout.fillWidth: true

    default property alias contents: contentContainer.data
    property alias menuItems: windowMenu.contentData

    implicitHeight: childrenRect.height

    RowLayout {
        height: childrenRect.height
        anchors.left: root.left
        anchors.right: root.right

        Button {
            id: menuButton
            icon.source: "qrc:/libcontemporary-appassets/appicon.svg"
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

            visible: Qt.platform.os !== "osx"
        }

        Flickable {
            Layout.fillHeight: true
            Layout.fillWidth: true
            contentWidth: contentContainer.implicitWidth

            clip: true

            RowLayout {
                // LayoutMirroring.enabled: false
                // LayoutMirroring.childrenInherit: true

                anchors.fill: parent
                id: contentContainer
            }
        }

        // TODO: Add jobs button
    }

    onPressed: Window.window.startSystemMove();
}
