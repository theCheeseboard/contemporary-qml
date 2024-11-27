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
    property Menu menu

    property bool exitButtonVisible: true
    property bool exitButtonEnabled: true

    signal aboutClicked

    implicitHeight: childrenRect.height

    function openJobPane() {
        jobButton.openJobPane();
    }

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
                actionBarPopup.open();
            }

            ActionBarPopup {
                id: actionBarPopup
                menu: root.menu
                exitButtonVisible: root.exitButtonVisible
                exitButtonEnabled: root.exitButtonEnabled
                onAboutClicked: () => root.aboutClicked()
            }

            visible: Qt.platform.os !== "osx"
        }

        Flickable {
            id: flickable
            Layout.fillHeight: true
            Layout.fillWidth: true
            contentWidth: contentContainer.implicitWidth

            clip: true

            MouseArea {
                anchors.top: parent.top
                anchors.bottom: parent.bottom

                implicitWidth: flickable.width

                onPressed: () => {
                    Window.window.startSystemMove();
                    flickable.cancelFlick();
                }
                onReleased: flickable.cancelFlick()
            }

            RowLayout {
                anchors.fill: parent

                RowLayout {
                    // LayoutMirroring.enabled: false
                    // LayoutMirroring.childrenInherit: true

                    id: contentContainer
                }
            }
        }

        JobButton {
            id: jobButton
            Layout.preferredWidth: jobButton.height
        }
    }

    onPressed: Window.window.startSystemMove()
}
