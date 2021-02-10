import QtQuick 2.0
import QtQuick.Controls 2.15

Rectangle {
    id: root
    width: 300
    height: 50
    color: "white"
    property string label: "Ref"
    property string placeholder: ""
    property string value: ""
    property string gettext: input.text
    property bool lock: false

    Text {
        text: label
        anchors.verticalCenter: parent.verticalCenter
        x: parent.width * 0.08
        font { family: f; pointSize: 10}
        color: "#ff4285f4"
    }

    TextField {
        id: input
        width: parent.width * 0.58
        height: parent.height * 0.95
        y: (parent.height - height)/2
        x: parent.width - width - y
        placeholderText: placeholder
        color: "black"
        text: value
        enabled: !lock
        horizontalAlignment: TextField.left
        font { family: f; pointSize: 10}
        background: Rectangle {
            anchors.fill: parent
            color: "lightgray"
        }
//        Rectangle{
//            y: parent.height * 0.8
//            width: parent.width
//            height: 1; color: "lightgray"
//        }
    }

}
