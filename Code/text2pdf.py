from reportlab.lib.pagesizes import letter
from reportlab.platypus import SimpleDocTemplate, Paragraph, Spacer
from reportlab.lib.styles import getSampleStyleSheet

def text_to_pdf(text_file, pdf_file):
    # Read the text file
    with open(text_file, 'r') as file:
        lines = file.readlines()

    # Create the PDF object
    pdf = SimpleDocTemplate(pdf_file, pagesize=letter)

    # Get the basic styles
    styles = getSampleStyleSheet()
    styleN = styles['Normal']
    styleN.fontSize = 12

    # Create the PDF elements
    story = []
    for line in lines:
        story.append(Paragraph(line, styleN))
        story.append(Spacer(1, 12))

    # Build the PDF
    pdf.build(story)

# Usage:
import sys
text_to_pdf(sys.argv[1], sys.argv[2])