unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Menus, ToolWin, ComCtrls, ImgList, XPMan, StdCtrls, ShellApi, Unit5;

type
  TForm1 = class(TForm)
    Image1: TImage;            
    ImageList1: TImageList;
    Timer1: TTimer;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    False1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    XPManifest1: TXPManifest;
    N5: TMenuItem;
    N6: TMenuItem;
    ImageList2: TImageList;
    StatusBar1: TStatusBar;
    ImageList3: TImageList;
    N4: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    ImageList4: TImageList;
    Timer2: TTimer;
    Button1: TButton;
    Button2: TButton;
    Image2: TImage;
    Timer3: TTimer;
    ImageList5: TImageList;
    L1: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    ImageList6: TImageList;
    N13: TMenuItem;
    MiniMap1: TMenuItem;
    service1: TMenuItem;
    SaveDialog2: TSaveDialog;
    N12: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    procedure Image1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure False1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure Image1ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure L1Click(Sender: TObject);    
procedure dynamicparam;
    procedure N11Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure MiniMap1Click(Sender: TObject);
    procedure service1Click(Sender: TObject);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormResize(Sender: TObject);
private
  public
  end;

var
  Form1: TForm1;
  cd,tmpX,tmpY,i,nix,niy,e,rin,map,pxx,pyy,px,py,shiftID,id,nx,ny:integer;
  light,buff,karta:array[0..5000,0..5000]of integer;
  background:array[0..5000,0..5000] of integer;
  upground:array[0..5000,0..5000] of integer;
  dbuf,select,pezap,sloi,kis,onkis,on,SHIFTt:BOOLEAN;
  fm:text;
  fpt,asf:string;
pth,sch:string;
sizedrawX,sizedrawY,mapWsize,mapHsize,sbr,change,xs,ys,xe,ye,l,by,bx:integer;

implementation

{$R *.dfm}

uses Unit2,Unit3, Unit4, Unit6, Unit7, Unit8, Unit10, Unit9;

function Load(FName:string): boolean;
var
f:file of byte;
i,j:integer;
c:byte;
s:string;
begin
s:=FName;      
fpt:=S;
AssignFile(f,s+'.osn');
Reset(f);
 for i:=0 to mapHsize do
    for j:=0 to mapWsize do   begin
      read(f,c);
       karta[i,j]:=c;
       end;
       read(f,c);
       cd:=c;
      CloseFile(f);
      AssignFile(f,s+'.Down');
Reset(f);
 for i:=0 to mapHsize do
    for j:=0 to mapWsize do   begin
      read(f,c);
       background[i,j]:=c;
       end;
      CloseFile(f);
            AssignFile(f,s+'.Up');
Reset(f);
 for i:=0 to mapHsize do
    for j:=0 to mapWsize do   begin
      read(f,c);
       upground[i,j]:=c;
       end;
      CloseFile(f);
      load:=true;
end;

procedure  draw1;
var
xx,yy,i,j,z,limx,limy,l,l2:integer;
begin
xx:=0;
yy:=0;
l:=-1;
for i:=py to py+sizedrawX do
 for j:=px to px+sizedrawY do
 begin
 if light[j,i]=102  then if karta[j,i]<>101 then begin  for l:=1 to 6 do   light[j,i-7+l]:=0;   light[j,i]:=0; end;
 if light[j,i]=73  then if karta[j,i]<>73 then begin  for l:=1 to 6 do   light[j+7-l,i-7+l]:=0;    light[j,i]:=0; end;
 if light[j,i]=74  then if karta[j,i]<>74 then begin  for l:=1 to 6 do    light[j-7+l,i-7+l]:=0;    light[j,i]:=0; end;
 end;

for i:=py to py+sizedrawX do begin
 for j:=px to px+sizedrawY do begin
 if karta[j,i]=101 then begin for l:=1 to 6 do   light[j,i-7+l]:=101;    light[j,i]:=102; end;
 if karta[j,i]=74 then begin for l:=1 to 6 do   light[j-7+l,i-7+l]:=101;    light[j,i]:=74; end;
 if karta[j,i]=73 then begin for l:=1 to 6 do   light[j+7-l,i-7+l]:=101;    light[j,i]:=73; end;
     {if karta[j,i]<>0 then} z:=karta[j,i];

 if (j>-1)and(i>-1)and(i<mapWsize+1)and(j<mapHsize+1) then  if karta[j,i]<>0 then  Form1.ImageList1.Draw(Form1.Image1.Canvas,xx,yy,z,true);
 if (j>-1)and(i>-1)and(i<mapWsize+1)and(j<mapHsize+1) then  if light[j,i]=101 then  Form1.ImageList6.Draw(Form1.Image1.Canvas,xx,yy,0,true);

 //if karta[j,i]=110 then  Form1.ImageList5.Draw(Form1.Image1.Canvas,xx+pxx,yy+pyy,0,true);
     xx:=xx+32;
    end;
    yy:=yy+32;
    xx:=0;
    end;
end;




procedure  draw2;
var
xx,yy,i,j,z:integer;
begin
xx:=0;
yy:=0;
for i:=py to py+sizedrawX do begin
 for j:=px to px+sizedrawY do begin
     if upground[j,i]<>0 then z:=upground[j,i];

 if (j>-1)and(i>-1)and(i<mapWsize+1)and(j<mapHsize+1) then  if upground[j,i]<>0 then Form1.ImageList1.Draw(Form1.Image1.Canvas,xx,yy,z,true);

     xx:=xx+32;
    end;
    yy:=yy+32;
    xx:=0;
    end;
