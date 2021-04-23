import QtQuick 2.12
import QtQuick.Controls 2.12

ComboBox {
    id: control
    model: ["First", "Second", "Third", "Third", "Third of the republick of cameroon"]

    delegate: ItemDelegate {
        width: control.width
        contentItem: Text {
            text: modelData
            color: "#ff4285f4"
            font: control.font
            elide: Text.ElideRight
            verticalAlignment: Text.AlignVCenter
        }
        highlighted: control.highlightedIndex === index
    }

    indicator: Canvas {
        id: canvas
        x: control.width - width - control.rightPadding
        y: control.topPadding + (control.availableHeight - height) / 2
        width: 12
        height: 8
        contextType: "2d"

        Connections {
            target: control
            function onPressedChanged() { canvas.requestPaint(); }
        }

        onPaint: {
            context.reset();
            context.moveTo(0, 0);
            context.lineTo(width, 0);
            context.lineTo(width / 2, height);
            context.closePath();
            context.fillStyle = control.pressed ? "#17a81a" : "#ff4285f4";
            context.fill();
        }
    }

    contentItem: Text {
        leftPadding: 10
        rightPadding: control.indicator.width + control.spacing

        text: control.displayText
        font: control.font
        color: control.pressed ? "#17a81a" : "#ff4285f4"
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }

    background: Rectangle {
        implicitWidth: 220
        implicitHeight: 40
        border.color: control.pressed ? "#17a81a" : "#ff4285f4"
        border.width: control.visualFocus ? 2 : 1
        radius: 2
    }

    popup: Popup {
        y: control.height - 1
        width: control.width
        implicitHeight: contentItem.implicitHeight
        padding: 1

        contentItem: ListView {
            clip: true
            implicitHeight: contentHeight
            model: control.popup.visible ? control.delegateModel : null
            currentIndex: control.highlightedIndex

            ScrollIndicator.vertical: ScrollIndicator { }
        }

        background: Rectangle {
            border.color: "#ff4285f4"
            radius: 2
        }
    }
}
