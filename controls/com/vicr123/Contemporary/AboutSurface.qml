import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import com.vicr123.Contemporary.impl
import Contemporary

ContemporaryWindowSurface {
    id: root

    actionBar: ActionBar {

    }

    overlayActionBar: true

    readonly property var stackView: StackView.view

    Grandstand {
        id: grandstand
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right

        innerTopMargin: SafeZone.top

        text: qsTr("About %1").arg(Application.displayName)
        backButtonVisible: true

        onBackButtonClicked: root.stackView.pop()
    }

    Flickable {
        id: flickable
        anchors.top: grandstand.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom

        ColumnLayout {
            anchors.top: parent.top
            anchors.left: parent.left
            implicitWidth: flickable.width
            spacing: 10

            Item {
                Layout.alignment: Qt.AlignHCenter
                implicitWidth: 600
                implicitHeight: childrenRect.height + 128

                Item {
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter
                    implicitHeight: childrenRect.height

                    GridLayout {
                        columns: 2
                        columnSpacing: 6
                        rowSpacing: 6

                        implicitHeight: childrenRect.height

                        IconLabel {
                            icon.source: "qrc:/libcontemporary-appassets/appicon.svg"
                            icon.color: "transparent"
                            icon.width: 48
                            icon.height: 48
                        }

                        Label {
                            text: Application.displayName
                            font.pointSize: 30
                        }

                        Item { }

                        Label {
                            text: ContemporaryApplication.genericName
                        }

                        Item {}

                        Rectangle {
                            color: Contemporary.accent
                            radius: 4

                            implicitHeight: childrenRect.height
                            implicitWidth: childrenRect.width

                            Row {
                                spacing: 2

                                Button {
                                    icon.name: "text-html"
                                    text: qsTr("Website")
                                    visible: ContemporaryApplication.websiteUrl != ""
                                    onClicked: Qt.openUrlExternally(ContemporaryApplication.websiteUrl)
                                }
                                Button {
                                    icon.name: "tools-report-bug"
                                    text: qsTr("File Bug")
                                    visible: ContemporaryApplication.fileBugUrl != ""
                                    onClicked: Qt.openUrlExternally(ContemporaryApplication.fileBugUrl)
                                }
                                Button {
                                    icon.name: "commit"
                                    text: qsTr("Sources")
                                    visible: ContemporaryApplication.sourcesUrl != ""
                                    onClicked: Qt.openUrlExternally(ContemporaryApplication.sourcesUrl)
                                }
                            }
                        }
                    }
                }

            }

            GroupBox {
                Layout.alignment: Qt.AlignHCenter
                implicitWidth: 600
                title: qsTr("Software")

                GridLayout {
                    anchors.left: parent.left
                    anchors.right: parent.right
                    columns: 2
                    columnSpacing: 6

                    Repeater {
                        model: ContemporaryApplication.softwareVersions

                        Label {
                            required property string modelData
                            Layout.fillWidth: true
                            text: modelData
                        }
                    }
                }
            }

            GroupBox {
                Layout.alignment: Qt.AlignHCenter
                implicitWidth: 600
                title: qsTr("Copyright")

                Column {
                    anchors.left: parent.left
                    anchors.right: parent.right

                    Repeater {
                        model: ContemporaryApplication.copyrightLines

                        Label {
                            required property string modelData
                            Layout.fillWidth: true
                            text: modelData
                        }
                    }
                }
            }

            Item {
                Layout.fillHeight: true
            }
        }
    }
}