end;




procedure  draw0;
var
xx,yy,i,j,z:integer;
begin
xx:=0;
yy:=0;
for i:=py to py+sizedrawX do begin
 for j:=px to px+sizedrawY do begin
     if background[j,i]<>0 then z:=background[j,i];

 if (j>-1)and(i>-1)and(i<mapWsize+1)and(j<mapHsize+1) then if background[j,i]<>0 then  Form1.ImageList1.Draw(Form1.Image1.Canvas,xx,yy,z,true);

     xx:=xx+32;
    end;
    yy:=yy+32;
    xx:=0;
    end;
end;


procedure  sl1;
var
xx,yy,i,j,z:integer;
begin
xx:=0;
yy:=0;    
for i:=py to py+sizedrawX do
 for j:=px to px+sizedrawY do
 begin
 if light[j,i]=102  then if karta[j,i]<>101 then begin  for l:=1 to 6 do   light[j,i-7+l]:=0;   light[j,i]:=0; end;
 if light[j,i]=73  then if karta[j,i]<>73 then begin  for l:=1 to 6 do   light[j+7-l,i-7+l]:=0;    light[j,i]:=0; end;
 if light[j,i]=74  then if karta[j,i]<>74 then begin  for l:=1 to 6 do    light[j-7+l,i-7+l]:=0;    light[j,i]:=0; end;
 end;

for i:=py to py+sizedrawX do begin
 for j:=px to px+sizedrawY do begin
  if karta[j,i]=101 then begin for l:=1 to 6 do   light[j,i-7+l]:=101;    light[j,i]:=102; end;   
 if karta[j,i]=74 then begin for l:=1 to 6 do   light[j-7+l,i-7+l]:=101;    light[j,i]:=74; end;
 if karta[j,i]=73 then begin for l:=1 to 6 do   light[j+7-l,i-7+l]:=101;    light[j,i]:=73; end;

 if (j>-1)and(i>-1)and(i<mapWsize+1)and(j<mapHsize+1) then if map=1 then
  begin
  if background[j,i]<>0 then begin  Form1.ImageList1.Draw(Form1.Image1.Canvas,xx,yy,background[j,i],true);   Form1.ImageList1.Draw(Form1.Image1.Canvas,xx,yy,0,true);   end;
  if upground[j,i]<>0 then begin Form1.ImageList1.Draw(Form1.Image1.Canvas,xx,yy,upground[j,i],true);     Form1.ImageList1.Draw(Form1.Image1.Canvas,xx,yy,0,true); end;
  if karta[j,i]<>0 then  Form1.ImageList1.Draw(Form1.Image1.Canvas,xx,yy,karta[j,i],true);
  if light[j,i]=101 then  Form1.ImageList6.Draw(Form1.Image1.Canvas,xx,yy,0,true);
  end;



     xx:=xx+32;
    end;
    yy:=yy+32;
    xx:=0;
    end;
end;


procedure  sl0;
var
xx,yy,i,j,z:integer;
begin
xx:=0;
yy:=0;
for i:=py to py+sizedrawX do
 for j:=px to px+sizedrawY do
 begin
 if light[j,i]=102  then if karta[j,i]<>101 then begin  for l:=1 to 6 do   light[j,i-7+l]:=0;   light[j,i]:=0; end;
 if light[j,i]=73  then if karta[j,i]<>73 then begin  for l:=1 to 6 do   light[j+7-l,i-7+l]:=0;    light[j,i]:=0; end;
 if light[j,i]=74  then if karta[j,i]<>74 then begin  for l:=1 to 6 do    light[j-7+l,i-7+l]:=0;    light[j,i]:=0; end;
 end;

for i:=py to py+sizedrawX do begin
 for j:=px to px+sizedrawY do begin
  if karta[j,i]=101 then begin for l:=1 to 6 do   light[j,i-7+l]:=101;    light[j,i]:=102; end;
 if karta[j,i]=74 then begin for l:=1 to 6 do   light[j-7+l,i-7+l]:=101;    light[j,i]:=74; end;
 if karta[j,i]=73 then begin for l:=1 to 6 do   light[j+7-l,i-7+l]:=101;    light[j,i]:=73; end;      
 if (j>-1)and(i>-1)and(i<mapWsize+1)and(j<mapHsize+1) then if map=0 then
    begin
  if karta[j,i]<>0 then begin Form1.ImageList1.Draw(Form1.Image1.Canvas,xx,yy,karta[j,i],true);   Form1.ImageList1.Draw(Form1.Image1.Canvas,xx,yy,0,true);  end;
   if upground[j,i]<>0 then begin Form1.ImageList1.Draw(Form1.Image1.Canvas,xx,yy,upground[j,i],true);     Form1.ImageList1.Draw(Form1.Image1.Canvas,xx,yy,0,true); end;
  if background[j,i]<>0 then   Form1.ImageList1.Draw(Form1.Image1.Canvas,xx,yy,background[j,i],true);
  if light[j,i]=101 then  Form1.ImageList6.Draw(Form1.Image1.Canvas,xx,yy,0,true);
  end;

      xx:=xx+32;
    end;
    yy:=yy+32;
    xx:=0;
    end;
