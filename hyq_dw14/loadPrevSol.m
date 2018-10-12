function [prevSol]= loadPrevSol(filename)

load(filename);
aux=out.datx(end,:);
prevSol=aux';