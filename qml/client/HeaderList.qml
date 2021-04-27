import QtQuick 2.0

/*
  documentation
  */

Item {
    id: root
    width: parent.width * 0.9
    height: parent.height * 0.07
    property string f: "Courier New"
    property color color_rect : "white"
    property string ref: "Référence"
    property string name: "Nom ou Raison S."
    property string type: "Type"
    property string box: "PO BOX"
    property string town: "Ville"
    property string tel: "Téléphone"
    property string mail: "eMail"
    property string site: "Site int."
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
        x: parent.width * 0.02
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
        width: id_name.width
        height: parent.height
        x: parent.width * 0.1
        Text {
            id: id_name
            anchors.verticalCenter: parent.verticalCenter
            text: root.name
            color: "#666666"
            font { family: f; bold: true; pointSize: 15}
        }
    }
    Rectangle {
        anchors.verticalCenter: parent.verticalCenter
        color: "transparent"
        width: id_type.width
        height: parent.height
        x: parent.width * 0.29
        Text {
            id: id_type
            anchors.verticalCenter: parent.verticalCenter
            text: root.type
            color: "#666666"
            font { family: f; bold: true; pointSize: 15}
        }
    }
    Rectangle {
        anchors.verticalCenter: parent.verticalCenter
        color: "transparent"
        width: id_box.width
        height: parent.height
        x: parent.width * 0.39
        Text {
            id: id_box
            anchors.verticalCenter: parent.verticalCenter
            text: root.box
            color: "#666666"
            font { family: f; bold: true; pointSize: 15}
        }
    }
    Rectangle {
        anchors.verticalCenter: parent.verticalCenter
        color: "transparent"
        width: id_town.width
        height: parent.height
        x: parent.width * 0.49
        Text {
            id: id_town
            anchors.verticalCenter: parent.verticalCenter
            text: root.town
            color: "#666666"
            font { family: f; bold: true; pointSize: 15}
        }
    }
    Rectangle {
        anchors.verticalCenter: parent.verticalCenter
        color: "transparent"
        width: id_tel.width
        height: parent.height
        x: parent.width * 0.59
        Text {
            id: id_tel
            anchors.verticalCenter: parent.verticalCenter
            text: root.tel
            color: "#666666"
            font { family: f; bold: true; pointSize: 15}
        }
    }
    Rectangle {
        anchors.verticalCenter: parent.verticalCenter
        color: "transparent"
        width: id_mail.width
        height: parent.height
        x: parent.width * 0.69
        Text {
            id: id_mail
            anchors.verticalCenter: parent.verticalCenter
            text: root.mail
            color: "#666666"
            font { family: f; bold: true; pointSize: 15}
        }
    }
    Rectangle {
        anchors.verticalCenter: parent.verticalCenter
        color: "transparent"
        width: id_site.width
        height: parent.height
        x: parent.width * 0.79
        Text {
            id: id_site
            anchors.verticalCenter: parent.verticalCenter
            text: root.site
            color: "#666666"
            font { family: f; bold: true; pointSize: 15}
        }
    }
    Rectangle {
        anchors.verticalCenter: parent.verticalCenter
        color: "transparent"
        width: id_rmq.width
        height: parent.height
        x: parent.width * 0.89
        Text {
            id: id_rmq
            anchors.verticalCenter: parent.verticalCenter
            text: root.rmq
            color: "#666666"
            font { family: f; bold: true; pointSize: 15}
        }
    }
}
