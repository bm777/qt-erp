import QtQuick 2.15
import QtQuick.Window 2.13
import QtQuick.Controls 2.15

Window {
    title: qsTr("ERP")
    width: 1600
    height: 840
    visibility: "FullScreen"
    visible: true
    // ++++++++++++++++++++++++++++++++++++++


    // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    Busy {
        id: busy
        visible: false
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }

    Login {
        id: login
        x: 0
        visible: {
            if (login.username == "nani" && login.password == "plok") {
                busy.visible = true
                return  false
            }
            else{
                return  true //true
            }
        }

    }

    Erp {
        id: erp
        visible: false
    }


    SequentialAnimation {
        running: !login.visible

        PropertyAnimation {
            target: busy
            property: "visible"
            easing.type: Easing.InOutQuad
            duration: 500 + Math.floor(Math.random() * 500)
            to: "false"
        }
        PropertyAnimation {
            target: erp
            property: "visible"
            to: "true"
            duration: 5
            easing.type: Easing.InOutQuad
        }

    }










    // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

}
