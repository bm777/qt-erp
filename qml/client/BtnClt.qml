import QtQuick 2.0

Item {
    id: root
//    property real _width: 200
//    property real _height: 100
    property string f: "Courier New"
    property string btn_text: "Test"
    property color btn_color: "#ffffff"
    property color btn_text_color: "#ffffff"
    property bool clicked: false
    property real size: 22
    property bool external: false

    width: btn.width * 1.2
    height: 50

    Rectangle {
        anchors.fill: parent
        width: root.width
        height: root.height
        color: "transparent"

        Canvas {
            anchors.fill: parent
            id: canvas
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true

                onEntered: {
                    root.btn_text_color = "#00ff00";
                }
                onClicked: {
                    if(root.clicked == false){
                        root.clicked = true
                        canvas.requestPaint();

                    }
//                        canvas.requestPaint();
                }
                onExited: {
                    if(root.btn_text === "Annuler") root.btn_text_color = "#ffffff";
                    if(root.btn_text === "Enregistrer") root.btn_text_color = "#ffffff";
                }

            }
            onPaint: {
                var c = canvas.getContext("2d");
                var w = parent.width;
                var h = parent.height;

                //++++drawing ouir custom button+++++++
                c.fillStyle = root.btn_color;      // color of filling
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
            text: root.btn_text
            font { family: f; pointSize: size}
            color: root.btn_text_color
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            onColorChanged: canvas.requestPaint()
        }
    }
}
