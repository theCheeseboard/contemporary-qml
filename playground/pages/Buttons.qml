import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts
import com.vicr123.Contemporary

Control {
    id: rectangle
    Layout.fillHeight: true
    Layout.fillWidth: true

    RowLayout {
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
        }

        ColumnLayout {
            Button {
                text: qsTr("Flat Default Button")
                flat: true
            }

            Button {
                enabled: false
                flat: true
                text: qsTr("Flat Disabled Button")
            }

            Button {
                checkable: true
                flat: true
                text: qsTr("Flat Checkable Button")
            }
        }
    }
}
