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
    property string desc: "Description"
    property string price: "Prix de vente (HT)"
    property string tva: "Taux TVA (%)"
    property string rmq: "Remarques"

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
            color: "#666666"
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
            color: "#666666"
            font { family: f; bold: true; pointSize: 15}
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
            font { family: f; bold: true; pointSize: 15}
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
            font { family: f; bold: true; pointSize: 15}
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
            font { family: f; bold: true; pointSize: 15}
        }
    }
}

