import QtQuick

Item {
    Transition {
        id: animFadeEnter
        NumberAnimation {
            property: "opacity"
            from: 0
            to: 1
            duration: 150
            easing.type: Easing.OutCubic
        }
    }

    Transition {
        id: animFadeExit
        NumberAnimation {
            property: "opacity"
            from: 1
            to: 0
            duration: 150
            easing.type: Easing.OutCubic
        }
    }

    function install(stack) {
        stack.pushEnter = animFadeEnter;
        stack.pushExit = animFadeExit;
        stack.popEnter = animFadeEnter;
        stack.popExit = animFadeExit;
    }
}