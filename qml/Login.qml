import QtQuick 2.0
import QtQuick.Controls 2.15

Item {
    id: login
    anchors.fill: parent
    // +++++++++++++++++++++++++++++++++++++++
    property string username: ""
    property string password: ""
    property string f: "Courier New"
    property bool act: false


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


        Rectangle {
            anchors.horizontalCenter: parent.horizontalCenter
            width: 300
            height: 100
            y: parent.height * 0.7
            color: "transparent"




            Canvas {
                anchors.fill: parent
                id: canvas
                property string c_inside: "#3259a8"

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true

//                    onEntered: {
//                        canvas.c_inside   = "#403259a8";
//                        print("inside rectnagle");
//                    }
//                    onExited: {
//                        canvas.c_inside = "#3259a8";
//                        print("exited");
//                    }
                    onClicked: {

                        act = true
                        // ++++++++++++++
                        if("nani" == _username.text && "plok" == _password.text) {
                            btn.text = "..."
                            username = _username.text
                            password = _password.text
                        }


                    }

                }

                onPaint: {
                    var c = canvas.getContext("2d");
                    var w = parent.width;
                    var h = parent.height;


                    //++++drawing ouir custom button+++++++
                    c.fillStyle = canvas.c_inside;      // color of filling
                    c.lineWidth = 2                     // width of drawer line
                    c.beginPath();

                    // draw and move and lineTo
                    c.moveTo(0, h/5);
                    c.lineTo(0, h);
                    c.lineTo(w-h/5, h);
                    c.lineTo(w, 4*h/5);
                    c.lineTo(w, 0);
                    c.lineTo(h/5, 0);

                    // close path
                    c.closePath();


                    c.fill();
                    c.clip();
                }
            }
            Text {
                id: btn
                text: "Poursuivre"
                font { family: f; pointSize: 22}
                color: "white"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }
        }


    }
    // ++++++++++++++++++++++++++++++++++++
    SequentialAnimation {
        running: true
        PropertyAnimation {
            target: login
            property: "x"
            from: 0
            to: 1600
            duration: 1000
            easing.type: Easing.InOutQuad
        }
    }
}
