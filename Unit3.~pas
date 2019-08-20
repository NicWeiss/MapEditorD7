unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, XPMan;

type
  TForm3 = class(TForm)
    XPManifest1: TXPManifest;
    Label1: TLabel;
    Button1: TButton;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
begin
Form1.Enabled:=true;
Form3.Close;
end;

procedure TForm3.FormCreate(Sender: TObject);
var
x,y:real;
begin
Form1.Enabled:=false;
x:=(Screen.Width/2)-(Form3.Width/2);
y:=(Screen.Height/2)-(Form3.Height/2);
Form3.left:=trunc(x);
Form3.top:=trunc(y);
end;

end.