end;


procedure  sl2;
var
xx,yy,i,j,z:integer;
begin
xx:=0;
yy:=0;

for i:=py to py+sizedrawX do
 for j:=px to px+sizedrawY do
 begin
 if light[j,i]=102  then if karta[j,i]<>101 then begin  for l:=1 to 6 do   light[j,i-7+l]:=0;   light[j,i]:=0; end;
 if light[j,i]=73  then if karta[j,i]<>73 then begin  for l:=1 to 6 do   light[j+7-l,i-7+l]:=0;    light[j,i]:=0; end;
 if light[j,i]=74  then if karta[j,i]<>74 then begin  for l:=1 to 6 do    light[j-7+l,i-7+l]:=0;    light[j,i]:=0; end;
 end;

for i:=py to py+sizedrawX do begin
 for j:=px to px+sizedrawY do begin
   if karta[j,i]=101 then begin for l:=1 to 6 do   light[j,i-7+l]:=101;    light[j,i]:=102; end;  
 if karta[j,i]=74 then begin for l:=1 to 6 do   light[j-7+l,i-7+l]:=101;    light[j,i]:=74; end;
 if karta[j,i]=73 then begin for l:=1 to 6 do   light[j+7-l,i-7+l]:=101;    light[j,i]:=73; end;
 if (j>-1)and(i>-1)and(i<mapWsize+1)and(j<mapHsize+1) then    if map=2 then
  begin
  if background[j,i]<>0 then begin  Form1.ImageList1.Draw(Form1.Image1.Canvas,xx,yy,background[j,i],true);   Form1.ImageList1.Draw(Form1.Image1.Canvas,xx,yy,0,true);  end;
  if karta[j,i]<>0 then begin Form1.ImageList1.Draw(Form1.Image1.Canvas,xx,yy,karta[j,i],true);       Form1.ImageList1.Draw(Form1.Image1.Canvas,xx,yy,0,true);  end;
  if upground[j,i]<>0 then  Form1.ImageList1.Draw(Form1.Image1.Canvas,xx,yy,upground[j,i],true);
  if light[j,i]=101 then  Form1.ImageList6.Draw(Form1.Image1.Canvas,xx,yy,0,true);
  end;

     xx:=xx+32;
    end;
    yy:=yy+32;
    xx:=0;
    end;
end;



procedure  seldraw;
var
xx,yy,i,j,z:integer;
begin
xx:=xs*32;
yy:=ys*32;
for i:=ys to ny-py do begin
 for j:=xs to nx-px do begin

 Form1.ImageList1.Draw(Form1.Image1.Canvas,xx,yy,76,true);

     xx:=xx+32;
    end;
    yy:=yy+32;
    xx:=xs*32;
    end;
end;

//++++++++++++++++++++++++++++++++++++++++++++++++
   procedure  drawbuf;
var
xx,yy,i,j,z:integer;
begin
xx:=(nx-px)*32;
yy:=(ny-py)*32;
for i:=0 to by do begin
 for j:=0 to bx do begin

 Form1.ImageList1.Draw(Form1.Image1.Canvas,xx,yy,buff[j,i],true);

     xx:=xx+32;
    end;
    yy:=yy+32;
    xx:=(nx-px)*32;
    end;
end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//================ ����� ����� ��������� ========================
//---------------------------------------------------------------



 //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//============================ ������� ===========================
//----------------------------------------------------------------

procedure  lin;
var
 i:integer;
begin
for i:=0 to mapWsize+1  do
begin
Form1.Image1.Canvas.MoveTo(pxx,i*32+pyy);
Form1.Image1.Canvas.LineTo((mapHsize+1)*32+pxx,i*32+pyy);
end;

for i:=0 to mapHsize+1 do
begin
Form1.Image1.Canvas.MoveTo(i*32+pxx,pyy);
Form1.Image1.Canvas.LineTo(i*32+pxx,(mapWsize+1)*32+pyy);
end;

end;

procedure TForm1.Image1Click(Sender: TObject);
var
lj,li:integer;
begin
if mapHsize=0 then if mapWsize=0 then form9.show;
nix:=0;
niy:=0;
if SHIFTt=true then
begin
if shiftid<>0 then Form8.Image2.Canvas.Pixels[nx,ny]:=Form8.ColorBox5.Selected else Form8.Image2.Canvas.Pixels[nx,ny]:=Form8.ColorBox1.Selected;
end
else
begin
if id<>0 then Form8.Image2.Canvas.Pixels[nx,ny]:=Form8.ColorBox5.Selected else Form8.Image2.Canvas.Pixels[nx,ny]:=Form8.ColorBox1.Selected;
end;

if (karta[nx,ny]=101)or(karta[nx,ny]=73)or(karta[nx,ny]=74) then begin
  for li:=py to py+sizedrawX do
 for lj:=px to px+sizedrawY do
light[lj,li]:=0;
for li:=py to py+sizedrawX do
 for lj:=px to px+sizedrawY do begin
   if karta[lj,li]=101 then begin for l:=1 to 6 do   light[lj,li-7+l]:=101;    light[lj,li]:=102; end;
 if karta[lj,li]=74 then begin for l:=1 to 6 do   light[lj-7+l,li-7+l]:=101;    light[lj,li]:=74; end;
 if karta[lj,li]=73 then begin for l:=1 to 6 do   light[lj+7-l,li-7+l]:=101;    light[lj,li]:=73; end;
 end;
 end;

