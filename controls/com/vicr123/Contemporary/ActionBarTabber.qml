import QtQuick
import QtQuick.Controls as QQ
import QtQuick.Layouts
import Contemporary
import com.vicr123.Contemporary.impl

Rectangle {
    color: Contemporary.accent
    radius: 4

    Layout.fillHeight: true
    Layout.preferredWidth: childrenRect.width

    default property alias data: buttonArea.data

    RowLayout {
        id: buttonArea
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        spacing: 2

        // Repeater {
        //     model: 2
        //     Button {
        //         required property int index
        //         text: qsTr("Button %1").arg(index)
        //         icon.name: "configure"
        //         checkable: true
        //         autoExclusive: true
        //         checked: index === 0
        //     }
        // }
    }

    component Button: QQ.Button {
        id: button
        signal activated

        checkable: true
        autoExclusive: true

        onCheckedChanged: () => {
            if (button.checked)
                button.activated();
        }
    }
}
