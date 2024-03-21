program soucet32bitu;
uses crt;
var A,B,C:longint;
    adresa:word;
begin
clrscr;

writeln('HOLAJ - JSA02');
writeln('------------------------');

write('A> ');readln(A);
write('B> ');readln(B);
asm
        mov si, offset A {nacteni pocatecni adresy s promennymi}
        mov adresa,si    {zapis adresy kde jsou ulozene promenne}

        mov ax,[si+0]    {nacteni dolnich 2 byte z A}
        mov bx,[si+4]    {nacteni dolnich 2 byte z B}
        add ax, bx       {soucet}
        mov [si+8],ax    {zapis dolnich 2 byte do C}

        mov ax, [si+2]   {nacteni hornich 2 byte z A}
        mov bx, [si+6]   {nacteni hornich 2 byte z B}
        adc ax, bx       {soucet s prenosem}
        mov [si+10], ax  {zapis hornich 2 byte do C}

end;

writeln('C= ',C);
writeln('adresa: ',adresa);
repeat until keypressed;
end.