if id=49 then begin
s:=inttostr(nx)+'-'+inttostr(ny);
   Form4.Show;
   end;

if id=125 then begin
s:=inttostr(nx)+'-'+inttostr(ny);
   Form4.Show;
   end;

if map=2 then if SHIFTt=false then upground[nx,ny]:=id;
if map=1 then if SHIFTt=false then karta[nx,ny]:=id;
if map=0 then if SHIFTt=false then background[nx,ny]:=id;

if map=2 then if SHIFTt=true then upground[nx,ny]:=shiftId;
if map=1 then if SHIFTt=True then karta[nx,ny]:=shiftId;
if map=0 then if SHIFTt=true then background[nx,ny]:=shiftId;


if  id=13 then for i:=13 to 24 do  begin
if map=2 then if SHIFTt=false then upground[nx+nix,ny+niy]:=i;
if map=2 then if SHIFTt=true then upground[nx+nix,ny+niy]:=I;
if map=1 then if SHIFTt=false then karta[nx+nix,ny+niy]:=i;
if map=1 then if SHIFTt=True then karta[nx+nix,ny+niy]:=I;
if map=0 then if SHIFTt=false then background[nx+nix,ny+niy]:=i;
if map=0 then if SHIFTt=true then background[nx+nix,ny+niy]:=I;

     if nix>2 then begin nix:=-1;   niy:=niy+1; end;
     if i=17 then nix:=nix+2;
     if i=19 then nix:=nix+2;
     nix:=nix+1;
  end;

if id=26 then begin
              id:=27;
              nx:=nx+1;
               if map=2 then if SHIFTt=false then upground[nx,ny]:=id;
                if map=1 then if SHIFTt=false then karta[nx,ny]:=id;
                  if map=0 then if SHIFTt=false then background[nx,ny]:=id;

                if map=2 then if SHIFTt=true then upground[nx,ny]:=shiftId;
                  if map=1 then if SHIFTt=True then karta[nx,ny]:=shiftId;
                    if map=0 then if SHIFTt=true then background[nx,ny]:=shiftId;
              id:=26;
              nx:=nx-1;
              end;

if id=77 then begin
tmpX:=nx;
tmpY:=ny;
l:=0;
                  l:=l+1;
for i:=78 to 82 do begin
nx:=nx+l;
               if map=2 then if SHIFTt=false then upground[nx,ny]:=i;
                if map=1 then if SHIFTt=false then karta[nx,ny]:=i;
                  if map=0 then if SHIFTt=false then background[nx,ny]:=i;
                  l:=l+1;
                  if l=2 then begin ny:=ny+1; l:=l-2; nx:=nx-1; end;

end;
nx:=tmpX;
ny:=tmpy;
end;
//-----------------------------
//--------------------------------------
if id=58 then begin
tmpX:=nx;
tmpY:=ny;
for i:=59 to 61 do begin
nx:=nx+1;
               if map=2 then if SHIFTt=false then upground[nx,ny]:=i;
                if map=1 then if SHIFTt=false then karta[nx,ny]:=i;
                  if map=0 then if SHIFTt=false then background[nx,ny]:=i;

end;
nx:=tmpX-2;
ny:=ny+1;
 for i:=62 to 66 do begin
nx:=nx+1;
               if map=2 then if SHIFTt=false then upground[nx,ny]:=i;
                if map=1 then if SHIFTt=false then karta[nx,ny]:=i;
                  if map=0 then if SHIFTt=false then background[nx,ny]:=i;

end;
 nx:=tmpX-3;
ny:=ny+1;
 for i:=67 to 71 do begin
nx:=nx+1;
               if map=2 then if SHIFTt=false then upground[nx,ny]:=i;
                if map=1 then if SHIFTt=false then karta[nx,ny]:=i;
                  if map=0 then if SHIFTt=false then background[nx,ny]:=i;

end;

 nx:=tmpX-3;
ny:=ny+1;
 for i:=72 to 77 do begin
nx:=nx+1;
               if map=2 then if SHIFTt=false then upground[nx,ny]:=i;
                if map=1 then if SHIFTt=false then karta[nx,ny]:=i;
                  if map=0 then if SHIFTt=false then background[nx,ny]:=i;

end;

 nx:=tmpX-3;
ny:=ny+1;
 for i:=78 to 83 do begin
nx:=nx+1;
               if map=2 then if SHIFTt=false then upground[nx,ny]:=i;
                if map=1 then if SHIFTt=false then karta[nx,ny]:=i;
                  if map=0 then if SHIFTt=false then background[nx,ny]:=i;

end;

nx:=tmpX;
ny:=tmpY;
end;
//--------------------------------------
 if id=87 then begin
tmpX:=nx;
tmpY:=ny;
for i:=88 to 89 do begin
nx:=nx+1;
               if map=2 then if SHIFTt=false then upground[nx,ny]:=i;
                if map=1 then if SHIFTt=false then karta[nx,ny]:=i;
                  if map=0 then if SHIFTt=false then background[nx,ny]:=i;

end;
nx:=tmpX-1;
ny:=ny+1;
 for i:=90 to 92 do begin
