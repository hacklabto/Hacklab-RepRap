UNAME := $(shell uname)
ifeq ($(UNAME), Darwin)
OPENSCAD:=/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD
endif
ifneq ($(UNAME), Darwin)
OPENSCAD:=$(shell which openscad)
endif

BUILDDIR=./build

#_PARTS = pulley bar-clamp belt-clamp coupling endstop-holder frame-vertex pla-bushing prusalogo rod-clamp x-carriage x-end-idler x-end-motor y-slider-better z-motor-mount
### prusalogo.scad depends on bitmap.scad
_PARTS = pulley bar-clamp belt-clamp coupling endstop-holder vertex pla-bushing prusalogo rod-clamp x-carriage x-end-idler x-end-motor y-slider-better z-motor-mount x-carriage-bowden-extruder wades-bowden-block

PARTS = $(patsubst %,$(BUILDDIR)/%.stl,$(_PARTS))

.PHONY : usage all clean _PARTS MakerbotPlates MendelPlate

default : usage

usage :
	@echo "Usage 'make parts'"
	@echo "  make parts MakerbotPlates"
	@echo "  make parts MendelPlate"
	@echo "  make OPENSCAD=\`which openscad\` parts MakerbotPlates"
	@echo "Variable Values:"
	@echo "  BUILDDIR = $(BUILDDIR)"
	@echo "  OPENSCAD = $(OPENSCAD)"
	@echo "  PARTS    = $(PARTS)"
	@echo "  UNAME    = $(UNAME)"

all : parts MakerbotPlates

parts : $(PARTS)

$(BUILDDIR) :
	mkdir -p $(BUILDDIR)

MakerbotPlates : parts
	cp makerbot.scad $(BUILDDIR)
#	cp prusalogo.stl $(BUILDDIR)
	cp y-motor-bracket_1off.stl $(BUILDDIR)
	cp z-bar-top-clamp_4off.stl $(BUILDDIR)
	$(OPENSCAD) -D render_plate=1 -s $(BUILDDIR)/mbplate1.stl $(BUILDDIR)/makerbot.scad
	$(OPENSCAD) -D render_plate=2 -s $(BUILDDIR)/mbplate2.stl $(BUILDDIR)/makerbot.scad
	$(OPENSCAD) -D render_plate=3 -s $(BUILDDIR)/mbplate3.stl $(BUILDDIR)/makerbot.scad
	$(OPENSCAD) -D render_plate=4 -s $(BUILDDIR)/mbplate4.stl $(BUILDDIR)/makerbot.scad
	$(OPENSCAD) -D render_plate=5 -s $(BUILDDIR)/mbplate5.stl $(BUILDDIR)/makerbot.scad

MendelPlate : parts
	cp plate1.scad $(BUILDDIR)
#	cp prusalogo.stl $(BUILDDIR)
	cp y-motor-bracket_1off.stl $(BUILDDIR)
	cp z-bar-top-clamp_4off.stl $(BUILDDIR)
	$(OPENSCAD) -s $(BUILDDIR)/plate1.stl $(BUILDDIR)/plate1.scad

$(_PARTS) :
	$(MAKE) $(BUILDDIR)/$@.stl

$(BUILDDIR)/wades-bowden-block.stl : $(BUILDDIR) wades-bowden-block.scad $(BUILDDIR)/M8_Extruder_Block_3.stl
	@echo "Processing $*"
	$(OPENSCAD) -s $(BUILDDIR)/wades-bowden-block.stl wades-bowden-block.scad

$(BUILDDIR)/%.stl : $(BUILDDIR) %.scad
	@echo "Processing $*"
	$(OPENSCAD) -s $(BUILDDIR)/$*.stl $*.scad

$(BUILDDIR)/pulley.stl : $(BUILDDIR)
	@echo "Fetching nophead's pulley.stl..."
	wget http://www.thingiverse.com/download:5914 -O $(BUILDDIR)/pulley.stl
	touch $(BUILDDIR)/pulley.stl

$(BUILDDIR)/M8_Extruder_Block_3.stl : $(BUILDDIR)
	@echo "Fetching Wades Extruder Block.stl..."
	wget http://www.thingiverse.com/download:4939 -O $(BUILDDIR)/M8_Extruder_Block_3.stl
	touch $(BUILDDIR)/pulley.stl

clean :
	$(RM) -rf $(BUILDDIR)

