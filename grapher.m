
function graph=grapher(vals)
graph=zeros(500,500);
%define origin
x_start=31;
y_start=471;
%create axes
%----------
%create x-axis
for start=470:472
    for sweep=1:500
        graph(start,sweep)=255;
    end
end
% create y axis
for start=30:32
    for sweep=1:500
        graph(sweep,start)=255;
    end
end
%axes are created
%------------------------
%creating divisions
%creating divisions on x axis
start=470;
sweep=30;
i=0;
while sweep<500
    %create vertical line
    for r=1:3
        for ty=y_start-5:y_start+5
            graph(ty,sweep)=255;
           
        end
    end
    
    sweep=sweep+8;
end

i=0;
%------
%creating divisions on y axis
start=470;
sweep=30;

while start>0
    %create horizontal line
    for r=1:3
        for ty=x_start-5:x_start+5
            graph(start,ty)=255;
        end
    end
    start=start-8;
   
end

%scaling
%finding xtremes of y
nele=size(vals,1);
min=vals(1,2);
max=min;
for i=1:nele
    if vals(i,2)>max
        max=vals(i,2);
    end
    if vals(i,2)<min
        min=vals(i,2);
    end
    
end
y_div=(max-min)/50;
y_abs=max/40;
%------------
%finding xtremes of x

min=vals(1,1);
max=min;
for i=1:nele
    if vals(i,1)>max
        max=vals(i,1);
    end
    if vals(i,1)<min
        min=vals(i,1);
    end
    
end
x_div=(max-min)/50;
x_abs=max/40;
disp('-----Scale-----');
Z=[' x axis : ',num2str(x_abs),' per division'];
disp(Z);
T=[' y axis : ',num2str(y_abs),' per division'];
disp(T);
x_scale=x_abs/10;
y_scale=y_abs/10;
%plotting
for i=1:nele
    posx=471-floor(vals(i,2)/y_scale);
  %disp(vals(i,2)/y_scale);
    posy=31+floor(vals(i,1)/x_scale);
   graph(posx,posy)=255;
    tt=posx-2;
    u=posy-3;
    
    while tt<posx+3
       for yy=1:3
            graph(tt,u+yy)=255;
          
            
       end
       
        tt=tt+1;
    end
end
%connecting lines

%sorting vals on basis of x coordinates
for i=1:nele
 for h=1:nele-i
    if vals(h,1)>vals(h+1,1)
       t1=vals(h,1);
       t2=vals(h,2);
       vals(h,1)=vals(h+1,1);
       vals(h,2)=vals(h+1,2);
       vals(h+1,1)=t1;
       vals(h+1,2)=t2;
    end
 end
end

for i=1:nele
    if i<nele
        slope=(vals(i+1,2)-vals(i,2))/(vals(i+1,1)-vals(i,1));
        intercept=vals(i,2)-slope*vals(i,1);
        start=floor(vals(i,1)/x_scale);
        while start<floor(vals(i+1,1)/x_scale)
            coory=slope*start*x_scale+intercept;
            graph(471-floor(coory/y_scale),start+31)=255;
            start=start+1;
        end
    end
    
end
graph=255-graph;
figure,imshow(graph);
end

















