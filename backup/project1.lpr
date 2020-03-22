program project1;
uses wincrt, graph;

var gd, gm: smallint;
    konecnyCas, aktualnyCas: array[1..2] of integer;
    x, y, kod, r: integer;
    ch: char;
    s: string;

procedure zadajHodnoty(x, y: integer; var s: string; var ch: char);
begin
  ch := readkey;
  if(ch = chr(8)) then s := copy(s, 1, length(s) - 1);
  if(ch >= '0') and (ch <= '9') then s := s + ch;

  bar(x, y, x + 100, y + 10);
  outtextxy(x, y, s);
end;

function prevodRadiany(stupne: integer): real;
begin
  prevodRadiany := (stupne * pi) / 180;
end;

procedure hodiny(x, y, r, farba: integer);
var stupne, i, dlzka: integer;
begin
  setcolor(farba);
  circle(x, y, r);

  for i := 1 to 60 do
  begin
    stupne := 6 * i;

    if(stupne mod 90 = 0) then dlzka := 25
    else dlzka := 10;

    line(x + round(sin(prevodRadiany(stupne)) * r), y - round(cos(prevodRadiany(stupne)) * r),
         x + round(sin(prevodRadiany(stupne)) * (r - dlzka)), y - round(cos(prevodRadiany(stupne)) * (r - dlzka)));
  end;
end;

function cas(minuty, sekundy: integer): string;
var s: string;
begin
  str(minuty, s);
  if(minuty < 10) then s := '0' + s;
  cas := s;

  str(sekundy, s);
  if(sekundy < 10) then s := '0' + s;
  cas := cas + ':' + s;
end;

procedure rucicka(x, y, hodnota, dlzka, farba: integer; nakreslit: boolean);
var stupne: integer;
begin
  if(nakreslit) then setcolor(farba)
  else setcolor(black);

  stupne := 6 * hodnota;
  line(x, y, x + round(sin(prevodRadiany(stupne)) * dlzka), y - round(cos(prevodRadiany(stupne)) * dlzka));
end;

begin
  gd := detect;
  initgraph(gd, gm, '');

  // uloha 1
  x := 600;
  y := 300;

  outtextxy(x, y, 'Zadaj cas v tvare [mm:ss]:');

  repeat
    bar(x, y + 10, x + 100, y + 20);

    // minuty
    y := y + 10;
    s := '';
    repeat
      zadajHodnoty(x, y, s, ch);
    until ch = chr(58);
    val(s, konecnyCas[1], kod);

    outtextxy(x + 20, y, ':');

    // sekundy
    x := x + 30;
    s := '';
    repeat
      zadajHodnoty(x, y, s, ch);
    until ch = chr(13);
    val(s, konecnyCas[2], kod);
                
    x := x - 30;
    y := y - 10;
  until (konecnyCas[1] < 60) and (konecnyCas[2] < 60);

  // uloha 2
  bar(1, 1, 1000, 1000);

  x := getmaxx div 2;
  y := getmaxy div 2;
  r := y - 100;

  aktualnyCas[1] := 0;
  aktualnyCas[2] := 0;

  hodiny(x, y, r, 15);

  repeat
    // vykreslenie ruciciek a casu
    rucicka(x, y, aktualnyCas[1], 150, 10, True);
    rucicka(x, y, aktualnyCas[2], 200, 6, True);

    setcolor(white);
    settextstyle(0, 0, 5);
    outtextxy(x - 93, y + 300, cas(aktualnyCas[1], aktualnyCas[2])); 

    // zmena farby hodin
    if((60 * konecnyCas[1] + konecnyCas[2]) - (60 * aktualnyCas[1] + aktualnyCas[2]) <= 5) then
      hodiny(x, y, r, 6);

    delay(1000);

    // zmazanie ruciciek a casu
    rucicka(x, y, aktualnyCas[1], 150, 10, False);
    rucicka(x, y, aktualnyCas[2], 200, 6, False); 

    setcolor(black);
    outtextxy(x - 93, y + 300, cas(aktualnyCas[1], aktualnyCas[2]));

    // pricitanie sekund/minut
    if(konecnyCas[1] <> 0) and (konecnyCas[2] <> 0) then
    begin
      aktualnyCas[2] := aktualnyCas[2] + 1;
      if(aktualnyCas[2] >= 60) then
      begin
        aktualnyCas[2] := 0;
        aktualnyCas[1] := aktualnyCas[1] + 1;
      end;
    end;
  until (aktualnyCas[1] = konecnyCas[1]) and (aktualnyCas[2] = konecnyCas[2]);

  setcolor(white);
  outtextxy(x - 240, y, 'Cas vyprsal!');

  delay(2000);
  closegraph();
end.

