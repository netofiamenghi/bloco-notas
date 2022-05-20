unit untPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Buttons, Vcl.ComCtrls;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Editar1: TMenuItem;
    Formatar1: TMenuItem;
    Abrir1: TMenuItem;
    Salvar1: TMenuItem;
    Sair1: TMenuItem;
    Copiar1: TMenuItem;
    Recortar1: TMenuItem;
    Fontes1: TMenuItem;
    Cores1: TMenuItem;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    FontDialog1: TFontDialog;
    ColorDialog1: TColorDialog;
    Colar1: TMenuItem;
    PrintDialog1: TPrintDialog;
    Imprimir1: TMenuItem;
    memo1: TRichEdit;
    Novo1: TMenuItem;
    QuebradeLinhaAutomtica1: TMenuItem;
    AlinharDireita1: TMenuItem;
    AlinharEsquerda1: TMenuItem;
    Centralizar1: TMenuItem;
    procedure Abrir1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure Salvar1Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure Recortar1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure Copiar1Click(Sender: TObject);
    procedure Colar1Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Imprimir1Click(Sender: TObject);
    procedure Novo1Click(Sender: TObject);
    procedure Fontes1Click(Sender: TObject);
    procedure Cores1Click(Sender: TObject);
    procedure QuebradeLinhaAutomtica1Click(Sender: TObject);
    procedure Centralizar1Click(Sender: TObject);
    procedure AlinharEsquerda1Click(Sender: TObject);
    procedure AlinharDireita1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Abrir1Click(Sender: TObject);
begin
if opendialog1.Execute then
  memo1.Lines.LoadFromFile(opendialog1.FileName);
memo1.SetFocus;
end;

procedure TForm1.AlinharDireita1Click(Sender: TObject);
begin
  memo1.Paragraph.Alignment := taRightJustify;
end;

procedure TForm1.AlinharEsquerda1Click(Sender: TObject);
begin
  memo1.Paragraph.Alignment := taLeftJustify;
end;

procedure TForm1.Centralizar1Click(Sender: TObject);
begin
  memo1.Paragraph.Alignment := taCenter;
end;

procedure TForm1.Colar1Click(Sender: TObject);
begin
  Memo1.PasteFromClipboard;
end;

procedure TForm1.Copiar1Click(Sender: TObject);
begin
  Memo1.CopyToClipboard;
end;

procedure TForm1.Cores1Click(Sender: TObject);
begin
  if(ColorDialog1.Execute())then
    memo1.Color := ColorDialog1.Color;
end;

procedure TForm1.Fontes1Click(Sender: TObject);
begin
  if(FontDialog1.Execute())then
    memo1.Font := FontDialog1.Font;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if memo1.GetTextLen > 0 then
  begin
  if MessageDlg('Deseja salvar o arquivo',mtinformation,[mbyes,mbno],0) = mryes then
    SpeedButton6.Click;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  if(QuebradeLinhaAutomtica1.Checked)then
    memo1.ScrollBars := ssVertical
  else
    memo1.ScrollBars := ssBoth;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  if memo1.GetTextLen > 0 then
  begin
  if MessageDlg('Deseja salvar o arquivo',mtinformation,[mbyes,mbno],0) = mryes then
    SpeedButton6.Click;
  end;
end;

procedure TForm1.Imprimir1Click(Sender: TObject);
begin
  if(PrintDialog1.Execute())then
    memo1.Print(text);
end;

procedure TForm1.Novo1Click(Sender: TObject);
begin
  memo1.Lines.Clear;
end;

procedure TForm1.QuebradeLinhaAutomtica1Click(Sender: TObject);
begin
  if(QuebradeLinhaAutomtica1.Checked)then
    memo1.ScrollBars := ssVertical
  else
    memo1.ScrollBars := ssBoth;
end;

procedure TForm1.Recortar1Click(Sender: TObject);
begin
  Memo1.CutToClipboard;
end;

procedure TForm1.Sair1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm1.Salvar1Click(Sender: TObject);
begin
if savedialog1.Execute then
  memo1.Lines.SaveToFile(savedialog1.FileName);
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  Memo1.CutToClipboard;
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
  if memo1.GetTextLen > 0 then
  begin
  if MessageDlg('Deseja salvar o arquivo',mtConfirmation,[mbyes,mbno],0) = mryes then
    SpeedButton6.Click;
  end;
  Memo1.Lines.Clear;
end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
begin
if opendialog1.Execute then
  memo1.Lines.LoadFromFile(opendialog1.FileName);
memo1.SetFocus;
end;

procedure TForm1.SpeedButton4Click(Sender: TObject);
begin
  Memo1.CopyToClipboard;
end;

procedure TForm1.SpeedButton5Click(Sender: TObject);
begin
  Memo1.PasteFromClipboard;
end;

procedure TForm1.SpeedButton6Click(Sender: TObject);
begin
if savedialog1.Execute then
  memo1.Lines.SaveToFile(savedialog1.FileName);
end;

end.
