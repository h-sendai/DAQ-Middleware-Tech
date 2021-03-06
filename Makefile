BASENAME = technical-desc-1.1.0
FILENAME = DAQ-Middleware-1.1.0-Tech

SRCS += ${BASENAME}.tex

#FIGS +=

all: pdf

ps:  ${BASENAME}.ps
pdf: ${BASENAME}.pdf
dvi: ${BASENAME}.dvi

#${BASENAME}.pdf: ${BASENAME}.ps
#	ps2pdf ${BASENAME}.ps

${BASENAME}.pdf: ${BASENAME}.dvi
	dvipdfmx ${BASENAME}.dvi

${BASENAME}.ps: ${BASENAME}.dvi
	dvips -f -o ${BASENAME}.ps ${BASENAME}.dvi 

${BASENAME}.dvi: ${SRCS} ${FIGS}
	platex ${BASENAME}.tex
	platex ${BASENAME}.tex
	platex ${BASENAME}.tex

clean:
	@rm -f ${BASENAME}.aux ${BASENAME}.toc ${BASENAME}.log ${BASENAME}.dvi ${BASENAME}.ps ${BASENAME}.pdf

put: pdf
	scp ${BASENAME}.pdf onlxw1:/home/htdocs/docs/$(FILENAME).pdf
	ssh onlxw1 syncweb
