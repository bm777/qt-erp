import QtQuick 2.0
import QtQuick.Controls 2.15

Item {
    id: root
    property real id_id: value
    property string name: "pdt"
    property real qte: 0
    property string f: "Courier New"
    property int produit_id: 0
    property int facture_id: 0
    width: id_name.width * 1.2 + 70
    height: id_name.height * 1.2

    Rectangle {
        anchors.fill: parent
        color: "#eeeeee"
        border.color: "black"
    }
    Rectangle {id: frame
        anchors.centerIn: parent
        width: parent.width * 0.9
        height: parent.height * 0.95
        color: "transparent"

        Text {

            id: id_name
            text: root.name
            font {family: f;}
        }
        Text {
            id: id_value
            text: "("+ root.qte +")"
            font {family: f; pointSize: 10; bold: true}
            x: id_name.width + 20
        }


       Rectangle {
           x : frame.x + frame.width + 1
           width: closed.width * 2
           height: closed.height
           border.color: "red"
           anchors.verticalCenter: parent.verticalCenter
           Text {
               id: closed
                text: "x"
                color: "red"
                font {family: f;}
                anchors.centerIn: parent
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        print("closed "+ id_name.text)
                        bridge.delete_pf(id_id)

                        root.visible = false

                    }
                }
            }
       }


    }


}
