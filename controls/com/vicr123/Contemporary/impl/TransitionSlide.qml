import QtQuick

Item {
    Transition {
        id: animSlideHEnter
        ParallelAnimation {
            NumberAnimation {
                property: "opacity"
                from: 0
                to: 1
                duration: 150
                easing.type: Easing.OutCubic
            }
            XAnimator {
                from: Qt.application.layoutDirection === Qt.RightToLeft ? 50 : -50
                to: 0
                duration: 150
                easing.type: Easing.OutCubic
            }
        }
    }

    Transition {
        id: animSlideHExit
        ParallelAnimation {
            NumberAnimation {
                property: "opacity"
                from: 1
                to: 0
                duration: 150
                easing.type: Easing.OutCubic
            }
            XAnimator {
                from: 0
                to: Qt.application.layoutDirection === Qt.RightToLeft ? -50 : 50
                duration: 150
                easing.type: Easing.OutCubic
            }
        }
    }

    Transition {
        id: animSlideHEnterRev
        ParallelAnimation {
            NumberAnimation {
                property: "opacity"
                from: 0
                to: 1
                duration: 150
                easing.type: Easing.OutCubic
            }
            XAnimator {
                from: Qt.application.layoutDirection === Qt.RightToLeft ? -50 : 50
                to: 0
                duration: 150
                easing.type: Easing.OutCubic
            }
        }
    }

    Transition {
        id: animSlideHExitRev
        ParallelAnimation {
            NumberAnimation {
                property: "opacity"
                from: 1
                to: 0
                duration: 150
                easing.type: Easing.OutCubic
            }
            XAnimator {
                from: 0
                to: Qt.application.layoutDirection === Qt.RightToLeft ? 50 : -50
                duration: 150
                easing.type: Easing.OutCubic
            }
        }
    }

    function install(stack) {
        stack.pushEnter = animSlideHEnter;
        stack.pushExit = animSlideHExit;
        stack.popEnter = animSlideHEnterRev;
        stack.popExit = animSlideHExitRev;
    }
}