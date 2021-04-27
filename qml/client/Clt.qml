import QtQuick 2.0
import QtQuick.Controls 2.15

Rectangle {
    id: root
    width: parent.width * 0.9
    height: 100
    color: "transparent"
    property string f: "Courier New"
    property color color_rect : "white"
    property string ref: "C00001"
    property string name: "Abomo"
    property string type: "Standard Customer"
    property string box: "8950"
    property string town: "Yaounde"
    property real tel: 65555555
    property string mail: "mail@gmail.com"
    property string site: "site.cm"
    property string rmq: ""

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
        width: id_name.width
        height: parent.height
        x: parent.width * 0.1
        Text {
            id: id_name
            anchors.verticalCenter: parent.verticalCenter
            text: root.name
            color: "#ff4285f4"
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
            font { family: f; bold: false; italic: true; pointSize: 15}
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
            font { family: f; bold: false; italic: true; pointSize: 15}
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
            font { family: f; bold: false; italic: true; pointSize: 12}
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
            font { family: f; bold: false; italic: true; pointSize: 12}
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
            font { family: f; bold: false; italic: true; pointSize: 15}
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
            win.name = root.name;
            win.type = root.type
            win.box = root.box
            win.town = root.town
            win.tel = root.tel
            win.mail = root.mail
            win.site = root.site;
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

