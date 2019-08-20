unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Mask;

type
  TForm5 = class(TForm)
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    GroupBox2: TGroupBox;
    Edit1: TEdit;
    UpDown1: TUpDown;
    GroupBox3: TGroupBox;
    ListBox1: TListBox;
    Button1: TButton;
    Image1: TImage;
    Edit2: TEdit;
    CheckBox4: TCheckBox;
    Memo1: TMemo;
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;
exe2,exe,te:string;
i,ind:integer;

implementation

{$R *.dfm}

uses unit1,unit2;

procedure TForm5.UpDown1Click(Sender: TObject; Button: TUDBtnType);
begin
Form1.Timer1.Interval:=strtoint(Edit1.text);
end;

procedure TForm5.FormCreate(Sender: TObject);     
begin
if FileExists('c:\editFolder.ini') then
 Memo1.Lines.LoadFromFile('c:\editFolder.ini')
else
begin
exe:=Application.ExeName;
repeat
if exe[Length(exe)]<>'\' then exe2:=Copy(exe,0,Length(exe)-1);
exe:=exe2;
until exe[Length(exe)]='\' ;
Memo1.Clear;
Memo1.Lines.Add(exe);
Memo1.Lines.SaveToFile('c:\editFolder.ini');
end;   

if ListBox1.ItemIndex<0 then try ListBox1.Items.LoadFromFile(Memo1.Lines[0]+'Zones\Images.pth'); except  DeleteFile('c:\editFolder.ini'); end;
if ListBox1.ItemIndex<0 then ListBox1.ItemIndex:=0;
ListBox1.ItemIndex:=cd;
ind:=ListBox1.ItemIndex;
te:=ListBox1.Items.Strings[ind];
for i:=0 to 133 do begin
   Image1.Picture.LoadFromFile(Memo1.Lines[0]+'Zones'+ListBox1.Items.Strings[ind]+'text ('+inttostr(i)+').bmp');
  Form1.ImageList1.AddMasked(Image1.Picture.Bitmap,$ffffff);
  end;
  Button1Click(Sender);
end;

procedure TForm5.Button1Click(Sender: TObject);
begin

//FormCreate(sender);

ind:=ListBox1.ItemIndex;
te:=ListBox1.Items.Strings[ind];
for i:=0 to 133 do begin
   Image1.Picture.LoadFromFile(Memo1.Lines[0]+'Zones'+ListBox1.Items.Strings[ind]+'text ('+inttostr(i)+').bmp');
  Form1.ImageList1.AddMasked(Image1.Picture.Bitmap,$ffffff);
  end;

