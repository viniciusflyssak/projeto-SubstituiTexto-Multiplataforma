unit uFrmPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Memo.Types, FMX.Edit, FMX.ScrollBox, FMX.Memo,
  FMX.Objects, FMX.Advertising;

type
  TFrmPrincipal = class(TForm)
    pnlFundo: TPanel;
    btnFechar: TSpeedButton;
    btnSubstituir: TSpeedButton;
    pnlBotoes: TPanel;
    pnlMemo: TPanel;
    mmoTexto: TMemo;
    lblTextoResultante: TLabel;
    PnlTextos: TPanel;
    lblTextoAntigo: TLabel;
    lblTextoSubstituto: TLabel;
    lblTextoSubstituido: TLabel;
    linDiv: TLine;
    linDiv2: TLine;
    linDiv3: TLine;
    linDiv5: TLine;
    lblObs: TLabel;
    mmoTextoAntigo: TMemo;
    mmoTextoSubstituto: TMemo;
    mmoTextoSubstituir: TMemo;
    linDiv6: TLine;
    badAnuncio: TBannerAd;
    procedure btnFecharClick(Sender: TObject);
    procedure btnSubstituirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
  public
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.fmx}

procedure TFrmPrincipal.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmPrincipal.btnSubstituirClick(Sender: TObject);
  function Substituir(Str, Velho, Novo: String): String;
  var
    i : integer;
    contador : integer;
  begin
    Result := '';
    contador := 1;
    for i := 1 to Length(Velho) do
    begin
      if Copy(Velho, contador, Length(Str)) = Str then
      begin
        Result := Result + Novo;
        contador := contador + Length(Str);
      end
      else
      begin
        Result := Result + Copy(Velho, contador, 1);
        contador := contador + 1;
      end;
    end;
  end;
begin
  mmoTexto.Text := '';
  mmoTexto.Text := Substituir(mmoTextoSubstituir.Text, mmoTextoAntigo.text, mmoTextoSubstituto.Text);

end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  badAnuncio.TestMode := false;
  badAnuncio.AdUnitID := 'ca-app-pub-1350446976118437/8986692635';
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
  badAnuncio.LoadAd;
end;

end.
