import QtQuick 2.0
import QtQuick.Controls 2.15

Rectangle {
    id: root
    width: 100
    height: 100
    color: "transparent"
    property string f: "Courier New"
    property color color_rect : "white"
    property string ref: "F00001"
    property string client: "C00001"
    property string type: "facture"
    property string emission: "08/02/2021"
    property string delay: "08/02/2021"
    property string paiment: "Cash"
    property string code: "facture"
    property real discount: 8

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
        x: parent.width * 0.02
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
        width: id_client.width
        height: parent.height
        x: parent.width * 0.18
        Text {
            id: id_client
            anchors.verticalCenter: parent.verticalCenter
            text: root.client
            color: "#ff4285f4"
            font { family: f; bold: true}
        }
    }Rectangle {
        anchors.verticalCenter: parent.verticalCenter
        color: "transparent"
        width: id_type.width
        height: parent.height
        x: parent.width * 0.26
        Text {
            id: id_type
            anchors.verticalCenter: parent.verticalCenter
            text: root.type
            color: "#ff4285f4"
            font { family: f; bold: true}
        }
    }
    Rectangle {
        anchors.verticalCenter: parent.verticalCenter
        color: "transparent"
        width: id_emission.width
        height: parent.height
        x: parent.width * 0.34
        Text {
            id: id_emission
            anchors.verticalCenter: parent.verticalCenter
            text: root.emission
            color: "#666666"
            font { family: f; bold: true}
        }
    }
    Rectangle {
        anchors.verticalCenter: parent.verticalCenter
        color: "transparent"
        width: id_delay.width
        height: parent.height
        x: parent.width * 0.50
        Text {
            id: id_delay
            anchors.verticalCenter: parent.verticalCenter
            text: root.delay
            color: "#666666"
            font { family: f; bold: true}
        }
    }
    Rectangle {
        anchors.verticalCenter: parent.verticalCenter
        color: "transparent"
        width: id_paiment.width
        height: parent.height
        x: parent.width * 0.66
        Text {
            id: id_paiment
            anchors.verticalCenter: parent.verticalCenter
            text: root.paiment
            color: "#666666"
            font { family: f; bold: false; italic: true}
        }
    }
    Rectangle {
        anchors.verticalCenter: parent.verticalCenter
        color: "transparent"
        width: id_discount.width
        height: parent.height
        x: parent.width * 0.82
        Text {
            id: id_discount
            anchors.verticalCenter: parent.verticalCenter
            text: root.discount
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
            var component = Qt.createComponent("Modification.qml");
            win = component.createObject(root);
            win.ref = root.ref;
            win.code = root.code;
            win.client = root.client;
            win.emission = root.emission;
            win.delay = root.delay;
            win.paiment = root.paiment;
            win.discount = root.discount;
            win.show();

        }
    }
    Rectangle {
        id: change
        anchors.fill: parent
        color: "transparent"
    }
}

