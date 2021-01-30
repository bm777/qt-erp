import QtQuick 2.0

Item {
    id: erp
    anchors.fill: parent
    Rectangle {
        anchors.fill: parent
        color: "#54fcedda"
    }

    Item {
        id: header
        width: parent.width
        height: parent.height * 0.08

        Rectangle{
            anchors.fill: parent
            color: "#ff4285f4"
        }

        Btn {
            id: btn_produit
            x: parent.width * 0.02
            height: header.height
            btn_text: "<b>BD</b> <b>P</b>roduits"
            btn_color: "#ffffff"
            btn_text_color: "#ff4285f4"
        }
        Btn {
            id: btn_client
            x: btn_produit.x + btn_produit.width + 20
            height: header.height
            btn_text: "<b>BD</b> <b>C</b>lients"
            btn_color: "#ff4285f4"
            btn_text_color: "#ffffff"
        }
        Btn {
            id: btn_facture
            x: btn_client.x + btn_client.width + 20
            height: header.height
            btn_text: "<b>F</b>actures/<b>P</b>roformas"
            btn_color: "#ff4285f4"
            btn_text_color: "#ffffff"
        }
        Btn {
            id: btn_export
            x: btn_facture.x + btn_facture.width + 20
            height: header.height
            btn_text: "<b>E</b>xport"
            btn_color: "#ff4285f4"
            btn_text_color: "#ffffff"
        }
        Btn {
            id: btn_service
            x: btn_export.x + btn_export.width + 20
            height: header.height
            btn_text: "<b>N</b>os <b>S</b>ervices"
            btn_color: "#ff4285f4"
            btn_text_color: "#ffffff"
        }

    }

    // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    Item {
        id: footer
    }
}
