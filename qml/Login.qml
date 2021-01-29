import QtQuick 2.0
import QtQuick.Controls 2.15

Item {
    id: login
    anchors.fill: parent
    // +++++++++++++++++++++++++++++++++++++++
    property string username: ""
    property string password: ""
    property string f: "Courier New"


    Item {
        id: text
        width: login.width * 0.4
        height: login.height * 0.95
        y: login.height * 0.025
        x: y

        Rectangle {
            anchors.fill: parent
//            color: "red"
            radius: 25
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#4b7fc9" }
                GradientStop { position: 1.0; color: "#3259a8" }
            }
        }
        // ++++++++++++++++++++++++++++

        Text {
            text: "Authentification"
            anchors.horizontalCenter: text.horizontalCenter
            font { family: f; pointSize: 25; bold: true }
            color: "white"
            y: login.height * 0.24
        }


        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Pocédere au
login avant
d'utiliser le
logiciel"
            y: login.height * 0.4
            color: "white"
            font { family: f; pointSize: 18}
        }


    }

    Item {
        id: form
        width: login.width * 0.6 - text.y
        height: login.height * 1
        x: login.width * 0.4 + text.y


        Text {
            text: "Login"
            font { family: f; pointSize: 30}
            anchors.horizontalCenter: parent.horizontalCenter
            y: form.height * 0.17
            color: "#4b7fc9"
        }
        // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
        TextField {
            id: _username
            anchors.horizontalCenter: parent.horizontalCenter
            width: form.width * 0.6
            height: form.height * 0.09
            y: form.height * 0.35
            placeholderText: "username"
            color: "black"
            horizontalAlignment: TextField.Center
            font { family: f; pointSize: 18}
        }
        TextField {
            id: _password
            anchors.horizontalCenter: parent.horizontalCenter
            width: form.width * 0.6
            height: form.height * 0.09
            y: form.height * 0.5
            placeholderText: "password"
            color: "black"
            horizontalAlignment: TextField.Center
            font { family: f; pointSize: 18}
            echoMode: TextField.Password
        }

        // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

    }
}
