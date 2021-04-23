from reportlab.pdfgen.canvas import Canvas
from reportlab.pdfbase.pdfmetrics import stringWidth
from pdfrw import PdfReader
from pdfrw.buildxobj import pagexobj
from pdfrw.toreportlab import makerl
import os, math
from reportlab.lib.colors import HexColor


class PDF:
    def __init__(self, template="../pdf/invoice.pdf", outfile="../pdf/result.pdf"):
        self.outfile = outfile
        self.infile = template
        self.PRIX = 100000
        self.rc = "RC/YAE/2019/B/2647"
        self.bp = "BP 467"
        self.tel = "242075453"

    def get(self,  data=None):
        dest = self.outfile
        template = PdfReader(self.infile, decompress=False).pages[0]
        template_obj = pagexobj(template)
        canvas = Canvas(self.outfile)
        xobj_name = makerl(canvas, template_obj)
        canvas.doForm(xobj_name)

        # Variables
        vaiable_name = "THR : "
        remiserWidth = stringWidth(vaiable_name, 'Helvetica-Bold', 10)
        line = "Particular name"

        parsed = data[0]
        somme = 0
        for x in data[1]:
            somme += x[2] * x[3]  * (100+x[4])
        somme = math.ceil(somme/100)
        total = math.ceil(somme * (100 - parsed[9])/100)
        # Data
        t = {
            "name": parsed[0],
            "raison": parsed[0],
            "address": parsed[2],
            "ville": parsed[2],
            "site": parsed[3],
            "po": parsed[4],
            "facture": parsed[5],
            "date": parsed[6],
            "delay": parsed[7],
            "reglement": parsed[8],
            "remise": str(parsed[9])+" %",
            "thr": str(somme),
            "total": str(total)

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
        canvas.drawString(100, 604-16, t["raison"])  # 23

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

        # adding product over a loop
        i = 0; s = 0
        for x in data[1]:
            s = round(x[2] * x[3]  * (100+x[4]) / 100, 1)
            canvas.setFont("Helvetica", 10)
            canvas.drawString(30, 440 - i, str(x[0]))
            canvas.drawString(105, 440 - i, str(x[1]))
            canvas.drawString(382, 440 - i, str(x[2]))
            canvas.drawString(452, 440 - i, str(x[3]))
            canvas.drawString(500, 440 - i, str(x[4]))
            canvas.setFont("Helvetica-Bold", 8)
            canvas.drawString(545, 440 - i, str(s)) # -18

            i += 18
            s = 0




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

        print(f"gnome-open {dest}")

        canvas.save()

        command = f"gnome-open {dest}"
        os.system(command)

if __name__ == "__main__":
    pdf = PDF()
    pdf.get()

