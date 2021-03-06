unit UEnemigos;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,JPEG,
  Vcl.StdCtrls,Vcl.MPlayer, Vcl.ComCtrls, System.ImageList,UBala;
  Type
   Posicion = Record
     X,Y:Integer;
   End;
   Enemigos = class
   Private



   Public
       Vector_Enemigos:Array [1..128] of TPngImage;
       Posiciones_X:Array [1..27] of Integer;
       Posiciones_Y:Array [1..27] of Integer;
       Vector_Vida:Array [1..128] of Boolean;
       Mitad_Pantalla:Integer;
       Altura:Integer;
       Choque,choque_enemigo_nave:Boolean;
       P:Integer;



       Procedure Movimiento;
       Procedure Turbo(X,Y:Integer);
       Procedure Disparo(Parametro:integer);
       Procedure Disparo_Especial;
       Procedure Cargar_Vector;
       Procedure Cargar_VectoresPosiciones;
       Procedure Cargar_Vector_Vida;
       Function Explotar(X_Disparo,Y_Disparo:Integer):boolean;
       Function Enemigos_vivos:boolean;
       Function Enemigo_choque_nave(X_nave,Y_nave:Integer):Boolean;



   End;
implementation

{ Enemigos }

procedure Enemigos.Cargar_Vector;
var I:Integer;
begin
     for I := 1 to 27 do
    Begin

      Vector_Enemigos[I] := TPngImage.Create;
      Vector_Enemigos[I].LoadFromFile('Imagenes/Nave_enemiga_2.png');

    End;
end;

procedure Enemigos.Cargar_VectoresPosiciones;
var K,j,z,c,l,m:word;
begin
    J:=40;
    Z:=120;
    C:=200;
    Mitad_pantalla:= screen.Width -1150;
    Altura:= screen.Height -720;
    P:=50;

       for K := 1 to 11 do
     Begin
        Posiciones_X[K] := Mitad_pantalla+J;
        Posiciones_Y[K] := Altura;
        J:=J+80;
     End;

                 for L := 12 to 20 do
     Begin
       Posiciones_X[L] := Mitad_pantalla+Z;
       Posiciones_Y[L] := Altura + 80;
       Z:=Z+80;
     End;
            for M := 21 to 27 do
     Begin
        Posiciones_X[M] := Mitad_pantalla+C;
        Posiciones_Y[M] := Altura + 160;
       C:=C+80;
     End;
end;

procedure Enemigos.Cargar_Vector_Vida;
var
  I: Integer;
begin
    for I := 1 to 27 do
    Begin
      Vector_Vida[I]:= True;
    End;

    choque_enemigo_nave:=False;
end;

procedure Enemigos.Disparo(Parametro:integer);
begin



end;

procedure Enemigos.Disparo_Especial;
begin

end;

function Enemigos.Enemigos_vivos: boolean;
var Respuesta:boolean;
  I: Integer;
begin
  Respuesta:=False;
  for I := 1 to 27 do
  Begin
    if Vector_Vida[I] = true then
      Begin                          
        Respuesta:= True;
      End;
  End;
  result:= Respuesta;
end;

function Enemigos.Enemigo_choque_nave(X_nave,Y_nave:Integer): Boolean;
var
  I: Integer;
  J: Integer;
  K: Integer;


begin
     choque_enemigo_nave:=False;

    for I := 1 to 27 do
    Begin
      if (X_nave = Posiciones_X[I]) and (Y_nave = Posiciones_Y[I]) and (Vector_Vida[I] = true) then
      Begin

        choque_enemigo_nave:=True;
        Break

      End;

      for J := 1 to (Vector_Enemigos[1].Width div 2) do
      Begin
        for K := 1 to (Vector_Enemigos[1].Height div 2) do
          Begin
          if (X_nave = Posiciones_X[I]+J) and (Y_nave = Posiciones_Y[I]+K)and (Vector_Vida[I] = true)
          or (X_nave = Posiciones_X[I]-J) and (Y_nave = Posiciones_Y[I]-K)and (Vector_Vida[I] = true) then
         Begin
           choque_enemigo_nave:=True;
           Break
         End;
          End;

      End;
    End;

     result:=choque_enemigo_nave;


end;

Function Enemigos.Explotar(X_Disparo, Y_Disparo: Integer):boolean;
var
  I: Integer;
  J: Integer;
  K: Integer;


begin
     Choque:=False;

    for I := 1 to 27 do
    Begin
      if (X_Disparo = Posiciones_X[I]) and (Y_Disparo = Posiciones_Y[I]) and (Vector_Vida[I] = true) then
      Begin
      Vector_Vida[I] := False;
        Choque:=True;
        Break

      End;

      for J := 1 to ((Vector_Enemigos[1].Width div 2)+10) do
      Begin
        for K := 1 to ((Vector_Enemigos[1].Height div 2)+10) do
          Begin
          if (x_Disparo = Posiciones_X[I]+J) and (y_Disparo = Posiciones_Y[I]+K)and (Vector_Vida[I] = true)
          or (x_Disparo = Posiciones_X[I]-J) and (Y_Disparo = Posiciones_Y[I]-K)and (Vector_Vida[I] = true) then
         Begin
            Vector_Vida[I] := False;
           Choque:=True;
           Break
         End;
          End;

      End;
    End;

     result:=Choque;


end;

procedure Enemigos.Movimiento;
var I,J:integer;
begin

      for I := 1 to 27 do
      Begin
         Posiciones_X[I] := Posiciones_X[I] + P;
      End;
      if (Posiciones_X[11]+ Vector_Enemigos[11].Width > (Screen.Width-Vector_Enemigos[11].width)) or (Posiciones_X[1] - Vector_Enemigos[1].Width < 1) then
       Begin
         P:=P*(-1);

       End;
      if (Posiciones_X[1] - Vector_Enemigos[1].Width < 1) then
         Begin
          for J := 1 to 27 do
           Begin
             Posiciones_Y[J] := Posiciones_Y[J] +40;
           End;
         End;
end;

procedure Enemigos.Turbo(X, Y: Integer);
begin

end;


end.
