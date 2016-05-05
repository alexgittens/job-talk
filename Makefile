all:
	pdflatex gittens-linear-and-nonlinear-low-rank.tex
	pdflatex gittens-linear-and-nonlinear-low-rank.tex

clean:
	rm gittens-linear-and-nonlinear-low-rank.{aux,log,nav,out,snm,toc}
	rm macros.aux
