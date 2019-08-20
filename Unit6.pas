unit Unit6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm6 = class(TForm)
    Image1: TImage;
    GroupBox1: TGroupBox;
    ColorBox1: TColorBox;
    GroupBox2: TGroupBox;
    Button2: TButton;
    Button3: TButton;
    Timer1: TTimer;
    SaveDialog1: TSaveDialog;
    procedure Button2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

{$R *.dfm}
uses Unit1 , Unit5;



procedure TForm6.Button2Click(Sender: TObject);
begin
Form5.Show;
end;

procedure TForm6.Timer1Timer(Sender: TObject);
var
i,j,z:integer;
begin
Image1.Canvas.Brush.Color:=ColorBox1.Selected;
Image1.Canvas.FillRect(Image1.ClientRect);
z:=0;
for i:=0 to 11 do
for j:=0 to 11 do
begin
Form1.ImageList1.Draw(Form6.Image1.Canvas,j*32,i*32,z,true);
z:=z+1;
end;
end;

procedure TForm6.FormCreate(Sender: TObject);
begin
Image1.Canvas.Create;
end;

procedure TForm6.Button3Click(Sender: TObject);
var
s:string;
begin
SaveDialog1.Execute;
s:=SaveDialog1.FileName;
Image1.Picture.SaveToFile(s);
end;

end.
