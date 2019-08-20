unit Unit7;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, XPMan, CheckLst;

type
  TForm7 = class(TForm)
    Image1: TImage;
    Edit1: TEdit;
    Button10: TButton;
    Button11: TButton;
    XPManifest1: TXPManifest;
    Timer1: TTimer;
    Memo1: TMemo;
    Button12: TButton;
    RadioGroup1: TRadioGroup;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    ComboBox3: TComboBox;
    Label3: TLabel;
    ComboBox4: TComboBox;
    TrackBar1: TTrackBar;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;
  info:array[0..12,0..12]of string;   
  ib:array[0..135,0..99]of integer;
i,j:integer;

implementation

uses Unit1, Unit5;

{$R *.dfm}

procedure TForm7.FormCreate(Sender: TObject);
begin
Image1.Picture.Bitmap.Width:=32;  
Image1.Picture.Bitmap.Height:=32;
Memo1.Lines.LoadFromFile(form5.Memo1.Lines[0]+'Zones\parametrs.pth');
Form1.ImageList1.Draw(image1.canvas,0,0,TrackBar1.Position,true);
end;

procedure TForm7.Timer1Timer(Sender: TObject);
var
tmp:integer;
begin
j:=trunc(trackBar1.Position/12);
i:=trackBar1.Position-(j*12);
info[i,j]:=inttostr(TrackBar1.Position)+','+inttostr(i*32)+','+inttostr(j*32)+',32,32,0,0,0';
if ib[trackBar1.Position,8]<>0 then info[i,j]:=info[i,j]+','+inttostr(ib[trackBar1.Position,8]);
if ib[trackBar1.Position,9]<>0 then info[i,j]:=info[i,j]+','+inttostr(ib[trackBar1.Position,9]);
if ib[trackBar1.Position,10]<>0 then info[i,j]:=info[i,j]+','+inttostr(ib[trackBar1.Position,10]);
if ib[trackBar1.Position,11]<>0 then info[i,j]:=info[i,j]+','+inttostr(ib[trackBar1.Position,11]);
/////////////////////////////////////////////

///////////////////////////////////////////////////
Image1.Canvas.Rectangle(0,0,32,32);
Form1.ImageList1.Draw(image1.canvas,0,0,TrackBar1.Position,true);
Image1.Repaint;
edit1.text:=info[i,j];
end;

procedure TForm7.Button11Click(Sender: TObject);
begin

combobox2.ItemIndex:=0;
combobox3.ItemIndex:=0;
combobox4.ItemIndex:=0;
TrackBar1.Position:=  TrackBar1.Position+1;
if  ib[trackBar1.Position,8]=ord('a') then radiobutton1.Checked:=true;
if  ib[trackBar1.Position,8]=ord('b') then radiobutton2.Checked:=true;
if  ib[trackBar1.Position,8]=ord('c') then radiobutton3.Checked:=true;
if  ib[trackBar1.Position,9]=ord('d') then combobox1.ItemIndex:=0;
if  ib[trackBar1.Position,9]=ord('e') then combobox1.ItemIndex:=1;
if  ib[trackBar1.Position,10]=ord('f') then combobox2.ItemIndex:=1;
if  ib[trackBar1.Position,10]=ord('g') then combobox2.ItemIndex:=2;
if  ib[trackBar1.Position,11]=ord('h') then combobox3.ItemIndex:=1;
if  ib[trackBar1.Position,11]=ord('i') then combobox4.ItemIndex:=1; 
end;

procedure TForm7.Button10Click(Sender: TObject);
begin

combobox2.ItemIndex:=0;
combobox3.ItemIndex:=0;
combobox4.ItemIndex:=0;
TrackBar1.Position:=TrackBar1.Position-1;
if  ib[trackBar1.Position,8]=ord('a') then radiobutton1.Checked:=true;
if  ib[trackBar1.Position,8]=ord('b') then radiobutton2.Checked:=true;
if  ib[trackBar1.Position,8]=ord('c') then radiobutton3.Checked:=true;
if  ib[trackBar1.Position,9]=ord('d') then combobox1.ItemIndex:=0;
if  ib[trackBar1.Position,9]=ord('e') then combobox1.ItemIndex:=1;
if  ib[trackBar1.Position,10]=ord('f') then combobox2.ItemIndex:=1;
if  ib[trackBar1.Position,10]=ord('g') then combobox2.ItemIndex:=2;
if  ib[trackBar1.Position,11]=ord('h') then combobox3.ItemIndex:=1;
if  ib[trackBar1.Position,11]=ord('i') then combobox4.ItemIndex:=1; 
end;

