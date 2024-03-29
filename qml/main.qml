import QtQuick 2.15
import QtQuick.Window 2.13
import QtQuick.Controls 2.15

Window {
    title: qsTr("ERP")
    width: Screen.width         //1600
    height: Screen.height       // 840
    visibility: "FullScreen"
    visible: true
    property real t: 1000
    // ++++++++++++++++++++++++++++++++++++++


    // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    Busy {
        id: busy
        visible: false
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

        Behavior on visible {

            PropertyAnimation { to: false; duration: t}
        }
    }

    Login {
        id: login
        x: 0
        visible: {
            if (login.username == "nani" && login.password == "plok") {
                busy.visible = true
                return false
            }
            else {
                return true //true
            }
        }
    }

    Erp {
        id: erp
        visible: {
            selector.visible = false
            return selector.st_facture
        }
    }

    Selector {
        id: selector
        visible: {

            return true
        }

    }




    SequentialAnimation {
        running: !login.visible
        PropertyAnimation {
            target: busy
            property: "visible"
            to: true
            duration: 5
            easing.type: Easing.InOutQuad
        }
        PropertyAnimation {
            target: selector
            property: "visible"
            to: true
            duration: t
            easing.type: Easing.InOutQuad
        }
    }








    // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

}
