import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Window 2.6


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
    property string client: "C00001"
    property string emission: "08/02/2021"
    property string delay: "08/02/2021"
    property string paiment: "Cash"
    property real discount: 5


    Item {
        id: header
        width: parent.width
        height: parent.height * 0.07

        Rectangle {
            anchors.fill: parent
            color: "#ffd9d9d9"
            Text {
                text: "Modification de " + root.ref
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
//            placeholder: "P00077"
            lock: true
            value: root.ref
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width * 0.5
            height: parent.height * 0.05
            y: parent.height * 0.08
        }
        FieldInput {
            id: input_client
            label: "Client"
            value: root.client
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width * 0.5
            height: parent.height * 0.05
            y: input_ref.y + input_ref.height + 5
        }
        FieldInput {
            id: input_emission
            label: "Date d'émission"
            value: root.emission
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width * 0.5
            height: parent.height * 0.05
            y: input_client.y + input_client.height + 5
        }
        FieldInput {
            id: input_delay
            label: "Délai"
            value: root.delay
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width * 0.5
            height: parent.height * 0.05
            y: input_emission.y + input_emission.height + 5
        }
        FieldInput {
            id: input_paiment
            label: "Moyen de paie"
            value: root.paiment
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width * 0.5
            height: parent.height * 0.05
            y: input_delay.y + input_delay.height + 5
        }
        FieldInput {
            id: input_discount
            label: "Remise G."
            value: root.discount
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width * 0.5
            height: parent.height * 0.05
            y: input_paiment.y + input_paiment.height + 5
        }
        Row {
            spacing: 100
            y: input_discount.y + input_discount.height + 20
            anchors.horizontalCenter: parent.horizontalCenter

            BtnF {
                btn_text: "Annuler"
                size: 15
                btn_color: "lightgray"
                btn_text_color: "#ff4285f4"
                onClickedChanged: root.close()
            }
            BtnF {
                btn_text: "Enregistrer"
                size: 15
                btn_color: "#ff4285f4"
                btn_text_color: "#ffffff"
                onClickedChanged: root.close()
            }
        }
    }
}