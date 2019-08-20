unit Unit8;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TForm8 = class(TForm)
    Timer1: TTimer;
    ColorBox1: TColorBox;
    ColorBox2: TColorBox;
    Timer2: TTimer;
    Image2: TImage;
    ColorBox3: TColorBox;
    ColorBox4: TColorBox;
    ColorBox5: TColorBox;
    Image1: TImage;
    procedure Timer1Timer(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Timer2Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;
  nx,ny,gsy,gsx:integer;
on,tr:boolean;
implementation
uses unit1;

{$R *.dfm}

procedure TForm8.Timer1Timer(Sender: TObject);
var
i,j:integer;
begin


Image1.Canvas.Brush.Color:=ColorBox1.Selected;
Image1.Canvas.FillRect(Image1.ClientRect);
Image1.Picture:=Image2.Picture;
{for i:=px-10 to trunc(Form1.Width/32)+px+10 do
for j:=py-10 to trunc(Form1.Height/32)+py-10 do
 if px>0 then
 if py> 0 then
 if karta[i,j]<>0 then Image1.Canvas.Pixels[i,j]:=ColorBox2.Selected;  }
 //(px,py,trunc(Form1.Width/32)+px,trunc(Form1.Height/32)+py);
 
 ///////////////
Image1.Canvas.MoveTo(px,py);
Image1.Canvas.LineTo(trunc(Form1.Width/32)+px,py);
//--
Image1.Canvas.MoveTo(px,trunc(Form1.Height/32)+py);
Image1.Canvas.LineTo(trunc(Form1.Width/32)+px,trunc(Form1.Height/32)+py);
//--
Image1.Canvas.MoveTo(px,py);
Image1.Canvas.LineTo(px,trunc(Form1.Height/32)+py);
//--
Image1.Canvas.MoveTo(trunc(Form1.Width/32)+px,py);
Image1.Canvas.LineTo(trunc(Form1.Width/32)+px,trunc(Form1.Height/32)+py);
////////////////
//Image1.Repaint;
Form8.Caption:=inttostr(nx);
  if on=true then begin
  gsx:=Mouse.CursorPos.X-Form8.Left-4-nx;
 gsy:=Mouse.CursorPos.y-Form8.top-26-ny;
 if gsx<0 then gsx:=0;
 if gsy<0 then gsy:=0;
 if trunc(Form1.Width/32)+gsx>mapHsize then gsx:=mapHsize-trunc(Form1.Width/32);
 if trunc(Form1.Height/32)+gsy>mapWsize+3 then gsy:=mapWsize+3-trunc(Form1.Height/32);
 px:=gsx;
 py:=gsy;
 pxx:=px*(-32) ;
 pyy:=py*(-32) ;

end;

end;


procedure TForm8.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
  var
  tx,ty:integer;
begin
tx:=Mouse.CursorPos.X-Form8.Left-4;
ty:=Mouse.CursorPos.y-Form8.top-26;
nx:=Mouse.CursorPos.X-Form8.Left-4-gsx;
ny:=Mouse.CursorPos.y-Form8.top-26-gsy;

if tx>px then if tx<(px+(trunc(Form1.Width/32))) then
if ty>py then if ty<(py+trunc(Form1.Height/32)) then on:=true;
end;

procedure TForm8.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
on:=false;
end;

procedure TForm8.Timer2Timer(Sender: TObject);
var
i,j:integer;
begin
Image1.Width:=Screen.Width;
Image1.Height:=Screen.Height;  
form8.Height:=mapwsize+32;
form8.Width:=maphsize+32;
{Image1.Canvas.Brush.Color:=ColorBox1.Selected;
Image1.Canvas.FillRect(Image1.ClientRect);
for i:=0 to 500 do
for j:=0 to 50 do
 if karta[i,j]<>0 then Image1.Canvas.Pixels[i,j]:=ColorBox2.Selected;
if Form8.Visible=true then Timer1.Enabled:=true else Timer1.Enabled:=false;   }
end;

procedure TForm8.FormCreate(Sender: TObject);
var
i,j:integer;
begin
Form8.Image2.Width:=Screen.Width;
Image2.Height:=Screen.Height;
 Form8.Image2.Canvas.Refresh;
Form8.Image2.Canvas.Brush.Color:=Form8.ColorBox1.Selected;
Form8.Image2.Canvas.FillRect(Image2.ClientRect);
      for i:=0 to mapHsize do
for j:=0 to mapWsize do    begin
 if background[i,j]<>0 then form8.Image2.Canvas.Pixels[i,j]:=form8.ColorBox3.Selected;
 if background[i,j]=0 then form8.Image2.Canvas.Pixels[i,j]:=form8.ColorBox1.Selected;
 end;
      for i:=0 to mapHsize do
for j:=0 to mapWsize do    begin
 if karta[i,j]<>0 then form8.Image2.Canvas.Pixels[i,j]:=form8.ColorBox2.Selected;
 end;
      for i:=0 to mapHsize do
for j:=0 to mapWsize do    begin
 if upground[i,j]<>0 then form8.Image2.Canvas.Pixels[i,j]:=form8.ColorBox4.Selected;
 end;
if form8.Active=true then Form8.Image2.Repaint;

end;

end.
