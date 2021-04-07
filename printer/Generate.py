from reportlab.pdfgen.canvas import Canvas
from reportlab.pdfbase.pdfmetrics import stringWidth
from pdfrw import PdfReader
from pdfrw.buildxobj import pagexobj
from pdfrw.toreportlab import makerl


class PDF:
    def __init__(self, template="../pdf/template.pdf", outfile="../pdf/result.pdf"):
        self.outfile = outfile
        self.infile = template

    def get(self, dest="../pdf/result.pdf"):
        template = PdfReader(self.infile, decompress=False).pages[0]

        template_obj = pagexobj(template)

        canvas = Canvas(self.outfile)

        xobj_name = makerl(canvas, template_obj)
        canvas.doForm(xobj_name)
        ystart = 443

        student_name = ""
        line = "Particular name"
        line = ""
        x = 200

        # Prepare font setting
        canvas.setFont('Courier-Bold', 16)
        textWidth = stringWidth(student_name, 'Helvetica-Bold', 8)
        #x += textWidth + 1
        canvas.drawString(200, ystart, line)

        # Prepared by

        print("printed")
        canvas.save()

if __name__ == "__main__":
    pdf = PDF()
    pdf.get()

