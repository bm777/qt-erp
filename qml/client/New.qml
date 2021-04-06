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
    property string ref: "C00024"



    Item {
        id: header
        width: parent.width
        height: parent.height * 0.07

        Rectangle {
            anchors.fill: parent
            color: "#ffd9d9d9"
            Text {
                text: "Enregistrement d'un client"
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
            id: input_name
            label: "Nom ou Raison S."
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width * 0.5
            height: parent.height * 0.05
            y: input_ref.y + input_ref.height + 5
        }
        FieldInput {
            id: input_type
            label: "Type"
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width * 0.5
            height: parent.height * 0.05
            y: input_name.y + input_name.height + 5
        }
        FieldInput {
            id: input_box
            label: "PO BOX"
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width * 0.5
            height: parent.height * 0.05
            y: input_type.y + input_type.height + 5
        }
        FieldInput {
            id: input_town
            label: "Ville"
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width * 0.5
            height: parent.height * 0.05
            y: input_box.y + input_box.height + 5
        }
        FieldInput {
            id: input_tel
            label: "Téléphone"
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width * 0.5
            height: parent.height * 0.05
            y: input_town.y + input_town.height + 5
        }
        FieldInput {
            id: input_mail
            label: "eMail"
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width * 0.5
            height: parent.height * 0.05
            y: input_tel.y + input_tel.height + 5
        }
        FieldInput {
            id: input_site
            label: "Site internet"
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width * 0.5
            height: parent.height * 0.05
            y: input_mail.y + input_mail.height + 5
        }
        FieldInput {
            id: input_rmq
            label: "Remarque"
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width * 0.5
            height: parent.height * 0.05
            y: input_site.y + input_site.height + 5
        }
        Row {
            spacing: 100
            y: input_rmq.y + input_rmq.height + 20
            anchors.horizontalCenter: parent.horizontalCenter

            BtnClt {
                btn_text: "Annuler"
                size: 15
                btn_color: "lightgray"
                btn_text_color: "#ff4285f4"
                onClickedChanged: root.close()
            }
            BtnClt {
                btn_text: "Enregistrer"
                size: 15
                btn_color: "#ff4285f4"
                btn_text_color: "#ffffff"
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        bridge.insert_client(input_ref.gettext,input_name.gettext,input_type.gettext,input_box.gettext,input_town.gettext,input_tel.gettext,input_mail.gettext,input_site.gettext,input_rmq.gettext)
                        root.close()
                    }
                }
            }
        }
    }
}
