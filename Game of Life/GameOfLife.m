clear all
clc 
close all

gridSize=100;
cells =zeros(gridSize,gridSize);
mostrar=1;
delay=0.3;

if mostrar >1
%%%Dibujar grid inicial
    [sy,sx] =size(cells);
    for i=2:sy-1
        for j=2:sx-1
            rectangle('Position', [gridSize-j,gridSize-i, 1, 1], 'facecolor', 'white' );
        end
    end
    title(['Game of life '])
    delay=0.00001;
end


% Generate random life cells
total= floor(numel(cells)*0.1);
idx = randsample(numel(cells),total);
cells(idx) = 1;

k=0;
while(1)
    k=k+1;
    newCells=zeros(gridSize,gridSize);
     
for i=2:gridSize-1
    for j=2:gridSize-1
        
        %%%encontrar vecinos
        vecinos=0;
        if cells(j - 1, i) ==1 
            vecinos=vecinos+1;
        end
        if cells(j + 1, i) ==1 
            vecinos=vecinos+1;
        end
        if cells(j, i+1) ==1 
            vecinos=vecinos+1;
        end
        if cells(j, i-1) ==1 
            vecinos=vecinos+1;
        end   
        %%% esquinas
        
         if cells(j - 1, i+1) ==1 
            vecinos=vecinos+1;
        end
        if cells(j + 1, i+1) ==1 
            vecinos=vecinos+1;
        end
        if cells(j+1, i-1) ==1 
            vecinos=vecinos+1;
        end
        if cells(j-1, i-1) ==1 
            vecinos=vecinos+1;
        end   
        
        
        %If the cell is alive, then it stays alive if it has either 2 or 3 live neighbors
        if cells(j,i) == 1    
            if vecinos>=2 && vecinos <=3
                newCells(j,i)=1;
            end
        else %If the cell is dead, then it springs to life only in the case that it has 3 live neighbors
            if vecinos==3
                newCells(j,i)=1;
            end
            
        end
        

    end
end



%%%Actualizar grid

if mostrar ==1
    imagesc(newCells); caxis([0 1]);
    colormap default; 
    axis off; axis equal; drawnow
    title(['Game of life it=', num2str(k)])
else
    for i=2:gridSize-1
        for j=2:gridSize-1
            if newCells(i,j) ==1
                rectangle('Position', [gridSize-j,gridSize-i, 1, 1], 'facecolor', 'cyan');
            else
                rectangle('Position', [gridSize-j,gridSize-i, 1, 1], 'facecolor', 'black');

            end
        end
    end
end


cells = newCells;
pause(delay)
end