nx:=nx+1;
               if map=2 then if SHIFTt=false then upground[nx,ny]:=i;
                if map=1 then if SHIFTt=false then karta[nx,ny]:=i;
                  if map=0 then if SHIFTt=false then background[nx,ny]:=i;

end;
 nx:=tmpX+1;
ny:=ny+1;
               if map=2 then if SHIFTt=false then upground[nx,ny]:=93;
                if map=1 then if SHIFTt=false then karta[nx,ny]:=93;
                  if map=0 then if SHIFTt=false then background[nx,ny]:=93;



nx:=tmpX-1;
ny:=ny+1;
 for i:=94 to 95 do begin
nx:=nx+1;
               if map=2 then if SHIFTt=false then upground[nx,ny]:=i;
                if map=1 then if SHIFTt=false then karta[nx,ny]:=i;
                  if map=0 then if SHIFTt=false then background[nx,ny]:=i;

end;


nx:=tmpX;
ny:=tmpY;
end;

//----------------------------------------
if id=98 then begin
tmpy:=ny;
tmpy:=tmpy+1;
               if map=2 then if SHIFTt=false then upground[nx,tmpy]:=99;
                if map=1 then if SHIFTt=false then karta[nx,tmpy]:=99;
                  if map=0 then if SHIFTt=false then background[nx,tmpy]:=99;
                  end;


//           -------------------------------

//           -------------------------------
if id=131 then begin
               if map=2 then if SHIFTt=false then upground[nx+1,ny]:=132;
                if map=1 then if SHIFTt=false then karta[nx+1,ny]:=132;
                  if map=0 then if SHIFTt=false then background[nx+1,ny]:=132;
                  end;




end;

procedure  TForm1.Timer1Timer(Sender: TObject);
var
li,lj:integer;
begin
Form1.Caption:='Position ['+inttostr(nx)+':'+inttostr(ny)+']'+'|['+inttostr(karta[nx,ny])+']';
StatusBar1.Width:=Form1.Width;
StatusBar1.Top:=Form1.Height-StatusBar1.Height-45;
//StatusBar1.Left:=Form1.Width-StatusBar1.Width;
if map=0 then StatusBar1.SimpleText:='Ce���� ������������� ������� �����������' ;
if map=1 then StatusBar1.SimpleText:='Ce���� ������������� ������ �����������' ;
if map=2 then StatusBar1.SimpleText:='Ce���� ������������� ������ �����������' ;
if map=1 then if kis=true then if SHIFTt=true then begin

if (karta[nx,ny]=101)or(karta[nx,ny]=73)or(karta[nx,ny]=74) then
  for li:=py to py+sizedrawX do
 for lj:=px to px+sizedrawY do
light[lj,li]:=0;

for li:=py to py+sizedrawX do
 for lj:=px to px+sizedrawY do begin
   if karta[lj,li]=101 then begin for l:=1 to 6 do   light[lj,li-7+l]:=101;    light[lj,li]:=102; end;
 if karta[lj,li]=74 then begin for l:=1 to 6 do   light[lj-7+l,li-7+l]:=101;    light[lj,li]:=74; end;
 if karta[lj,li]=73 then begin for l:=1 to 6 do   light[lj+7-l,li-7+l]:=101;    light[lj,li]:=73; end;
 end;

 end;


if map=2 then if kis=true then
if SHIFTt=true then begin
  upground[nx,ny]:=shiftID;
 if shiftID<>0 then Form8.Image2.Canvas.Pixels[nx,ny]:=Form8.ColorBox5.Selected else Form8.Image2.Canvas.Pixels[nx,ny]:=Form8.ColorBox1.Selected;
  end
   else
   begin
    upground[nx,ny]:=ID;
      if ID<>0 then Form8.Image2.Canvas.Pixels[nx,ny]:=Form8.ColorBox5.Selected else Form8.Image2.Canvas.Pixels[nx,ny]:=Form8.ColorBox1.Selected;
  end ;

if map=0 then if kis=true then
if SHIFTt=true then begin
  background[nx,ny]:=shiftID;
 if shiftID<>0 then Form8.Image2.Canvas.Pixels[nx,ny]:=Form8.ColorBox5.Selected else Form8.Image2.Canvas.Pixels[nx,ny]:=Form8.ColorBox1.Selected;
  end
   else
   begin
    background[nx,ny]:=ID;
      if ID<>0 then Form8.Image2.Canvas.Pixels[nx,ny]:=Form8.ColorBox5.Selected else Form8.Image2.Canvas.Pixels[nx,ny]:=Form8.ColorBox1.Selected;
  end ;

  if map=1 then if kis=true then
if SHIFTt=true then begin
   karta[nx,ny]:=SHIFTID;
 if shiftID<>0 then Form8.Image2.Canvas.Pixels[nx,ny]:=Form8.ColorBox5.Selected else Form8.Image2.Canvas.Pixels[nx,ny]:=Form8.ColorBox1.Selected;
  end
   else
   begin
   karta[nx,ny]:=ID;
      if ID<>0 then Form8.Image2.Canvas.Pixels[nx,ny]:=Form8.ColorBox5.Selected else Form8.Image2.Canvas.Pixels[nx,ny]:=Form8.ColorBox1.Selected;
  end ;

Image1.Canvas.Rectangle(0,0,Screen.Width,Screen.Height);
if sloi=false then begin
  if Form5.CheckBox1.Checked=true then draw0;
  if Form5.CheckBox3.Checked=true then draw1;
  if Form5.CheckBox2.Checked=true then draw2;
