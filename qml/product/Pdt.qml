import QtQuick 2.0
import QtQuick.Controls 2.15

Rectangle {
    id: root
    width: 100
    height: 100
    color: "transparent"
    property string f: "Courier New"
    property color color_rect : "white"
    property string ref: "P00001"
    property string desc: "Notion de base en ENR"
    property real price: 150000
    property real tva: 19.25
    property string rmq: "Payement en liquide"

    property variant win;

    Rectangle {
        anchors.fill: parent
        color: color_rect
    }
    Rectangle {
        anchors.verticalCenter: parent.verticalCenter
        color: "transparent"
        width: id_ref.width
        height: parent.height
        x: parent.width * 0.03
        Text {
            id: id_ref
            anchors.verticalCenter: parent.verticalCenter
            text: root.ref
            color: "black"
            font { family: f; bold: true; pointSize: 15}
        }
    }
    Rectangle {
        anchors.verticalCenter: parent.verticalCenter
        color: "transparent"
        width: id_desc.width
        height: parent.height
        x: parent.width * 0.18
        Text {
            id: id_desc
            anchors.verticalCenter: parent.verticalCenter
            text: root.desc
            color: "#ff4285f4"
            font { family: f; bold: true}
        }
    }
    Rectangle {
        anchors.verticalCenter: parent.verticalCenter
        color: "transparent"
        width: id_price.width
        height: parent.height
        x: parent.width * 0.42
        Text {
            id: id_price
            anchors.verticalCenter: parent.verticalCenter
            text: root.price
            color: "#666666"
            font { family: f; bold: true}
        }
    }
    Rectangle {
        anchors.verticalCenter: parent.verticalCenter
        color: "transparent"
        width: id_tva.width
        height: parent.height
        x: parent.width * 0.65
        Text {
            id: id_tva
            anchors.verticalCenter: parent.verticalCenter
            text: root.tva
            color: "#666666"
            font { family: f; bold: true}
        }
    }
    Rectangle {
        anchors.verticalCenter: parent.verticalCenter
        color: "transparent"
        width: id_rmq.width
        height: parent.height
        x: parent.width * 0.82
        Text {
            id: id_rmq
            anchors.verticalCenter: parent.verticalCenter
            text: root.rmq
            color: "#666666"
            font { family: f; bold: false; italic: true}
        }
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onEntered: {
            change.color = "#40b6b6b6"
        }
        onExited: {
            change.color = "transparent"
        }
        onClicked: {
            var component = Qt.createComponent("ChildPdt.qml");
            win = component.createObject(root);
            win.ref = root.ref;
            win.desc = root.desc;
            win.price = root.price;
            win.tva = root.tva;
            win.rmq = root.rmq;
            win.show();

        }
    }
    Rectangle {
        id: change
        anchors.fill: parent
        color: "transparent"
    }
}

