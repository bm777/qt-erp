import QtQuick 2.13
import QtQuick.Window 2.13

Window {
    title: qsTr("ERP")
    width: 1600
    height: 840
//    visibility: "FullScreen"
    visible: true

    Login {
        id: login
    }

}
