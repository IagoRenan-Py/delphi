unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons,
  IconFontsImageCollection, Vcl.StdCtrls, System.ImageList, Vcl.ImgList,
  IconFontsImageListBase, IconFontsVirtualImageList, dxSkinsCore, dxSkinBasic,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkroom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinOffice2019Black, dxSkinOffice2019Colorful,
  dxSkinOffice2019DarkGray, dxSkinOffice2019White, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringtime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinTheBezier, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  Vcl.Menus, cxButtons;

type
  TfrmPrincipal = class(TForm)
    pnlBackground: TPanel;
    pnlMenu: TPanel;
    IconFontsVirtualImageList1: TIconFontsVirtualImageList;
    IconFontsImageCollection1: TIconFontsImageCollection;
    btnMenu: TcxButton;
    cxbtn2: TcxButton;
    cxbtn3: TcxButton;
    cxbtn4: TcxButton;
    pnlSeparado: TPanel;
    procedure btnMenuClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;
  vMenuExpandido : Boolean;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnMenuClick(Sender: TObject);
begin

  case vMenuExpandido of
    True:
    begin
      pnlMenu.Width := 48;
      btnMenu.OptionsImage.ImageIndex := 74;
    end;
    False:
    begin
      btnMenu.OptionsImage.ImageIndex := 75;
      pnlMenu.Width := 215;
    end;
  end;

  vMenuExpandido  := not vMenuExpandido;

end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  pnlMenu.Width:= 48;
end;

end.
