import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts

Control {
    id: rectangle
    Layout.fillHeight: true
    Layout.fillWidth: true

    ColumnLayout {
        RowLayout {
            SpinBox {
                id: spin1
                from: 0
                to: 100
                value: 50
                onValueChanged: slider1.value = spin1.value
            }

            Slider {
                id: slider1
                from: 0
                to: 100
                value: 50
                onValueChanged: spin1.value = slider1.value;
            }
        }


        SpinBox {
            from: 0
            to: items.length - 1
            value: 1 // "Medium"

            property var items: ["Small", "Medium", "Large"]

            textFromValue: function(value) {
                return items[value];
            }

            valueFromText: function(text) {
                for (var i = 0; i < items.length; ++i) {
                    if (items[i].toLowerCase().indexOf(text.toLowerCase()) === 0)
                        return i
                }
                return sb.value
            }
        }

    }
}
