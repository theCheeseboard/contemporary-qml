import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts

Control {
    id: rectangle
    Layout.fillHeight: true
    Layout.fillWidth: true

    ColumnLayout {
        TextField {
            placeholderText: qsTr("Text Field")
        }

        TextField {
            enabled: false
            placeholderText: qsTr("Disabled")
        }
    }
}
