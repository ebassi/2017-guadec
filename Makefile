HOVERCRAFT = $(shell which hovercraft)
ZIP = $(shell which zip)

SRCFILE = continuous.rst
CSSFILE = 2017-guadec.css
OUTPUTDIR = $(basename $(SRCFILE))
ZIPFILE = $(SRCFILE:.rst=.zip)

all: $(SRCFILE)
	@echo '  GEN     $(OUTPUTDIR)'; $(HOVERCRAFT) $(SRCFILE) $(OUTPUTDIR)

run: all
	gio open $(OUTPUTDIR)/index.html

clean:
	@rm -rf $(OUTPUTDIR)
	@rm -f $(ZIPFILE)

snapshot: all
	@echo '  ZIP     $(ZIPFILE)'; $(ZIP) -q -r "$(ZIPFILE)" "$(OUTPUTDIR)"

release: all
	@echo '  ZIP     $(ZIPFILE)'; $(ZIP) -q -r "$(ZIPFILE)" "$(OUTPUTDIR)" $(SRCFILE) $(CSSFILE) Makefile