procedure TForm7.Button2Click(Sender: TObject);
begin
Memo1.Lines[TrackBar1.Position]:='0';
TrackBar1.Position:=TrackBar1.Position+1;
Memo1.Lines.Add('');
end;

procedure TForm7.Button1Click(Sender: TObject);
begin

Memo1.Lines[TrackBar1.Position]:='1';
TrackBar1.Position:=TrackBar1.Position+1;
Memo1.Lines.Add('');
end;

procedure TForm7.Button3Click(Sender: TObject);
begin

Memo1.Lines[TrackBar1.Position]:='2';
TrackBar1.Position:=TrackBar1.Position+1;    
Memo1.Lines.Add('');
end;

procedure TForm7.Button4Click(Sender: TObject);
begin
Memo1.Lines[TrackBar1.Position]:='3';
TrackBar1.Position:=TrackBar1.Position+1;  
Memo1.Lines.Add('');
end;

procedure TForm7.Button5Click(Sender: TObject);
begin
Memo1.Lines[TrackBar1.Position]:='4';
TrackBar1.Position:=TrackBar1.Position+1;  
Memo1.Lines.Add('');
end;

procedure TForm7.Button6Click(Sender: TObject);
begin
Memo1.Lines[TrackBar1.Position]:='5';
TrackBar1.Position:=TrackBar1.Position+1;  
Memo1.Lines.Add('');
end;

procedure TForm7.Button7Click(Sender: TObject);
begin
Memo1.Lines[TrackBar1.Position]:='6';
TrackBar1.Position:=TrackBar1.Position+1;   
Memo1.Lines.Add('');
end;

procedure TForm7.Button8Click(Sender: TObject);
begin
Memo1.Lines[TrackBar1.Position]:='7';
TrackBar1.Position:=TrackBar1.Position+1;   
Memo1.Lines.Add('');
end;

procedure TForm7.Button9Click(Sender: TObject);
begin
Memo1.Lines[TrackBar1.Position]:='8';
TrackBar1.Position:=TrackBar1.Position+1;   
Memo1.Lines.Add('');
end;

procedure TForm7.Button12Click(Sender: TObject);
var i:integer;
begin
for i:=0 to 99 do ib[trackBar1.Position,i] :=0;

ib[trackBar1.Position,0] :=trackBar1.Position;
ib[trackBar1.Position,1] :=i*32;
ib[trackBar1.Position,2] :=j*32;
ib[trackBar1.Position,3] :=32;
ib[trackBar1.Position,4] :=32;
ib[trackBar1.Position,5] :=0;
ib[trackBar1.Position,6] :=0;
ib[trackBar1.Position,7] :=0;
if radiobutton1.Checked=true then ib[trackBar1.Position,8]:=ord('a');
if radiobutton2.Checked=true then ib[trackBar1.Position,8]:=ord('b');
if radiobutton3.Checked=true then ib[trackBar1.Position,8]:=ord('c');
if combobox1.ItemIndex=0 then  ib[trackBar1.Position,9]:=ord('d');
if combobox1.ItemIndex=1 then  ib[trackBar1.Position,9]:=ord('e');
if combobox2.ItemIndex=1 then  ib[trackBar1.Position,10]:=ord('f');
if combobox2.ItemIndex=2 then  ib[trackBar1.Position,10]:=ord('g');
if combobox3.ItemIndex=1 then  ib[trackBar1.Position,11]:=ord('h');
if combobox4.ItemIndex=1 then  ib[trackBar1.Position,11]:=ord('i');
end;

procedure TForm7.TrackBar1Change(Sender: TObject);
begin
combobox2.ItemIndex:=0;
combobox3.ItemIndex:=0;
combobox4.ItemIndex:=0;
 if  ib[trackBar1.Position,8]=ord('a') then radiobutton1.Checked:=true;
if  ib[trackBar1.Position,8]=ord('b') then radiobutton2.Checked:=true;
if  ib[trackBar1.Position,8]=ord('c') then radiobutton3.Checked:=true;
if  ib[trackBar1.Position,9]=ord('d') then combobox1.ItemIndex:=0;
if  ib[trackBar1.Position,9]=ord('e') then combobox1.ItemIndex:=1;
if  ib[trackBar1.Position,10]=ord('f') then combobox2.ItemIndex:=1;
if  ib[trackBar1.Position,10]=ord('g') then combobox2.ItemIndex:=2;
if  ib[trackBar1.Position,11]=ord('h') then combobox3.ItemIndex:=1;
if  ib[trackBar1.Position,11]=ord('i') then combobox4.ItemIndex:=1; 
end;

end.
