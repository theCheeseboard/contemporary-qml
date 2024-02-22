import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts

Control {
    id: rectangle
    Layout.fillHeight: true
    Layout.fillWidth: true

    ColumnLayout {
        Tumbler {
            model: 100
        }
    }

    ColumnLayout {
        Tumbler {
            enabled: false
            model: 100
        }
    }
}
