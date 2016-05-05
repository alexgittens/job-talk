% To get a pdf file, use 
%  mtxrun --script metapost <fname.mp>
% if you have ConTeXt installed; otherwise, you
% can use http://www.tlhiv.org/mppreview/ to view and convert this code to
% a pdf
%
prologues:=3;
input myTEX;
TEXPRE("%&latex" & char(10) & "\documentclass{minimal}" & char(10) & "\usepackage{sfmath}" & char(10) & "\begin{document}");
TEXPOST("\end{document}");
beginfig(0);
   % height and width, numrows, numcols of one matrix of signs                  
   numeric numcols; numcols = 6;                                                
   numeric numrows; numrows = 5;                                                
   height = 1in;                                                                
   width = (numcols-1)/(numrows-1)*height;                                      
                                                                                
   % values of the vector                                                       
   numeric vals[];                                                              
   vals1 = 1;                                                                   
   vals2 = 3;                                                                   
   vals3 = 10;                                                                  
   vals4 = 9;                                                                   
   vals5 = 7;                                                                   
                                                                                
   %% draw the gridlines for the matrix                                         
   path vert; vert := (0,0) -- (0,height);                                      
   path horiz; horiz := (0,0) -- (width, 0);  
   numeric backshift; backshift = -2/(numcols-1)*width - width/(numcols-1);                                   
   path horizv; horizv = (0,0)--(width/(numcols-1), 0);
                                              
   label(btex $\mathbf{W_1} =$ etex, (backshift, height/2)); 
   label(btex $=$ etex, (backshift + 2.5*width/(numcols-1), height/2));                   
   draw horizv shifted (backshift + width/(numcols-1), 0);
   draw horizv shifted (backshift + width/(numcols-1), height); 
   draw vert shifted (backshift + width/(numcols-1), 0);
   draw vert shifted (backshift + 2*width/(numcols-1), 0);
                                                                           
   for colnum = 0 upto numcols-1:                                               
       draw vert shifted (colnum/(numcols-1)*width, 0);                         
   endfor;                                                                      
   for rownum = 0 upto numrows-1:                                               
       draw horiz shifted (0, rownum/(numrows-1)*height);
       draw horizv shifted (backshift + width/(numcols-1), rownum/(numrows-1)*height);                       
   endfor;                                                                      
                                                                                
   %% fill in the matrix                                                        
                                              
       for rownum = 1 upto numrows-1: 
           label(TEX("\mathbf{w}^1_i$"), (backshift + width/(numcols-1)*1.5, (rownum-.5)/(numrows-1)*height) );
   for colnum = 1 upto numcols-1: 
          firstmatrix[colnum][rownum] = round(uniformdeviate(1));                        
          label( decimal(1 - 2*firstmatrix[colnum][rownum]), ((colnum-.5)/(numcols-1)*width, (rownum-.5)/(numrows-1)*height) );
       endfor;                                                                  
   endfor;                                                                      
                                                                                
endfig;  
end
