unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,JPEG,
  Vcl.StdCtrls,Vcl.MPlayer, Vcl.ComCtrls, System.ImageList,Ubala,UNave,UEnemigos,UEF;
type
    TForm1 = class(TForm)
    Timer1: TTimer;
    Timer2: TTimer;
    Label1: TLabel;
    Timer3: TTimer;
    Timer4: TTimer;
    Timer5: TTimer;
    Label2: TLabel;
    Timer6: TTimer;
    Label3: TLabel;
    Disparo_Laser: TMediaPlayer;
    Inicio: TMediaPlayer;
    Derrota: TMediaPlayer;
    Victoria: TMediaPlayer;
    Jefe_Final: TMediaPlayer;
    procedure FormClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Timer2Timer(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure Timer4Timer(Sender: TObject);
    procedure Timer5Timer(Sender: TObject);
    procedure Timer6Timer(Sender: TObject);

  private
    { Private declarations }
    Der,Izq,Arb,Abj,Espacio,Music :Boolean;
    Fondo: TJPEGImage;

    DX,DY,DXE,DYE:integer;

    //Clases
    N:Nave;
    B:Bala;
    E:Enemigos;
    EF:Enemigo_Final;

  public

    { Public declarations }

  end;

var
  Form1: TForm1;
  P: Integer;
  Ini:Boolean;


implementation

{$R *.dfm}


procedure TForm1.FormClick(Sender: TObject);
begin
  Application.terminate;
end;

procedure TForm1.FormCreate(Sender: TObject);

begin
   //Crear Clases
   N:=Nave.create;
   B:=Bala.Create;
   E:=Enemigos.Create;
   EF:=Enemigo_Final.create;

   //Cargar Y Crear Imagenes Clases
   N.Cargar_Crear_Imagenes;
   B.Cargar_Crear_Imagenes;
   E.Cargar_Vector;
   E.Cargar_VectoresPosiciones;
   E.Cargar_Vector_Vida;
   EF.Cargar_Imagen;
   EF.Cargar_Vida;
   EF.Cargar_Posicion;

   B.J:=1;

  Fondo:= TJPEGImage.Create;
  Fondo.LoadFromFile('Imagenes/Fondo.jpg');

  N.Movimiento;
  Inicio.Play;

end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

      case key of
      37:Izq:=True;
      39:Der:=True;
      38:Arb:=True;
      40:Abj:=True;

      32:Begin
       B.Y:=N.Y-B.Imagen_Bala.Height;
       B.X:=N.X+((N.Nave_Variable.Width-B.Imagen_Bala.Width) div 2);


           if N.Vida < 1 then
           Begin
            inicio.Stop;
            Derrota.Play;
            ShowMessage('GAME OVER!!');
           End;

          if E.Enemigos_vivos = false then
         Begin
           inicio.Stop;
           Jefe_Final.Play;

            EF.Vivo:=True;
            Timer6.Enabled:=True;
            Label3.Caption:=('Enemigo:'+IntToStr(EF.Vida));
          repaint
         End;

         if ((EF.choque_recibido = True) and (EF.Vivo = True) and (E.Enemigos_vivos = False)) then
           Begin
          EF.Vida := EF.Vida -1;
         End;

         if EF.Vida <=0 then
         Begin
         Jefe_Final.Stop;
         Victoria.Play;
         EF.Vivo:=False;
          ShowMessage('We are the Champion');
         End;
      End;
      77:Music:=True;
      end;
      Label1.Caption:=InttoStr(Key);

end;

procedure TForm1.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
         case key of
      37:Izq:=False;
      39:Der:=False;
      38:Arb:=False;
      40:Abj:=False;
      32:Begin Espacio:=True; E.Choque:=false; EF.choque_recibido := False; End;

      //Musica Stop
      49:Begin Inicio.stop
       End;
      50:Begin Derrota.Stop
      End;
      51: Begin Jefe_final.Stop
      End;
      52:Begin Victoria.Stop
      End;

      112: Inicio.Play;
      113: Derrota.play;
     114:Jefe_Final.play;
      115:Victoria.play;

      end;
      N.Nave_Variable:= N.Imagen_Nave ;
end;

procedure TForm1.FormPaint(Sender: TObject);
var K:Integer;


begin
    Canvas.StretchDraw(Rect(0,0,screen.Width,screen.Height),Fondo);


   Canvas.Draw(N.X,N.Y,N.Nave_Variable);

    if E.Enemigos_vivos = True then
    Begin
                 If ((Espacio = true) and (E.Choque = false) )then
      Begin
            Canvas.Draw(B.X,B.Y,B.Imagen_Bala);
       End ;
    End;

    if E.Enemigos_vivos = False then
    Begin
      if ((Espacio = True) and (EF.choque_recibido = false )) then
      Begin
          Canvas.Draw(B.X,B.Y,B.Imagen_Bala);
      End;

    End;

   if (Timer5.Interval = 1000) and N.Choque = False Then
   Begin
            Canvas.Draw(DXE,DYE,B.Imagen_Bala);
            DYE:=DYE + 30;
            if (N.Da?o(DXE,DYE) = True) and (N.Vida >=1) then
           Begin
             N.Vida:= N.Vida-1;
           End;


   End;

   for K := 1 to 27 do
     Begin
        if E.Vector_Vida[K] = True then
        Begin
                 Canvas.Draw(E.Posiciones_X[K] ,E.Posiciones_Y[K],E.Vector_Enemigos[K]);
        End;
     End;

     if EF.Vivo = True then
     Begin
       Canvas.draw(EF.X,EF.Y,EF.Imagen_Jefe_Final);
          End;


     if EF.Dibujar_Disparo = True then
     Begin
       Canvas.Draw(EF.DX,EF.DY,EF.Disparo);
     End;

     if E.Enemigo_choque_nave(N.X,N.Y) = True then
     Begin
       N.Vida:=0;
     End;

end;
procedure TForm1.Timer2Timer(Sender: TObject);
begin
    if Izq and (N.X - 15 > 1) then Begin N.X:= N.X-15;  N.Nave_Variable:=N.Imagen_Nave_Moviendose;  End;
    if Der and (N.X + 15 +N.Imagen_Nave_Moviendose.Width < screen.Width ) then Begin N.X:= N.X+15;  N.Nave_Variable:=N.Imagen_Nave_Moviendose;  End;
    if Arb and (N.Y - 15 > 1) then Begin N.Y:= N.Y-15;  N.Nave_Variable:=N.Imagen_Nave_Moviendose;  End;
    if Abj and (N.Y + 15 + N.Imagen_Nave.Height < screen.Height) then Begin N.Y:= N.Y+15;  N.Nave_Variable:=N.Imagen_Nave_Moviendose;  End;

    Repaint;
end;

procedure TForm1.Timer3Timer(Sender: TObject);
 Begin
       E.Movimiento;
       Label2.Caption:=('Tu vida es:'+IntToStr(N.Vida));
     repaint;
end;

procedure TForm1.Timer4Timer(Sender: TObject);
begin

    if (Espacio and E.Choque = false) then Begin B.Y:=B.Y-30;
        E.Explotar(B.X,B.Y);
        EF.Da?o_recibido(B.X,B.Y);
         repaint;
    End;
end;

procedure TForm1.Timer5Timer(Sender: TObject);
var r:Integer;
begin
       Randomize;
       r:= Random(26)+1;
       if E.Vector_Vida[r] = True then
       Begin
           DXE:= E.Posiciones_X[r] + ((E.Vector_Enemigos[r].Width - B.Imagen_Bala.Width) div 2);
           DYE:= E.Posiciones_Y[r]+E.Vector_Enemigos[r].Height;
           N.Choque:=false;
       End;
end;

procedure TForm1.Timer6Timer(Sender: TObject);

begin
  if (EF.Contador_animacion <=11) and( EF.Vivo =True) then
  Begin
     EF.Animacion;
    repaint;
  End;

  if EF.Contador_animacion  >=12 then
  Begin
    EF.Movimiento;
    EF.Cargar_Posicion_Disparo;
    EF.Disparar;
  End;
end;

end.
