import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts
import com.vicr123.Contemporary
import Contemporary

Control {
    id: rectangle

    Grandstand {
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right

        id: grandstand

        innerTopMargin: SafeZone.top

        z: 10
        text: "Text Input";
        color: Contemporary.calculateLayer(2).value
    }

    ColumnLayout {
        anchors.top: grandstand.bottom
        anchors.bottomMargin: SafeZone.bottom
        anchors.topMargin: 6

        TextField {
            placeholderText: qsTr("Text Field")
        }

        TextField {
            enabled: false
            placeholderText: qsTr("Disabled")
        }
    }
}
