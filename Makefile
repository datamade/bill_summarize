


all: 2d980774-aca1-427b-9ca2-8fda80815f7c.pdf.txt.summary

%.txt.summary : %.txt
	cat $< | llm -m 3.5 -s "Summarize this legislation in 30 words" > $@

%.pdf.txt : %.pdf
	pdftotext $<
	mv $*.txt $@

%.pdf :
	wget "https://occprodstoragev1.blob.core.usgovcloudapi.net/matterattachmentspublic/$*.pdf"


needs_text.csv :
	psql $$DATABASE_URL -f scripts/needs_text.sql > $@
