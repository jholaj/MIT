uses crt;
var T1,T2,T3:string[40];
{------------------------------------------------}
procedure kopie;          {T2:=T1}
label S01;
begin
     asm
     mov si,offset T1      {adresa zacatku T1 do SI}
     mov di,offset T2      {adresa zacatku T2 do DI}
     mov cl,[si]           {do CL hodnota z adresy SI - delka retezce}
     mov [di],cl           {nastaveni delky noveho retezce}

S01: inc si                {posun o ukazatele}
     inc di
     mov al,[si]           {nacteni znaku z T1}
     mov [di],al           {zapis znaku do T2}
     dec cl                {snizeni pocitadla delky reteyce}
     jnz S01               {opakuj dokud CL<>0}

     end;

end;

{===============================================}

begin
clrscr;
writeln('HOLAJ - JSA04');
writeln('--------------------------');
writeln;

write('T1: ');readln(T1);
writeln;

kopie;

writeln('T2:>',T2,'<');

repeat until keypressed;
end.