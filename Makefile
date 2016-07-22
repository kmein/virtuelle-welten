POVRAY=povray
CONVERT=convert
SRC=src
OUT=out
INI=ini

clean:
	rm out/*

boxes: $(OUT)/boxes.png
mandel: $(OUT)/mandel.gif
menger-sponge: $(OUT)/menger-sponge.png
pipe: $(OUT)/pipe.gif
pythagoras-tree: $(OUT)/pythagoras-tree.gif
sierpinski: $(OUT)/sierpinski.png
test: $(OUT)/test.gif

$(OUT)/boxes.png: $(SRC)/boxes.pov
	$(POVRAY) $(SRC)/boxes.pov +O$(OUT)/boxes.png

$(OUT)/mandel.gif: $(SRC)/mandel.pov
	$(POVRAY) $(INI)/animate.ini $(SRC)/mandel.pov
	$(CONVERT) $(SRC)/mandel*.png $(OUT)/mandel.gif
	rm $(SRC)/mandel*.png

$(OUT)/sierpinski.png: $(SRC)/sierpinski.pov
	$(POVRAY) $(SRC)/sierpinski.pov +O$(OUT)/sierpinski.png

$(OUT)/menger-sponge.png: $(SRC)/menger-sponge.pov
	$(POVRAY) $(SRC)/menger-sponge.pov +O$(OUT)/menger-sponge.png

$(OUT)/pipe.gif: $(SRC)/pipe.pov
	$(POVRAY) $(INI)/animate.ini $(SRC)/pipe.pov
	$(CONVERT) $(SRC)/pipe*.png $(OUT)/pipe.gif
	rm $(SRC)/pipe*.png

$(OUT)/pythagoras-tree.gif: $(SRC)/pythagoras-tree.pov
	$(POVRAY) $(INI)/animate.ini $(SRC)/pythagoras-tree.pov
	$(CONVERT) $(SRC)/pythagoras-tree*.png $(OUT)/pythagoras-tree.gif
	rm $(SRC)/pythagoras-tree*.png

$(OUT)/test.gif: $(SRC)/test.pov
	$(POVRAY) $(INI)/animate.ini $(SRC)/test.pov
	$(CONVERT) $(SRC)/test*.png $(OUT)/test.gif
	rm $(SRC)/test*.png

.PHONY=clean
