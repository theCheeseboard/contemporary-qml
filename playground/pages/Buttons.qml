import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts
import com.vicr123.Contemporary

Control {
    id: rectangle
    Layout.fillHeight: true
    Layout.fillWidth: true

    ColumnLayout {
        Button {
            text: qsTr("Default Button")
        }

        Button {
            enabled: false
            text: qsTr("Disabled Button")
        }

        Button {
            checkable: true
            text: qsTr("Checkable Button")
        }

        ExampleControl { }
    }
}
