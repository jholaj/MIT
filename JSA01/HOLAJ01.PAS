program aritmetika;
uses crt;
var prom_a,prom_b,prom_s,prom_r,prom_m,prom_e:integer;
    prom_c,prom_d,prom_v,prom_z:shortint;

begin
clrscr;
writeln('HOLAJ - JSA01');
writeln('----------------------------');
write(' a:= ');readln(prom_a);
write(' b:= ');readln(prom_b);
write(' c:= ');readln(prom_c);
write(' d:= ');readln(prom_d);
write(' e:= ');readln(prom_e);

asm
        mov ax,prom_a  { nacteni promenne a z pameti do registru AX }
        mov bx,prom_b  { nacteni promenne b z pameti do registru BX }
        add ax,bx      { vypocet soucet AX:AX+BX }
        mov prom_s,ax  { zapis vysledku z AX do promene S }

        mov ax,prom_a
        mov bx,prom_b
        sub ax,bx       { ax = ax+bx }
        mov prom_r,ax

        mov al, prom_c
        mov bl, prom_d
        mul bl          { ax = al * bl }
        mov prom_m,ax

        mov ax, prom_e
        mov bl, prom_d
        div bl          { al:= ax/bl ah=zbytek }
        mov prom_v,al
        mov prom_z,ah

        end;

writeln(' a + b = ',prom_s);
writeln(' a - b = ',prom_r);
writeln(' c * d = ',prom_m);
writeln(' e / d = ',prom_v,' zbytek = ',prom_Z);

repeat until keypressed;
end.
