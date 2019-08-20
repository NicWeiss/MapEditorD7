unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm4 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    procedure wrt;     
    procedure opn;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;
  pez:boolean;
f:text;
i,z:integer;
dd,s:string;

implementation

uses unit1;

{$R *.dfm}


procedure TForm4.opn;
 begin
Memo1.Clear;
i:=0;
if fpt<>'' then begin
Memo1.Lines.LoadFromFile('/'+fpt+s+'.txt');
 //s:='';
end;
end;

procedure TForm4.wrt;
begin

if fpt<>'' then begin

  Memo1.Lines.SaveToFile(fpt+s+'.txt');
 end;
 if fpt='' then Form1.N2Click(form4);
 end;


procedure TForm4.Button1Click(Sender: TObject);
begin
  wrt;
Memo1.Clear;
  Close;
end;

procedure TForm4.Button2Click(Sender: TObject);
begin
Close;
end;

end.
