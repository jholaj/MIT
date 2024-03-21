uses crt;
label c01, c02, c03, c04, c05, c06, c07, c08, c09, c10,
      vpravo, vlevo, nahoru, dolu, konec, cyklus;

const x0=40; y0=12;
      znak = '#';
      prazdny = ' ';
{----------------------------------------------------------------}
{///////////////////////HOLAJ/JSA07//////////////////////////////}
begin
clrscr;
          asm
          mov dl,x0           {nastaveni pocatcni pozice kurzoru}
          mov dh,y0
          mov ah,02h
          int 10h

          mov ah,0eh          {zobrazeni znaku}
          mov al,znak
          int 10h

          mov ah,01h          {vypnuti kurzoru}
          mov ch,20h
          int 10h
{----------------------------------------------------------------}
cyklus:   mov ah,08h          {cteni znaku z klavesnice}
          int 21h             {vraci do AL kod znaku}
          mov ch,al           {kod znaku do CH}

          cmp ch,27           {test klavesy Esc}
          jz konec            {ukonceni po stisku Esc}

          cmp ch,77           {TEST klavesy}
          jnz c01
          call vpravo         {volani podprogramu}

c01:
          cmp ch,75           {test klavesy}
          jnz c02
          call vlevo          {volani podprogramu}
c02:
          cmp ch,72
          jnz c03
          call nahoru
c03:
         cmp ch,80
         jnz c04
         call dolu
c04:
         jmp cyklus          {opakovani}
{----------------------------------------------------------------}
vpravo:   mov ah,02h
          int 10h
          mov ah,0eh        {smazani znaku}
          mov al,prazdny
          int 10h

          inc dl             {nova pozice kurzor}

          mov ah,02h
          int 10h
          mov ah,0eh         {zobrazeni znaku}
          mov al,znak
          int 10h

          ret                {ukonceni programu}

vlevo:    mov ah,02h
          int 10h
          mov ah,0eh
          mov al, prazdny
          int 10h

          dec dl

          mov ah,02h
          int 10h
          mov ah,0eh
          mov al,znak
          int 10h

          ret

nahoru:   mov ah,02h
          int 10h
          mov ah,0eh
          mov al,prazdny
          int 10h

          dec dh

          mov ah,02h
          int 10h
          mov ah,0eh
          mov al,znak
          int 10h

          ret

dolu:     mov ah,02h
          int 10h
          mov ah,0eh
          mov al,prazdny
          int 10h

          inc dh

          mov ah,02h
          int 10h
          mov ah,0eh
          mov al, znak
          int 10h

          ret

konec:    mov ah, 01h          {zapnuti kurzoru}
          mov ch, 06h
          mov cl, 07h
          int 10h

      end;
end.