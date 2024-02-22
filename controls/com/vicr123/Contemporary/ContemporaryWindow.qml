import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {
    id: window

    flags: Qt.Window | Qt.FramelessWindowHint

    default property alias contents: contentContainer.data
    property alias actionBar: actionBarLoader.sourceComponent

    minimumWidth: 640
    minimumHeight: 480

    ColumnLayout {
        anchors.fill: parent

        RowLayout {
            Layout.fillHeight: false

            Loader {
                id: actionBarLoader
                height: childrenRect.height
                Layout.fillWidth: true
            }
        }

        RowLayout {
            id: contentContainer
        }
    }
}
