% To get a pdf file, use mptopdf if you have ConTeXt installed; otherwise, you
% can use http://www.tlhiv.org/mppreview/ to view and convert this code to
% a pdf
%
prologues:=3;
verbatimtex
        %&latex
        \documentclass{minimal}
        \begin{document}
etex
beginfig(0);
   height = 1.3in;                                                              
   width = 2*height;                                                            
   numeric numcols; numcols = 10;                                               
   numeric numrows; numrows = 5;                                                
   numeric labely;                                                              
   numeric coinflip;
   path vert; vert := (0,0) -- (0,height);                                      
   path horiz; horiz := (0,0) -- (width, 0);                                    
                                                                                
                                                                                
   %% draw the gridlines for the matrix                                         
   draw vert;                                                                   
   draw vert shifted (width, 0);                                                
   draw horiz;                                                                  
   draw horiz shifted (0, height);                                              
                                                                                
    for x = 0 upto numcols-1:                                                  
        draw vert shifted (x/(numcols-1)*width, 0);                            
    endfor;                                                                    
                                                                               
    for y = 0 upto numrows-1:                                                  
        draw horiz shifted (0, y/(numrows-1)*height);                          
    endfor;                                                                      
                                                                                
   %% draw the nonzero entries in the matrix                                    
   for x = 0 upto numcols-2:
       for y = 0 upto numrows-2:
           coinflip := uniformdeviate(1);
           if (coinflip < .5) :
                label("+1", ( (x+.5)/(numcols-1)*width, (y+.5)/(numrows-1)*height ));
           else:
                label("-1", ( (x+.5)/(numcols-1)*width, (y+.5)/(numrows-1)*height ));
           fi
    endfor;
   endfor;
   %% label the dimensions of the matrix 
   Dlabelx = -0.5/(numcols-1)*width;                                            
   dlabely = height*(1 + .5/(numrows-1));
                                       
   drawarrow (Dlabelx, height/2 - 0.25/(numrows-1)*height)--(Dlabelx, 0);                     
   drawarrow (Dlabelx, height/2 + 0.25/(numrows-1)*height)--(Dlabelx, height);                
   label(btex $\mathrm{D}$ etex, (Dlabelx, height/2) );                         
                     
   drawarrow ( width/2 - 0.75/(numcols-1)*width, dlabely) -- (0, dlabely);
   drawarrow ( width/2 + 0.75/(numcols-1)*width, dlabely) -- (width, dlabely);
                   
   label(btex $d+1$ etex, (width/2, height*(1 + .5/(numrows-1))));                  
endfig; 
end
