OPENSCAD=/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD
BUILDDIR=./build

PARTS = bar-clamp belt-clamp coupling endstop-holder frame-vertex-foot frame-vertex pla-bushing prusalogo rod-clamp x-carriage x-end-idler x-end-motor y-slider-better z-motor-mount

.PHONY : all clean $(PARTS)

default : usage

usage :
	@echo "Usage 'make all'"
	@echo "  make MakerbotPlates"
	@echo "  make OPENSCAD=\`which openscad\` all"

all : $(PARTS) MakerbotPlates

MakerbotPlates :
	mkdir -p $(BUILDDIR)
	$(OPENSCAD) -D render_plate=1 -s $(BUILDDIR)/mbplate1.stl makerbot.scad
	$(OPENSCAD) -D render_plate=2 -s $(BUILDDIR)/mbplate2.stl makerbot.scad
	$(OPENSCAD) -D render_plate=3 -s $(BUILDDIR)/mbplate3.stl makerbot.scad
	$(OPENSCAD) -D render_plate=4 -s $(BUILDDIR)/mbplate4.stl makerbot.scad
	$(OPENSCAD) -D render_plate=5 -s $(BUILDDIR)/mbplate5.stl makerbot.scad

$(PARTS) :
	mkdir -p $(BUILDDIR)
	@echo "Processing $@"
	$(OPENSCAD) -s $(BUILDDIR)/$@.stl $@.scad

clean :
	$(RM) -rf $(BUILDDIR)
