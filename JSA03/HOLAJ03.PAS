uses crt;
var X1,X2,X3,X4:integer;
label c00,c10,c11,c12;

begin
clrscr;

writeln('HOLAJ - JSA03');
writeln('--------------------------');

write('X1=');readln(X1);
write('X2=');readln(X2);
write('X3=');readln(X3);
write('X4=');readln(X4);
writeln;
asm mov cl,3

C00: mov ax,X1    {nacteni dvojice cisel}
     mov bx,X2
     cmp ax,bx    {ax<bx -> S=1}
     js C10       {skok pri ax<bx}
     mov X1,bx    {prohozeni}
     mov X2,ax

C10: mov ax,X2
     mov bx,X3
     cmp ax,bx
     js C11     {pro opacne poradi lze vyuzit jns u vsech}
     mov X2,bx
     mov X3,ax

C11: mov ax,X3
     mov bx,X4
     cmp ax,bx
     js C12
     mov X3,bx
     mov X4,ax

C12: dec cl   {snizeni pocitadla}
     jnz C00  {opakuj dokud CL je ruzne od nuly}

end;
  writeln('X1=',X1);
  writeln('X2=',X2);
  writeln('X3=',X3);
  writeln('X4=',X4);
repeat until keypressed;
end.