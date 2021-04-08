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
            "address": "Berage Alpha",
            "ville": "Istanbul",
            "site": "www.onetrip.com",
            "po": "2525",
            "facture": "F0001",
            "date": "2020-04-03",
            "delay": "2020-04-13",

        }


        # Adding remise and his value
        canvas.setFont("Helvetica-Bold",10)
        canvas.drawString(420, 220, vaiable_name)
        canvas.setFont("Helvetica", 10)
        canvas.drawString(420 + remiserWidth + 5, 220, "70000" + "  F CFA")

        canvas.setFont("Helvetica-Bold", 10)
        canvas.drawString(100, 604, t["name"])

        canvas.setFont("Helvetica", 10)
        canvas.drawString(100, 573, t["address"])           # 604 - 31
        canvas.drawString(100, 573 - 16.5, t["ville"])      # 573 - 16.5
        canvas.setFillColor(HexColor("#4285f4ff"))
        canvas.drawString(100, 573 - 16.5*2, t["site"])     # 573 - 16.5*2
        canvas.drawString(100, 573 - 17.1*3 , t["po"])       # 573 - 16.5*3
        # Prepared by

        command = f"gnome-open {dest}"
        os.system(command)
        canvas.save()

if __name__ == "__main__":
    pdf = PDF()
    pdf.get()

