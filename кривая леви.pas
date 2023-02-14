uses GraphABC;
var (m, wx, wy, g):= (200, 500, 450, 5);
 
procedure draw(x, y, a, r:real; k:integer); 
begin
  if k > 0 then 
  begin
    r:=r*sin(pi/4);
    draw(x, y, a+pi/4, r, k-1);
    draw(x+r*cos(a+pi/4), y-r*sin(a+pi/4), a-pi/4, r, k-1);
  end 
  else
    line(trunc(x), trunc(y), trunc(x+r*cos(a)), trunc(y-r*sin(a))); 
end; 

Procedure keydown(p: integer);
begin
 case p of
    VK_Down: wy -= 10;
    VK_Up: wy += 10; 
    VK_Left: wx += 10;  
    VK_Right: wx -= 10;
    VK_Escape: halt(1);
    VK_A: if m < 1000 then m+=1;
    VK_D: if m > 10 then m-=1;
    VK_W: if g < 15 then g+=1;
    VK_S: if g > 2 then g -=1;
   end;
 window.clear; 
 draw(wx-m, wy, wx+m, wy, g);
 redraw;
end; 
begin
     setpencolor(clblue);
     setwindowcaption('кривая леви');
     setwindowsize(1280, 960);
     lockdrawing;
     keydown(0);
     onkeydown += keydown;
end.