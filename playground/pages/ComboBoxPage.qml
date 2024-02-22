import QtQuick 2.15
import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts

Control {
    id: rectangle
    Layout.fillHeight: true
    Layout.fillWidth: true

    ColumnLayout {
        ComboBox {
            model: 100
        }

        ComboBox {
            enabled: false
            model: 100
        }
    }
}