end;
if sloi=true then if map=1 then sl1;   
if sloi=true then if map=0 then sl0;
if sloi=true then if map=2 then sl2;
if select=true then seldraw;    
if dbuf=true then drawbuf;
//+++++++++++++++++++++++++++
if SHIFTt=true  then ImageList1.Draw(Form1.Image1.Canvas,Mouse.CursorPos.X-Form1.Left-25,Mouse.CursorPos.Y-Form1.Top-66,shiftID,true);
if id<>12 then ImageList1.Draw(Form1.Image1.Canvas,Mouse.CursorPos.X-Form1.Left-0,Mouse.CursorPos.Y-Form1.Top-30,id,true) else ImageList4.Draw(Form1.Image1.Canvas,Mouse.CursorPos.X-Form1.Left-0,Mouse.CursorPos.Y-Form1.Top-30,rin,true);
if map=0  then ImageList3.Draw(Form1.Image1.Canvas,Mouse.CursorPos.X-Form1.Left+25,Mouse.CursorPos.Y-Form1.Top+0,0,true);
if map=1 then ImageList3.Draw(Form1.Image1.Canvas,Mouse.CursorPos.X-Form1.Left+25,Mouse.CursorPos.Y-Form1.Top+0,1,true);
if map=2  then ImageList3.Draw(Form1.Image1.Canvas,Mouse.CursorPos.X-Form1.Left+25,Mouse.CursorPos.Y-Form1.Top+0,2,true);
if Form5.CheckBox4.Checked=true then lin;                                                
if SHIFTt=true  then   if kis=true then ImageList2.Draw(Form1.Image1.Canvas,Mouse.CursorPos.X-Form1.Left-0,Mouse.CursorPos.Y-Form1.Top-30,0,true);
if SHIFTt=false  then if kis=true  then ImageList2.Draw(Form1.Image1.Canvas,Mouse.CursorPos.X-Form1.Left-25,Mouse.CursorPos.Y-Form1.Top-66,0,true);

Form1.Image1.Repaint;
end;

//-------------------------------------------------------------
//_____________________________________________________________
//================ ���� ��������� ���������� ==================
//_____________________________________________________________
//-------------------------------------------------------------

procedure  TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
xx,yy,i,j,tmx,lx,ly:integer;
begin
if key=69 then if (karta[nx,ny]=49)or(karta[nx,ny]=125) then
if FileExists(fpt+inttostr(nx)+'-'+inttostr(ny)+'.txt') then
begin
s:=inttostr(nx)+'-'+inttostr(ny);
Form4.Memo1.Clear;
Form4.Memo1.Lines.LoadFromFile(fpt+inttostr(nx)+'-'+inttostr(ny)+'.txt');
  Form4.Show;
  end else ShowMessage('EROR 404'+chr(13)+'File Not Found!');
//-+--------------------------------------

if key=13 then if karta[nx,ny]=125 then
 begin
 s:=inttostr(nx)+'-'+inttostr(ny);
 Form4.opn;
 Form4.Show;
 end;
 //----------------------------------
 if key=80 then Form8.Show;
 //===========================
 if key=83 then
 begin
if dbuf=false then begin sbr:=1; dbuf:=true; end;
if sbr=0 then dbuf:=false;
sbr:=0;
 end;
 //----------------------------------   
 if key=86 then
 begin
 //ShowMessage('OK');
 lx:=0;
 ly:=0;
 for i:=ny to ny+by do
                  begin
                     for j:=nx to nx+bx do
                        begin
                             if map=0 then background[j,i]:=buff[lx,ly];
                             if map=1 then karta[j,i]:=buff[lx,ly];
                             if map=2 then upground[j,i]:=buff[lx,ly];
                             lx:=lx+1;
                        end;
                    ly:=ly+1;
                    lx:=0;
                 end;
 end;
 //----------------------------------

if key=32 then begin
if select=false then begin change:=1; select:=true; xs:=nx-px; ys:=ny-py; end;
if change=0 then
    begin
        if xs<=nx-px then if ys<=ny-py then
            begin     
              //   ShowMessage('Complite!');
            bx:=0;
            by:=0;
               xx:=xs*32;
               yy:=ys*32;
               for i:=ys+py to ny do
                  begin
                     for j:=xs+px to nx do
                        begin
                             if map=0 then buff[bx,by]:=background[j,i];
                             if map=1 then buff[bx,by]:=karta[j,i];
                             if map=2 then buff[bx,by]:=upground[j,i];
                             bx:=bx+1;
                            xx:=xx+32;
                        end;
                        tmx:=bx-1;
                    yy:=yy+32;
                    xx:=xs*32;
                    by:=by+1;
                    bx:=0;
                 end;
                 bx:=tmx;
                 by:=by-1;
            end;
            select:=false;
    end;
change:=0;
end;
 //----------------------------------
if Key=17 then  Form2.Show;
if Key=16 then if ShIFTt=false then begin  SHIFTt:=TRUE;
on:=true;
end;
if key=16 then begin
                     if map=1 then shiftID:=karta[nx,ny];
                     if map=2 then shiftID:=upground[nx,ny];
                     if map=0 then shiftID:=background[nx,ny];
                     end;
