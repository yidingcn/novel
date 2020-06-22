.PHONY: all book summary clean

OUTPUT:=_output
MDBOOK_BIN:=${OUTPUT}/mdbook
SUMMARY_MD:=${OUTPUT}/src/SUMMARY.md

all: book

book: ${MDBOOK_BIN} ${SUMMARY_MD}
	cp *.md ${OUTPUT}/src
	${MDBOOK_BIN} build ${OUTPUT}

${SUMMARY_MD}:
	mkdir -p ${OUTPUT}/src
	./generate-summary.pl > $@

${MDBOOK_BIN}: ${OUTPUT}/mdbook.tgz
	tar xf $< -C ${OUTPUT}
	touch $@

${OUTPUT}/mdbook.tgz:
	mkdir -p ${OUTPUT}
	curl -L https://github.com/rust-lang-nursery/mdBook/releases/download/0.0.21/mdBook-0.0.21-x86_64-unknown-linux-gnu.tar.gz -o $@

clean:
	rm -rf ${OUTPUT}
