import QtQuick 2.0
import QtGraphicalEffects 1.12

Item {
    id: selector
    anchors.fill: parent
    property bool st_facture: {
        if(facture.clicked) {
//            facture.clicked = false
            erp_crm.clicked = false
            gmao.clicked = false
            mcar.clicked = false
            return true
        }return false
    }
    property bool st_erp_crm: {
        if(erp_crm.clicked) {
            facture.clicked = false
//            erp_crm.clicked = false
            gmao.clicked = false
            mcar.clicked = false
            return true
        }return false
    }
    property bool st_gmao: {
        if(gmao.clicked) {
            facture.clicked = false
            erp_crm.clicked = false
//            gmao.clicked = false
            mcar.clicked = false
            return true
        }return false
    }
    property bool st_mcar: {
        if(mcar.clicked) {
            facture.clicked = false
            erp_crm.clicked = false
            gmao.clicked = false
//            mcar.clicked = false
            return true
        }return false
    }

    ////////////////////// end of property


    Rectangle {
        anchors.fill: parent
        color: "#f4fcedda"
    }


    ///////////////////////////////////////////
    Rectangle {
        y: -parent.height * 0.8448
        x: parent.height * 0.8448
        width: parent.width * 0.05
        height: parent.width
        rotation: 270
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#3eadcf" }
            GradientStop { position: 1.0; color: "#abe9cd" }
        }
    }

    ///////////////////////////////////////////

    // +++++++++++++++++++++++++++++++++++++++++++++
    Row {
        id: row
        anchors.centerIn: parent
        spacing: 50

        Large {
            id: facture
            width: 300
            height: 100
            text: "GS/F"
            description: "Gestion de Stock & Facture"
            img: "../img/invoice.png"
            first: "#3eadcf"
            second: "#abe9cd"
            size: 20
        }
        Large {
            id: erp_crm
            width: 300
            height: 100
            text: "ERP/CRM"
            description: "Gestion RH & autre"
            img: "../img/person.png"
            first: "#6e45e1"
            second: "#89d4cf"
            size: 20
        }
        Large {
            id: gmao
            width: 300
            height: 100
            text: "DTI-GMAO"
            description: "GMAO"
            img: "../img/wallet.png"
            first: "#ff9f43"
            second: "#d3d3d3"
            size: 20
        }
        Large {
            id: mcar
            width: 300
            height: 100
            text: "DTI-MCar"
            description: "Car management"
            img: "../img/car.png"
            first: "#fe0944"
            second: "#feae96"
            size: 20
        }

    }
}
