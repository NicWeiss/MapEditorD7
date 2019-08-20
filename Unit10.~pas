unit Unit10;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, XPMan, ComCtrls, ExtCtrls;

type
  TForm10 = class(TForm)
    Button1: TButton;
    OpenDialog1: TOpenDialog;
    ProgressBar1: TProgressBar;
    XPManifest1: TXPManifest;
    Button2: TButton;
    Button3: TButton;
    SaveDialog1: TSaveDialog;
    Label1: TLabel;
    ListBox1: TListBox;
    Edit1: TEdit;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Timer1: TTimer;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form10: TForm10;
  len,i:integer;
  pict:array[0..100000] of byte;

implementation

{$R *.dfm}

procedure TForm10.Button1Click(Sender: TObject);
var
  F_in, F_out: File;
  Buf: Byte;
begin
opendialog1.Execute;
  AssignFile(F_in, opendialog1.FileName);
  try
    Reset(F_in, SizeOf(Buf));
    i:=0;
Len := FileSize(f_in);
 progressbar1.Max:=len;
    while i<len do
      begin
      progressbar1.Position:=i;
        BlockRead(f_in, buf,SizeOf(Buf));
         pict[i]:=buf;
      i:=i+1;
      end;
  finally
    CloseFile(F_in);
  end;
end;

procedure TForm10.Button2Click(Sender: TObject);
begin
progressbar1.Position:=i;
listbox1.Items.Clear;
  for i:=0 to len do
  begin
  progressbar1.Position:=i;
  //memo1.Lines.Add(inttostr(pict[i]));
  if checkbox2.Checked=true then listbox1.Items.Add(char(pict[i]))
  else listbox1.Items.Add(inttostr(pict[i]));
  end;
end;

procedure TForm10.Button3Click(Sender: TObject);
var
  F_in, F_out: File;
  Buf: Byte;
begin
savedialog1.Execute;
  AssignFile(F_out, savedialog1.FileName);
  try
    Rewrite(F_out, SizeOf(Buf));
    i:=0;
//showmessage(inttostr(len));
 progressbar1.Max:=listbox1.Items.Count;
    while i<listbox1.Items.Count do
      begin
      //form10.Caption:=inttostr(i)+' of '+inttostr(len);
      progressbar1.Position:=i;
         buf:=strtoint(listbox1.Items.Strings[i]);
        //BlockRead(f_in, buf,SizeOf(Buf));
    //buf := Ord(Chr(255-buf));
       BlockWrite(F_out, Buf, SizeOf(Buf));
       //memo1.Lines.Add(inttostr(buf));
      i:=i+1;
      end;
  finally
    CloseFile(F_out);
   // CloseFile(F_out);
  end;

end;



procedure TForm10.ListBox1Click(Sender: TObject);
var
txt:string;
b:byte;
begin
b:= strtoint(listbox1.Items.Strings[ListBox1.ItemIndex]);
txt:=char(b);
label1.Caption:=txt;   
if checkbox1.Checked=true then edit1.Text:= txt else edit1.Text:= listbox1.Items.Strings[ListBox1.ItemIndex];

b:= strtoint(listbox1.Items.Strings[ListBox1.ItemIndex+1]);
txt:=char(b);
label1.Caption:=label1.Caption+txt;
b:= strtoint(listbox1.Items.Strings[ListBox1.ItemIndex+2]);
txt:=char(b);
label1.Caption:=label1.Caption+txt;
b:= strtoint(listbox1.Items.Strings[ListBox1.ItemIndex+3]);
txt:=char(b);
label1.Caption:=label1.Caption+txt;
end;

procedure TForm10.Button4Click(Sender: TObject);
begin
 listbox1.Items.Strings[ListBox1.ItemIndex]:=edit1.Text;
end;

procedure TForm10.Button5Click(Sender: TObject);
begin
  listbox1.Items.Add(edit1.Text);
end;

procedure TForm10.Button6Click(Sender: TObject);
begin
 listbox1.Items.Add(inttostr(ord(edit1.Text[1])));
end;

procedure TForm10.Timer1Timer(Sender: TObject);
begin
if checkbox1.Checked=true then
begin
button6.Enabled:=true;
button7.Enabled:=true;
button4.Enabled:=false;
button5.Enabled:=false;
end
else
begin
button6.Enabled:=false;
button7.Enabled:=false; 
button4.Enabled:=true;
button5.Enabled:=true;
end

end;

procedure TForm10.Button7Click(Sender: TObject);
begin
listbox1.Items.Strings[ListBox1.ItemIndex]:=inttostr(ord(edit1.Text[1]));
end;

end.
