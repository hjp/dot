ALLSRC = \
	.zjava \
	.zlogin \
	.zlogout \
	.znewterm \
	.zprofile \
	.zshenv \
	.zshrc \
	.gitconfig \
        .vim/ \
        .vim/colors/ \
        .vim/colors/hjp.vim \
        .vimrc \


ALLDST = $(patsubst %, $(HOME)/%, $(ALLSRC)) 

install: $(ALLDST)

echo:
	echo $(ALLSRC)
	echo $(ALLDST)

$(HOME)/%: %
	cp $^ $@

$(HOME)/%/:
	mkdir $@

diff:
	for i in $(ALLSRC); do diff -u $(HOME)/$$i $$i; done
