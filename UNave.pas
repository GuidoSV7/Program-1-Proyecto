unit UNave;

interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,JPEG,
  Vcl.StdCtrls,Vcl.MPlayer, Vcl.ComCtrls, System.ImageList,UEnemigos,UBala;

Type
   Posicion = Record
     X,Y:Integer;

   End;
   Nave = class
   Private
     B:Bala;

   Public
       X,Y:Integer;
       Vida:Integer;
       Imagen_Nave,Imagen_Nave_Moviendose,Nave_Variable:TPngImage;
       Choque:Boolean;
       Imagen_da�o1,Imagen_da�o2,Imagen_da�o3:TpngImage;
       Procedure Cargar_Crear_Imagenes;
       Procedure Movimiento;
       Procedure Turbo(X,Y:Integer);
       Procedure Disparo;
       Procedure Disparo_Especial;
       Function Da�o(DXE,DYE:Integer):Boolean;






   End;
implementation

{ Nave }

procedure Nave.Cargar_Crear_Imagenes;
begin
   Imagen_Nave:=TPngImage.Create;
   Imagen_Nave_Moviendose:=TPngImage.Create;
   Nave_Variable:= TPngImage.Create;
   Imagen_Nave.LoadFromFile('Imagenes/Nave_sin_moverse2.png');
   Imagen_Nave_Moviendose.LoadFromFile('Imagenes/Nave_moviendose2.png');
   Nave_Variable.LoadFromFile('Imagenes/Nave_sin_moverse2.png');

   //Da�o Naves
    {Imagen_da�o1:=TPngImage.Create;
    Imagen_da�o2:=TPngImage.Create;
    Imagen_da�o3:=TPngImage.Create;
    Imagen_da�o1.LoadFromFile('');
    Imagen_da�o2.LoadFromFile('');
    Imagen_da�o3.LoadFromFile(''); }



end;

Function Nave.Da�o(DXE,DYE:Integer):Boolean;
var Da�o_boolean:boolean;
var I,J,K:Integer;
begin
    Choque:=False;
    Da�o_boolean:=False;
    for I := 1 to 27 do
    Begin
      if (DXE = X ) and (DYE = Y) and (Vida >= 1) then
      Begin
        Da�o_boolean:=True;
        Choque:=True;
        Break
      End;

      for J := 1 to 40 do
      Begin
        for K := 1 to 40 do
          Begin
          if (DXE = X+J) and (DYE = Y+K)
          or (DXE= X-J) and (DYE = Y-K)
          then
         Begin
             Da�o_boolean:=True;
             Choque:=True;
            Break
         End;
          End;
      End;
    End;

    result:=Da�o_Boolean;

end;





procedure Nave.Disparo;
begin

end;

procedure Nave.Disparo_Especial;
begin

end;

procedure Nave.Movimiento;
begin
  X:= (Screen.Width- Imagen_Nave.Width) div 2;
  Y:= (Screen.Height-Imagen_Nave.Height);
  Vida:=5;
end;

procedure Nave.Turbo(X, Y: Integer);
begin

end;

end.
