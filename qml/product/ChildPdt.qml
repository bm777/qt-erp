import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Window 2.6
import "../"

Window {
    id: root
    width: 800
    height: 800


    Component.onCompleted: {
            x = Screen.width / 2 - width / 2
            y = Screen.height / 2 - height / 2

        }

    Rectangle {
        anchors.fill: parent
        color: "#f4fcedda"
        Text {
            id: inside
            text: qsTr(ref)
        }
    }

    property string f: "Courier New"
    property color color_rect : "white"
    property string ref: "P00001"
    property string desc: "Notion de base en ENR"
    property real price: 150000
    property real tva: 19.25
    property string rmq: "Payement en liquide"


    Item {
        id: header
        width: parent.width
        height: parent.height * 0.07

        Rectangle {
            anchors.fill: parent
            color: "#ffd9d9d9"
            Text {
                text: "Modification du produit " + root.ref
                color: "#999999"
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font {family: f; pointSize: 20}
            }
        }
    }

    Item {
        id: content
        width: parent.width
        height: parent.height - header.height
        y: header.height

        FieldInput {
            id: input_ref
            label: "Référence"
            placeholder: "P00077"
            lock: true
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width * 0.5
            height: parent.height * 0.05
            y: parent.height * 0.08
        }
        FieldInput {
            id: input_desc
            label: "Description"
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width * 0.5
            height: parent.height * 0.05
            y: input_ref.y + input_ref.height + 5
        }
        FieldInput {
            id: input_price
            label: "Prix de vente"
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width * 0.5
            height: parent.height * 0.05
            y: input_desc.y + input_desc.height + 5
        }
        FieldInput {
            id: input_tva
            label: "Taux TVA (%)"
            value: "19.25"
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width * 0.5
            height: parent.height * 0.05
            y: input_price.y + input_price.height + 5
        }
        FieldInput {
            id: input_rmq
            label: "Remarques"
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width * 0.5
            height: parent.height * 0.05
            y: input_tva.y + input_tva.height + 5
        }
        Row {
            spacing: 100
            y: input_rmq.y + input_rmq.height + 20
            anchors.horizontalCenter: parent.horizontalCenter

            Btn {
                btn_text: "Annuler"
                size: 15
                btn_color: "transparent"
                btn_text_color: "#ff4285f4"
            }
            Btn {
                btn_text: "Enregistrer"
                size: 15
                btn_color: "#ff4285f4"
                btn_text_color: "#ffffff"
            }
        }
    }
}