Form1.ImageList1.Clear;
for i:=0 to 133 do begin
   Image1.Picture.LoadFromFile(Memo1.Lines[0]+'Zones'+te+'text ('+inttostr(i)+').bmp');
  Form1.ImageList1.AddMasked(Image1.Picture.Bitmap,$ffffff);
  end;
  //++++++++++++++++++++
  Form2.Image1.Canvas.Brush.Color:=$ffffff;
  Form2.Image1.Canvas.FillRect(Form2.Image1.ClientRect);
  Form1.ImageList1.Draw(Form2.Image1.Canvas,0,0,0,true);
  //---------------------
  Form2.Image2.Canvas.Brush.Color:=$ffffff;
  Form2.Image2.Canvas.FillRect(Form2.Image2.ClientRect);
  Form1.ImageList1.Draw(Form2.Image2.Canvas,0,0,1,true);
  //------------------------
  Form2.Image3.Canvas.Brush.Color:=$ffffff;
  Form2.Image3.Canvas.FillRect(Form2.Image3.ClientRect);
  Form1.ImageList1.Draw(Form2.Image3.Canvas,0,0,2,true);
  //----------------------
  Form2.Image4.Canvas.Brush.Color:=$ffffff;
  Form2.Image4.Canvas.FillRect(Form2.Image4.ClientRect);
  Form1.ImageList1.Draw(Form2.Image4.Canvas,0,0,3,true);
  //------------------------   
  Form2.Image5.Canvas.Brush.Color:=$ffffff;
  Form2.Image5.Canvas.FillRect(Form2.Image5.ClientRect);
  Form1.ImageList1.Draw(Form2.Image5.Canvas,0,0,4,true);
  //-------------------------    
  Form2.Image6.Canvas.Brush.Color:=$ffffff;
  Form2.Image6.Canvas.FillRect(Form2.Image6.ClientRect);
  Form1.ImageList1.Draw(Form2.Image6.Canvas,0,0,5,true);
  //--------------------          
  Form2.Image7.Canvas.Brush.Color:=$ffffff;
  Form2.Image7.Canvas.FillRect(Form2.Image7.ClientRect);
  Form1.ImageList1.Draw(Form2.Image7.Canvas,0,0,6,true);
  //----------------------------   
  Form2.Image8.Canvas.Brush.Color:=$ffffff;
  Form2.Image8.Canvas.FillRect(Form2.Image8.ClientRect);
  Form1.ImageList1.Draw(Form2.Image8.Canvas,0,0,7,true);
  ///////////////////////////////            
  Form2.Image9.Canvas.Brush.Color:=$ffffff;
  Form2.Image9.Canvas.FillRect(Form2.Image9.ClientRect);
  Form1.ImageList1.Draw(Form2.Image9.Canvas,0,0,8,true);
  //--------------------------------     
  Form2.Image10.Canvas.Brush.Color:=$ffffff;
  Form2.Image10.Canvas.FillRect(Form2.Image10.ClientRect);
  Form1.ImageList1.Draw(Form2.Image10.Canvas,0,0,9,true);
  //----------------------------------  
  Form2.Image11.Canvas.Brush.Color:=$ffffff;
  Form2.Image11.Canvas.FillRect(Form2.Image11.ClientRect);
  Form1.ImageList1.Draw(Form2.Image11.Canvas,0,0,10,true);
  //-----------------------------------  
  Form2.Image12.Canvas.Brush.Color:=$ffffff;
  Form2.Image12.Canvas.FillRect(Form2.Image12.ClientRect);
  Form1.ImageList1.Draw(Form2.Image12.Canvas,0,0,11,true);
  //---------------------    
  Form2.Image13.Canvas.Brush.Color:=$ffffff;
  Form2.Image13.Canvas.FillRect(Form2.Image13.ClientRect);
  Form1.ImageList1.Draw(Form2.Image13.Canvas,0,0,12,true);
  //----------------------------------------------------
  Form2.Image40.Canvas.Brush.Color:=$ffffff;
  Form2.Image40.Canvas.FillRect(Form2.Image40.ClientRect);
  Form1.ImageList1.Draw(Form2.Image40.Canvas,0,0,126,true);
  //-------------------------     
  Form2.Image41.Canvas.Brush.Color:=$ffffff;
  Form2.Image41.Canvas.FillRect(Form2.Image41.ClientRect);
  Form1.ImageList1.Draw(Form2.Image41.Canvas,0,0,127,true);
  //-------------------------            
  Form2.Image42.Canvas.Brush.Color:=$ffffff;
  Form2.Image42.Canvas.FillRect(Form2.Image42.ClientRect);
  Form1.ImageList1.Draw(Form2.Image42.Canvas,0,0,128,true);
  //---------------------------    
  Form2.Image43.Canvas.Brush.Color:=$ffffff;
  Form2.Image43.Canvas.FillRect(Form2.Image43.ClientRect);
  Form1.ImageList1.Draw(Form2.Image43.Canvas,0,0,129,true);
  //-------------------------   
  Form2.Image44.Canvas.Brush.Color:=$ffffff;
  Form2.Image44.Canvas.FillRect(Form2.Image44.ClientRect);
  Form1.ImageList1.Draw(Form2.Image44.Canvas,0,0,130,true);
  //--------------------------        
  Form2.Image35.Canvas.Brush.Color:=$ffffff;
  Form2.Image35.Canvas.FillRect(Form2.Image35.ClientRect);
  Form1.ImageList1.Draw(Form2.Image35.Canvas,0,0,119,true);
  //------------------------    
  Form2.Image22.Canvas.Brush.Color:=$ffffff;
  Form2.Image22.Canvas.FillRect(Form2.Image22.ClientRect);
  Form1.ImageList1.Draw(Form2.Image22.Canvas,0,0,84,true);
  //--------------------------  
  Form2.Image24.Canvas.Brush.Color:=$ffffff;
  Form2.Image24.Canvas.FillRect(Form2.Image24.ClientRect);
  Form1.ImageList1.Draw(Form2.Image24.Canvas,0,0,85,true);
  //-----------------------
  Form2.Image25.Canvas.Brush.Color:=$ffffff;
  Form2.Image25.Canvas.FillRect(Form2.Image25.ClientRect);
  Form1.ImageList1.Draw(Form2.Image25.Canvas,0,0,86,true);
  //-------------------------
  Form2.Image17.Canvas.Brush.Color:=$ffffff;
  Form2.Image17.Canvas.FillRect(Form2.Image17.ClientRect);
  Form1.ImageList1.Draw(Form2.Image17.Canvas,0,0,25,true);
  //-------------------------
  Form2.Image16.Canvas.Brush.Color:=$ffffff;
  Form2.Image16.Canvas.FillRect(Form2.Image16.ClientRect);
  Form1.ImageList1.Draw(Form2.Image16.Canvas,0,0,114,true);
  //-------------------------    
  Form2.Image53.Canvas.Brush.Color:=$ffffff;
  Form2.Image53.Canvas.FillRect(Form2.Image53.ClientRect);
  Form1.ImageList1.Draw(Form2.Image53.Canvas,0,0,71,true);
  //-------------------------
  Form2.Image55.Canvas.Brush.Color:=$ffffff;
  Form2.Image55.Canvas.FillRect(Form2.Image55.ClientRect);
  Form1.ImageList1.Draw(Form2.Image55.Canvas,0,0,69,true);
  //-------------------------
  Form2.Image56.Canvas.Brush.Color:=$ffffff;
  Form2.Image56.Canvas.FillRect(Form2.Image56.ClientRect);
  Form1.ImageList1.Draw(Form2.Image56.Canvas,0,0,70,true);
  //-------------------------     
  Form2.Image57.Canvas.Brush.Color:=$ffffff;
  Form2.Image57.Canvas.FillRect(Form2.Image57.ClientRect);
  Form1.ImageList1.Draw(Form2.Image57.Canvas,0,0,65,true);
  //-------------------------
  Form2.Image58.Canvas.Brush.Color:=$ffffff;
  Form2.Image58.Canvas.FillRect(Form2.Image58.ClientRect);
  Form1.ImageList1.Draw(Form2.Image58.Canvas,0,0,66,true);
  //-------------------------
  Form2.Image59.Canvas.Brush.Color:=$ffffff;
  Form2.Image59.Canvas.FillRect(Form2.Image59.ClientRect);
  Form1.ImageList1.Draw(Form2.Image59.Canvas,0,0,68,true);
  //-------------------------
  Form2.Image60.Canvas.Brush.Color:=$ffffff;
  Form2.Image60.Canvas.FillRect(Form2.Image60.ClientRect);
  Form1.ImageList1.Draw(Form2.Image60.Canvas,0,0,67,true);
  //-------------------------

end;

procedure TForm5.ListBox1Click(Sender: TObject);
begin
ind:=ListBox1.ItemIndex;
Edit2.Text:=ListBox1.Items.Strings[ind];
te:=ListBox1.Items.Strings[ind];
end;

end.
