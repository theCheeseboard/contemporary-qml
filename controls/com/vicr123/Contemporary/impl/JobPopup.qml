import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.impl
import Contemporary
import com.vicr123.Contemporary

Popup {
    id: root
    clip: true
    popupType: Popup.Window
    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside

    modal: false
    dim: true
    transformOrigin: Item.TopRight

    LayerCalculator {
        id: layer1
        layer: 1
    }

    FocusScope {
        id: item

        implicitHeight: childrenRect.height + 12
        implicitWidth: childrenRect.width

        Behavior on implicitHeight {
            NumberAnimation {
                duration: 50
            }
        }

        Grandstand {
            id: grandstand
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            text: qsTr("Jobs")
            implicitWidth: 300
            color: layer1.color
        }

        ColumnLayout {
            anchors.top: grandstand.bottom
            anchors.left: parent.left
            anchors.margins: 6

            spacing: 2

            ContemporaryStackView {
                id: menuPager
                Layout.fillWidth: true
                implicitHeight: currentItem.implicitHeight
                implicitWidth: currentItem.implicitWidth

                initialItem: firstMenu

                Item {
                    id: firstMenu
                    implicitHeight: childrenRect.height
                    implicitWidth: 300

                    ListView {
                        model: JobModel {}
                        height: childrenRect.height
                        width: parent.implicitWidth
                        spacing: 6

                        delegate: Component {
                            Loader {
                                id: jobComponent
                                width: firstMenu.implicitWidth - 6
                                required property var job

                                Component.onCompleted: () => {
                                    jobComponent.setSource(job.qmlFile, {
                                        job: job
                                    });
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    Overlay.modeless: Rectangle {
        id: overlay
        opacity: 0.7
        color: "black"

        MouseArea {
            anchors.fill: parent
            onPressed: root.close()
        }
    }

    enter: Transition {
        ParallelAnimation {
            NumberAnimation {
                property: "scale"
                from: 0.7
                to: 1
                duration: 150
                easing.type: Easing.OutCubic
            }
            NumberAnimation {
                property: "opacity"
                from: 0
                to: 1
                duration: 150
                easing.type: Easing.OutCubic
            }
        }
    }

    exit: Transition {
        ParallelAnimation {
            NumberAnimation {
                property: "scale"
                from: 1
                to: 0.7
                duration: 150
                easing.type: Easing.OutCubic
            }
            NumberAnimation {
                property: "opacity"
                from: 1
                to: 0
                duration: 150
                easing.type: Easing.OutCubic
            }
        }
    }
}
