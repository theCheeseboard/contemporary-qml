import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import com.vicr123.Contemporary.impl

MouseArea {
    id: root
    height: childrenRect.height
    Layout.fillWidth: true
    property Window control

    RowLayout {
        height: childrenRect.height
        anchors.left: root.left
        anchors.right: root.right

        Button {
            text: qsTr("Button");
            onClicked: root.control.close()
        }

        Button {
            text: qsTr("Button");
            onClicked: root.control.showFullScreen()
        }

        Rectangle {
            Layout.fillWidth: true
        }

        WindowControls {
            control: root.control
        }
    }

    onPressed: root.control.startSystemMove();
}
