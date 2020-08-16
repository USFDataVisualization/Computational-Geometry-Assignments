WORKSHEET_DIR := ./worksheets
PROJECT_DIR := ./projects
PDF_DIR := .

WORKSHEET_FILES := $(wildcard $(WORKSHEET_DIR)/*.tex)
WORKSHEET_PDF   := $(patsubst $(WORKSHEET_DIR)/%.tex,$(PDF_DIR)/%.pdf,$(WORKSHEET_FILES))

PROJECT_FILES := $(wildcard $(PROJECT_DIR)/*.tex)
PROJECT_PDF   := $(patsubst $(PROJECT_DIR)/%.tex,$(PDF_DIR)/%.pdf,$(PROJECT_FILES))

$(info    WORKSHEET_FILES is $(WORKSHEET_FILES))
$(info    WORKSHEET_PDF is $(WORKSHEET_PDF))
$(info    PROJECT_FILES is $(PROJECT_FILES))
$(info    PROJECT_PDF is $(PROJECT_PDF))

all : $(WORKSHEET_PDF) $(PROJECT_PDF) project0_skeleton.zip project1_skeleton.zip project2_skeleton.zip project3_skeleton.zip

$(PDF_DIR)/%.pdf : $(WORKSHEET_DIR)/%.tex usfdvl.sty
	cd $(WORKSHEET_DIR); pdflatex $(notdir $<); cp $@ ..

$(PDF_DIR)/%.pdf : $(PROJECT_DIR)/%.tex usfdvl.sty
	cd $(PROJECT_DIR); pdflatex $(notdir $<); cp $@ ..

$(info    p0 is $(wildcard ./projects/project0_skeleton/*))

project0_skeleton.zip : $(wildcard ./projects/project0_skeleton/*)
	cd projects; zip ../project0_skeleton.zip project0_skeleton/*

project1_skeleton.zip : $(wildcard ./projects/project1_skeleton/*)
	cd projects; zip ../project1_skeleton.zip project1_skeleton/*

project2_skeleton.zip : $(wildcard ./projects/project2_skeleton/*)
	cd projects; zip ../project2_skeleton.zip project2_skeleton/*

project3_skeleton.zip : $(wildcard ./projects/project3_skeleton/*)
	cd projects; zip ../project3_skeleton.zip project3_skeleton/*

clean:  ## Clean output files
	rm worksheets/texput.log worksheets/worksheet*.aux worksheets/worksheet*.fdb_latexmk worksheets/worksheet*.fls worksheets/worksheet*.log worksheets/worksheet*.out worksheets/worksheet*.synctex.gz worksheets/worksheet*.pdf projects/texput.log projects/project*.aux projects/project*.fdb_latexmk projects/project*.fls projects/project*.log projects/project*.out projects/project*.synctex.gz projects/project*.pdf
