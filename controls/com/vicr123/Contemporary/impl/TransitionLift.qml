import QtQuick

Item {
    Transition {
        id: animLiftEnter
        ParallelAnimation {
            NumberAnimation {
                property: "opacity"
                from: 0
                to: 1
                duration: 150
                easing.type: Easing.OutCubic
            }
            YAnimator {
                from: 50
                to: 0
                duration: 150
                easing.type: Easing.OutCubic
            }
        }
    }

    Transition {
        id: animLiftExit
        ParallelAnimation {
            NumberAnimation {
                property: "opacity"
                from: 1
                to: 0
                duration: 150
                easing.type: Easing.OutCubic
            }
        }
    }

    function install(stack) {
        stack.pushEnter = animLiftEnter;
        stack.pushExit = animLiftExit;
        stack.popEnter = animLiftEnter;
        stack.popExit = animLiftExit;
    }
}