if Key=16 then if on=false then if SHIFTt=TRUE then ShIFTt:=false;
if key=39 then begin
  pxx:=pxx-32;
  px:=px+1;
  xs:=xs-1;
  end;
if key=37 then begin
  pxx:=pxx+32;
  px:=px-1;
  xs:=xs+1;
  end;
if key=38 then begin
  pyy:=pyy+32;
  py:=py-1;     
  ys:=ys+1;
  end;
if key=40 then begin
  pyy:=pyy-32;
  py:=py+1;
  ys:=ys-1;
  end;
on:=false;
end;

procedure  TForm1.False1Click(Sender: TObject);
var
f:file of byte;
d,l,i,j:integer;
c:byte;
begin
OpenDialog1.Execute;
AssignFile(f,OpenDialog1.FileName+'.osn');
fpt:=OpenDialog1.FileName;
Reset(f);                                              
 for i:=0 to mapHsize do
    for j:=0 to mapWsize do   begin
      read(f,c);
       karta[i,j]:=c;
       end;
         read(f,c);
         d:=c;
  //**********************
  //Form5.FormCreate(sender);
    Form5.ListBox1.ItemIndex:=d;
     form5.Edit2.Text:=form5.ListBox1.Items.Strings[d];
te:=form5.ListBox1.Items.Strings[d];
     Form5.Button1Click(sender);
     //----------------------
      CloseFile(f);
      AssignFile(f,OpenDialog1.FileName+'.Down');
Reset(f);
 for i:=0 to mapHsize do
    for j:=0 to mapWsize do   begin
      read(f,c);
       background[i,j]:=c;
       end;
      CloseFile(f);
            AssignFile(f,OpenDialog1.FileName+'.Up');
Reset(f);
 for i:=0 to mapHsize do
    for j:=0 to mapWsize do   begin
      read(f,c);
       upground[i,j]:=c;
       end;
      CloseFile(f);

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
 Form8.Image2.Repaint;

end;

procedure TForm1.N2Click(Sender: TObject);
var
f:file of byte;
d,i,j:integer;
c:byte;
begin
asf:='';
SaveDialog1.Execute;
fpt:=SaveDialog1.FileName;
pth:=SaveDialog1.FileName;
sch:=SaveDialog1.FileName;
if  length(pth)>4 then begin
asf:=asf+sch[length(pth)-3];
asf:=asf+SaveDialog1.FileName[length(pth)-2];
asf:=asf+SaveDialog1.FileName[length(pth)-1];
asf:=asf+SaveDialog1.FileName[length(pth)];
if  asf='.tmg' then begin
     pth:='';
     for i:=1 to length(sch)-4 do
        pth:=pth+sch[i];
        end
        else pezap:=true ;

end;
if  asf='.tmg' then begin Image2.Visible:=true;  Button1.Visible:=true;  Button2.Visible:=true; Timer1.Enabled:=false; end;
if pezap=true then begin
AssignFile(f,pth+'.tmg.osn');
rewrite(f);
begin
 for i:=0 to mapHsize do
    for j:=0 to mapWsize do
      write(f,karta[i,j]);
       end;
       d:=Form5.ListBox1.ItemIndex;
         write(f,d);
      CloseFile(f);
      AssignFile(f,pth+'.tmg.Down');
rewrite(f);
begin
 for i:=0 to mapHsize do
    for j:=0 to mapWsize do
      write(f,background[i,j]);
       end;
         write(f,d);
      CloseFile(f);
       AssignFile(f,pth+'.tmg.Up');
rewrite(f);
begin
 for i:=0 to mapHsize do
    for j:=0 to mapWsize do
      write(f,upground[i,j]);
       end;                   
         write(f,d);
      CloseFile(f);
       AssignFile(fm,pth+'.tmg');
rewrite(fm);
    write(fm,'�������� ���� ��� ������ �����.');
    write(fm,'�����-����������:');
    write(fm,SaveDialog1.FileName+'osn.tmg');
    write(fm,SaveDialog1.FileName+'Down.tmg');
    write(fm,SaveDialog1.FileName+'Up.tmg');
    write(fm,'Total size is: 75 kb');
    CloseFile(fm);
    end;

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
 Form8.Image2.Repaint;

end;


procedure TForm1.N5Click(Sender: TObject);
begin
Application.CreateForm(TForm3, Form3);
Form3.Show;
end;

procedure TForm1.N6Click(Sender: TObject);
begin
Halt;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
Form6.show;
end;


procedure TForm1.Image1ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin
 if kis=false then begin  kis:=TRUE;
onkis:=true;
end;
if onkis=false then if kis=TRUE then kis:=false;
onkis:=false;
end;

procedure TForm1.FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
map:=map-1;
if map<0 then map:=0;
end;

procedure TForm1.FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
 map:=map+1;
if map>2 then map:=2;
end;

procedure TForm1.N7Click(Sender: TObject);
begin
sloi:=false;
end;

procedure TForm1.N8Click(Sender: TObject);
begin
sloi:=true;
end;

