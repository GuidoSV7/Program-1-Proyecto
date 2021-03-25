unit UBala;

interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,JPEG,
  Vcl.StdCtrls,Vcl.MPlayer, Vcl.ComCtrls, System.ImageList;

Type
  Punto=Record
      X,Y:Word;
  End;
  Bala=class
    Private

    Public
      X,Y:Word;
      Imagen_Bala,Imagen_Bala_Especial:TPngImage;
      Array_Balas: array [1..8] of  TPngImage;
      Array_Posiciones_X: Array[1..8] of real;
      Array_Posiciones_Y: Array[1..8] of real;
      J:Integer;
      Procedure Cargar_Crear_Imagenes;
      Procedure Movimiento_Bala;
      Procedure Cargar_Posicion_X;
      Procedure Cargar_Posicion_Y;
  end;

implementation

{ Nave }


procedure Bala.Cargar_Crear_Imagenes;
var I,J,K:integer;
begin
  Imagen_Bala:= TPngImage.Create;
  Imagen_Bala.LoadFromFile('Imagenes/Disparo2_1.png');

    for I:= 1 to 8 do
    Begin
      Array_Balas[I] :=  TPngImage.Create;
      Array_Balas[I].LoadFromFile('Imagenes/Disparo2_1.png');
    End;
end;

procedure Bala.Cargar_Posicion_X;
begin

end;

procedure Bala.Cargar_Posicion_Y;
begin

end;

procedure Bala.Movimiento_Bala;
begin

end;

begin

end.
