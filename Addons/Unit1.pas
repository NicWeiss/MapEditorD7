unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ImgList;

type
  TForm1 = class(TForm)
    ImageList1: TImageList;
    Memo1: TMemo;
    ListBox1: TListBox;
    Image2: TImage;
    Timer1: TTimer;
    Image1: TImage;
    ImageList2: TImageList;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);   
procedure draw0;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  karta:array[0..500,0..50]of integer;
  px,py,ind,cd:integer;  
te,s:string;

implementation

{$R *.dfm}

function Load(FName:string): boolean;
var
f:file of byte;
i,j:integer;
c:byte;
begin
i:=0;
s:=FName;
j:=-1;
repeat
j:=j+1;
until s[length(s)-j]='\';
Form1.Caption:=Form1.Caption+' - '+copy(s,length(s)-j+1,length(s));
AssignFile(f,s);
s:=Form1.Caption;
Reset(f);
 for i:=0 to 500 do
    for j:=0 to 50 do   begin
      read(f,c);
       karta[i,j]:=c;
       end;
      if not EOF(f) then begin read(f,c);
       cd:=c;
       end;
      CloseFile(f);
       if Form1.ListBox1.ItemIndex<0 then Form1.ListBox1.Items.LoadFromFile(Form1.Memo1.Lines[0]+'Zones\Images.pth');
if Form1.ListBox1.ItemIndex<0 then Form1.ListBox1.ItemIndex:=0;
Form1.ListBox1.ItemIndex:=cd;
ind:=Form1.ListBox1.ItemIndex;
te:=Form1.ListBox1.Items.Strings[ind];
for i:=0 to 133 do begin
   Form1.Image2.Picture.LoadFromFile(Form1.Memo1.Lines[0]+'Zones'+Form1.ListBox1.Items.Strings[ind]+'text ('+inttostr(i)+').bmp');
  Form1.ImageList1.AddMasked(Form1.Image2.Picture.Bitmap,$ffffff);
  end;
  if cd=2 then
   begin
  Form1.Image2.Picture.LoadFromFile(Form1.Memo1.Lines[0]+'Addons\Back\Angel.bmp');
  Form1.ImageList2.AddMasked(Form1.Image2.Picture.Bitmap,$ffffff);
  end;
   if cd=0 then
   begin
  Form1.Image2.Picture.LoadFromFile(Form1.Memo1.Lines[0]+'Addons\Back\Green.bmp');
  Form1.ImageList2.AddMasked(Form1.Image2.Picture.Bitmap,$ffffff);
  end;    
   if cd=1 then
   begin
  Form1.Image2.Picture.LoadFromFile(Form1.Memo1.Lines[0]+'Addons\Back\Dark.bmp');
  Form1.ImageList2.AddMasked(Form1.Image2.Picture.Bitmap,$ffffff);
  end;                                          
   if cd=3 then
   begin
  Form1.Image2.Picture.LoadFromFile(Form1.Memo1.Lines[0]+'Addons\Back\Snow.bmp');
  Form1.ImageList2.AddMasked(Form1.Image2.Picture.Bitmap,$ffffff);
  end;

 end;

procedure TForm1.FormCreate(Sender: TObject);
begin
    Memo1.Lines.LoadFromFile('c:\editFolder.ini');
if ParamCount <> 0 then
begin
 Load(ParamStr(1));
    end;
    px:=2;
    py:=0;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
Form1.Caption:=s+' ['+inttostr(px)+':'+inttostr(py)+']';
Image1.Width:=Screen.Width;
Image1.Height:=Screen.Height;
Form1.ImageList2.Draw(Form1.Image1.Canvas,0,0,0,true);
 draw0;
 Form1.Image1.Repaint;
end;

procedure TForm1.draw0;
var
xx,yy,i,j,z:integer;
begin
xx:=0;
yy:=0;
for i:=py to py+25 do begin
 for j:=px to px+45 do begin
 if (j>-1)and(i>-1)and(i<51)and(j<501) then if karta[j,i]<>0 then  Form1.ImageList1.Draw(Form1.Image1.Canvas,xx,yy,karta[j,i],true);
     xx:=xx+32;
    end;
    yy:=yy+32;
    xx:=0;
    end;
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=39 then begin
  px:=px+1;
  end;
if key=37 then begin
  px:=px-1;
  end;
if key=38 then begin
  py:=py-1;
  end;
if key=40 then begin
  py:=py+1;
  end;
end;

end.
