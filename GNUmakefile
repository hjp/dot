ALLSRC = \
	.zjava \
	.zlogin \
	.zlogout \
	.znewterm \
	.zprofile \
	.zshenv \
	.zshrc \
	.gitconfig \

ALLDST = $(subst ., $(HOME)/., $(ALLSRC)) 

install: $(ALLDST)

echo:
	echo $(ALLSRC)
	echo $(ALLDST)

$(HOME)/%: %
	cp $^ $@

diff:
	for i in $(ALLSRC); do diff -u $(HOME)/$$i $$i; done