procedure TForm1.dynamicparam;
var 
exe2,exe,te:string;
i,ind:integer;
begin
{Form5.FormCreate(form5);
if FileExists('c:\editFolder.ini') then
Form5.Memo1.Lines.LoadFromFile('c:\editFolder.ini');

if form5.ListBox1.ItemIndex<0 then form5.ListBox1.Items.LoadFromFile(form5.Memo1.Lines[0]+'Zones\Images.pth');
if form5.ListBox1.ItemIndex<0 then form5.ListBox1.ItemIndex:=0;
form5.ListBox1.ItemIndex:=0;
ind:=form5.ListBox1.ItemIndex;
te:=form5.ListBox1.Items.Strings[ind];
for i:=0 to 133 do begin
   form5.Image1.Picture.LoadFromFile(form5.Memo1.Lines[0]+'Zones'+form5.ListBox1.Items.Strings[ind]+'text ('+inttostr(i)+').bmp');
  Form1.ImageList1.AddMasked(form5.Image1.Picture.Bitmap,$ffffff);
  end;
   // Form5.FormCreate(sender);
    Form5.ListBox1.ItemIndex:=cd;
     form5.Edit2.Text:=form5.ListBox1.Items.Strings[cd];
te:=form5.ListBox1.Items.Strings[cd];
     Form5.Button1Click(form5);    }
    end;



procedure TForm1.FormCreate(Sender: TObject);
var
i,j:integer;
begin
Image1.Width:=screen.Width;
Image1.Height:=screen.Height;
if ParamCount <> 0 then
begin
 Load(ParamStr(1));
    end;
     dynamicparam;
 sloi:=true;
rin:=0;
map:=1;
mapHsize:=0;
mapWsize:=0;
  sizedrawX:=trunc(form1.Height/32);  
  sizedrawy:=trunc(form1.Width/32);
end;

procedure TForm1.N9Click(Sender: TObject);
begin
Form2.Show;
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
rin:=rin+1;
if rin>8 then rin:=0;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
f:file of byte;
d,i,j:integer;
c:byte;
begin
pezap:=true;  
Timer1.Enabled:=True;
Image2.Visible:=false;
Form1.Button1.Visible:=false;
Form1.Button2.Visible:=false;
AssignFile(f,pth+'.tmg.osn');
rewrite(f);
begin
 for i:=0 to mapHsize do
    for j:=0 to mapWsize do
      write(f,karta[i,j]);
       end;     
       d:=Form5.ListBox1.ItemIndex;
         write(f,d);
      CloseFile(f);
      AssignFile(f,pth+'.tmg.Down');
rewrite(f);
begin
 for i:=0 to mapHsize do
    for j:=0 to mapWsize do
      write(f,background[i,j]);
       end;                 
         write(f,d);
      CloseFile(f);
       AssignFile(f,pth+'.tmg.Up');
rewrite(f);
begin
 for i:=0 to mapHsize do
    for j:=0 to mapWsize do
      write(f,upground[i,j]);
       end;
         write(f,d);
      CloseFile(f);
       AssignFile(fm,pth+'.tmg');
rewrite(fm);
    write(fm,'�������� ���� ��� ������ �����.');
    write(fm,'�����-����������:');
    write(fm,SaveDialog1.FileName+'osn.tmg');
    write(fm,SaveDialog1.FileName+'Down.tmg');
    write(fm,SaveDialog1.FileName+'Up.tmg');
    write(fm,'Total size is: 75 kb');
    CloseFile(fm);
    
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
pezap:=false;
Image2.Visible:=false;
Timer1.Enabled:=True;
Form1.Button1.Visible:=false;
Form1.Button2.Visible:=false;
end;

procedure TForm1.Timer3Timer(Sender: TObject);
var
x,y:real;
begin
x:=(Form1.Width/2)-(Image2.Width/2);
y:=(Form1.Height/2)-(Image2.Height/2);
Image2.left:=trunc(x);
Image2.top:=trunc(y);
Button1.Left:=Image2.left+20;
Button1.Top:=Image2.top+70;
Button2.Left:=Image2.left+160;
Button2.Top:=Image2.top+70;
end;

procedure TForm1.L1Click(Sender: TObject);
begin
Form5.Show;
end;

procedure TForm1.N11Click(Sender: TObject);
begin
if FileExists(Form5.Memo1.Lines[0]+'Addons\Help.exe') then ShellExecute(0,'Open',pchar(Form5.Memo1.Lines[0]+'Addons\Help.exe'),nil,nil,1);
end;



procedure TForm1.N12Click(Sender: TObject);
  var
f:file of byte;
d,i,j:integer;
c:byte;
begin
form9.ShowModal;
 for i:=0 to mapwsize do
    for j:=0 to maphsize do  begin
    light[i,j]:=0;
    buff[i,j]:=0;
    karta[i,j]:=0;
    background[i,j]:=0;
    upground[i,j]:=0;  end;
       
       end;

procedure TForm1.N13Click(Sender: TObject);
begin
 Form7.Show;
end;

procedure TForm1.MiniMap1Click(Sender: TObject);
begin
Form8.Show;
end;

procedure TForm1.service1Click(Sender: TObject);
begin
Form10.Show;
end;

///////////////////mouse///////////////////////

procedure TForm1.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
rx,ry:real;
begin
rx:=(x-2)/32;
ry:=(y-2)/32;
nx:=trunc(rx)+px;
ny:=trunc(ry)+py;
  //form1.Caption:='x:='+inttostr(x-2)+' | y:='+ inttostr(y-2);

end;

procedure TForm1.FormResize(Sender: TObject);
begin
  sizedrawX:=trunc(form1.Height/32);  
  sizedrawy:=trunc(form1.Width/32);
end;

end.
