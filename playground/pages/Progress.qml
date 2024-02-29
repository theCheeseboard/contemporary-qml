import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts
import com.vicr123.Contemporary

Control {
    id: rectangle
    Layout.fillHeight: true
    Layout.fillWidth: true

    ColumnLayout {
        anchors.top: parent.top
        anchors.topMargin: SafeZone.top
        anchors.bottomMargin: SafeZone.bottom

        BusyIndicator {
            Layout.preferredHeight: 64
            Layout.preferredWidth: 64
        }

        BusyIndicator {

        }

        BusyIndicator {
            Layout.preferredHeight: 16
            Layout.preferredWidth: 16
        }

        ProgressBar {
            from: 0
            to: 100
            value: 24
        }


        ProgressBar {
            indeterminate: true
        }
    }
}
