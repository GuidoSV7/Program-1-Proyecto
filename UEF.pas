unit UEF;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,JPEG,
  Vcl.StdCtrls,Vcl.MPlayer, Vcl.ComCtrls, System.ImageList,UBala;
  Type
   Posicion = Record
     X,Y:Integer;
   End;
   Enemigo_Final = class
   Private



   Public
        X,Y,DX,DY:Integer;
       Vida:Integer;
       Imagen_Jefe_Final,Disparo,Disparo_Cargar:TPngImage;
       Vivo:Boolean;
       Animacion_off,choque_recibido,Dibujar_Disparo:Boolean;
       Contador_animacion:integer;
       P:Integer;
       Choque:Boolean;
       Procedure Cargar_Imagen;
       Procedure Cargar_Vida;
       Procedure Cargar_Posicion;
       Procedure Cargar_Posicion_Disparo;
       Procedure Animacion;
       Procedure Cargar_Disparo;
       Procedure Disparar;
       Procedure Movimiento;
       Function Da?o_recibido(BX,BY:Integer):boolean;







   end;
implementation

{ Enemigo_Final }

procedure Enemigo_Final.Animacion;
begin
     Y:=Y+30;
     Contador_animacion:=Contador_animacion+1;

end;

procedure Enemigo_Final.Cargar_Disparo;
begin

end;

procedure Enemigo_Final.Cargar_Imagen;
begin
  Imagen_Jefe_Final:= TPngImage.Create;
   Imagen_Jefe_Final.LoadFromFile('Imagenes/Jefe_Final_2.png');
    //Camviar Imagen
   Disparo:= TPngImage.Create;
   Disparo.LoadFromFile('Imagenes/Disparo2_1.png');
    //Cambiar Imagen
   Disparo_Cargar:= TPngImage.Create;
   Disparo_Cargar.LoadFromFile('Imagenes/Disparo2_1.png');


   end;

procedure Enemigo_Final.Cargar_Posicion;
begin
   X:= (Screen.Width- Imagen_Jefe_Final.Width) div 2;
  Y:= ((Screen.Height-Imagen_Jefe_Final.Height) div 2)-500;
end;

procedure Enemigo_Final.Cargar_Posicion_Disparo;
begin
       DY:=Y-Imagen_Jefe_Final.Height;
       DX:=X+((Imagen_Jefe_Final.Width-40) div 2);
end;

procedure Enemigo_Final.Cargar_Vida;
begin
  Vida:=10;
  Vivo:=False;
  Contador_animacion:=1;
  P:=60;
  Dibujar_Disparo:=False;
end;

Function Enemigo_Final.Da?o_recibido(BX,BY:Integer):boolean;
var I,J:Integer;
begin
      Choque_recibido:=False;

      for I := 1 to  700 do
      Begin
              if (BX = X) and (BY = Y) then
      Begin
         Choque_recibido:=True;
         Break
      End;
            for J := 1  to 400 do
        Begin
         if ((BX = X+I) and (BY = Y+J) )
          or ((BX = X-I) and (BY = Y-J))

         then
         Begin
           Choque_recibido:=True;
           Break
         End;
       End;

      End;

        
     result:=choque_recibido;   



end;

procedure Enemigo_Final.Disparar;
begin
   DY:= DY-30;
   Dibujar_Disparo:=True;

end;

procedure Enemigo_Final.Movimiento;
begin
    X:=X-P;
    if
    ((X+Imagen_Jefe_Final.Width) > (Screen.Width))or (X  < 1)
     then
       Begin
         P:=P*(-1);

       End;
end;

end.
