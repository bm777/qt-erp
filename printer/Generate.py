from reportlab.pdfgen.canvas import Canvas
from reportlab.pdfbase.pdfmetrics import stringWidth
from pdfrw import PdfReader
from pdfrw.buildxobj import pagexobj
from pdfrw.toreportlab import makerl
import os
from reportlab.lib.colors import HexColor


class PDF:
    def __init__(self, template="../pdf/invoice.pdf", outfile="../pdf/result.pdf"):
        self.outfile = outfile
        self.infile = template
        self.PRIX = 100000
        self.rc = "RC/YAE/2019/B/2647"
        self.bp = "BP 467"
        self.tel = "242075453"

    def get(self, dest="../pdf/result.pdf", data=None):
        template = PdfReader(self.infile, decompress=False).pages[0]
        template_obj = pagexobj(template)
        canvas = Canvas(self.outfile)
        xobj_name = makerl(canvas, template_obj)
        canvas.doForm(xobj_name)

        # Variables
        vaiable_name = "THR : "
        remiserWidth = stringWidth(vaiable_name, 'Helvetica-Bold', 10)
        line = "Particular name"


        # Data
        t = {
            "name": "Ali Belahl",
            "raison": "Turkish HS (High School basé à Douala)",
            "address": "Berage Alpha",
            "ville": "Istanbul",
            "site": "www.oneschool.com",
            "po": "2525",
            "facture": "F0001",
            "date": "2020-04-03",
            "delay": "2020-04-13",
            "reglement": "cash",
            "remise": str(5)+" %",
            "thr": str(70000),
            "total": str(75000)

        }


        # Adding remise and his value
        canvas.setFont("Helvetica-Bold",10)
        canvas.drawString(420, 220, vaiable_name)
        canvas.setFont("Helvetica", 10)
        canvas.drawString(420 + remiserWidth + 5, 220, str(t["thr"]) + "  F CFA")

        # Adding left side on the invioce
        canvas.setFont("Helvetica-Bold", 10)
        canvas.drawString(100, 604, t["name"])
        canvas.setFont("Helvetica-Bold", 12)
        canvas.drawString(23, 604-16, t["raison"])

        canvas.setFont("Helvetica", 10)
        canvas.drawString(100, 573, t["address"])           # 604 - 31
        canvas.drawString(100, 573 - 16.5, t["ville"])      # 573 - 16.5

        canvas.setFillColor(HexColor("#4285f4"))
        canvas.drawString(100, 573 - 16.5*2, t["site"])     # 573 - 16.5*2

        canvas.setFillColor(HexColor("#000000"))
        canvas.drawString(100, 573 - 17.1*3 , t["po"])       # 573 - 16.5*3


        # Adding right side on invoice
        canvas.setFont("Helvetica-Bold", 12)
        canvas.drawString(480, 604-15.2, t["facture"])        # At the same line as raison field.

        canvas.setFont("Helvetica", 10)
        canvas.drawString(480, 604 - 15.2*2, t["date"])
        canvas.drawString(480, 604 - 15.2 * 3, t["delay"])

        # Adding bottom side on the invoice
        canvas.drawString(100, 219, t["reglement"])
        canvas.setFont("Helvetica-Bold", 10)
        canvas.drawString(376, 219, t["remise"])


        # adding amount side on invoice
        canvas.setFillColor(HexColor("#ffffff"))
        canvas.setFont("Helvetica-Bold", 20)

        totalWidth = stringWidth(t["total"] + " F CFA", 'Helvetica-Bold', 20)
        canvas.drawString(595 - totalWidth - 40, 120, t["total"] + " F CFA")
        # Prepared by

        command = f"gnome-open {dest}"
        os.system(command)
        canvas.save()

if __name__ == "__main__":
    pdf = PDF()
    pdf.get()

