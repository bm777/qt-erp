import QtQuick 2.0

/*
  documentation
  */

Item {
    id: root
    width: parent.width * 0.7
    height: parent.height * 0.07
    property string f: "Courier New"
    property color color_rect : "white"
    property string ref: "Référence"
    property string client: "Client"
    property string emission: "Date d'émission"
    property string delay: "Délai"
    property string paiment: "Moyen de paiment"
    property string discount: "Remise (%)"
//    property string exp: "Export"

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
            color: "#666666"
            font { family: f; bold: true}
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
            color: "#666666"
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
            font { family: f; bold: true}
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
            font { family: f; bold: true}
        }
    }

}

