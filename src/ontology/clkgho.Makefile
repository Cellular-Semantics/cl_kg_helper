## Customize Makefile settings for clkgho
## 
## If you need to customize your Makefile, make
## changes here rather than in the main Makefile

$(COMPONENTSDIR)/efo_mireot.owl: $(SRC)
	@echo "Downloading EFO base ontology..."
	curl -L --create-dirs -o $(TMPDIR)/efo-base.owl http://www.ebi.ac.uk/efo/efo-base.owl
	@echo "Extracting terms with MIREOT..."
	$(ROBOT) extract --method MIREOT \
		--input $(TMPDIR)/efo-base.owl \
		--upper-term "http://www.ebi.ac.uk/efo/EFO_0002772" \
		--upper-term "http://www.ebi.ac.uk/efo/EFO_0010183" \
		--lower-term "http://www.ebi.ac.uk/efo/EFO_0009899" \
		--lower-term "http://www.ebi.ac.uk/efo/EFO_0009922" \
		--lower-term "http://www.ebi.ac.uk/efo/EFO_0011025" \
		--lower-term "http://www.ebi.ac.uk/efo/EFO_0009900" \
		--lower-term "http://www.ebi.ac.uk/efo/EFO_0008931" \
		--lower-term "http://www.ebi.ac.uk/efo/EFO_0010961" \
		--lower-term "http://www.ebi.ac.uk/efo/EFO_0010184" \
		--lower-term "http://www.ebi.ac.uk/efo/EFO_0008995" \
		--lower-term "http://www.ebi.ac.uk/efo/EFO_0030062" \
		--output $(COMPONENTSDIR)/efo_mireot.owl

