unit uFRM_Principal;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.WinXPanels,
  Vcl.WinXCtrls,
  Vcl.OleCtrls,
  SHDocVw,
  Soap.InvokeRegistry,
  System.Net.URLClient,
  Soap.Rio,
  Soap.SOAPHTTPClient,
  Vcl.WinXCalendars,
  Vcl.ComCtrls,
  Vcl.Menus,
  Vcl.ToolWin,
  Vcl.StdCtrls,
  System.Win.TaskbarCore,
  Vcl.Taskbar,

  UChamadasInterfaces,
  Vcl.Buttons,
  Vcl.Imaging.Jpeg,
  System.ImageList,
  Vcl.ImgList,
  Vcl.CategoryButtons,
  Vcl.Imaging.Pngimage;

type
  TFRM_Principal = class( TForm )
    MainMenu1: TMainMenu;
    Consultas1: TMenuItem;
    Paises1: TMenuItem;
    Estados1: TMenuItem;
    Cidades1: TMenuItem;
    SplitView1: TSplitView;
    ImageList1: TImageList;
    N1: TMenuItem;
    Grupos1: TMenuItem;
    SubGrupos1: TMenuItem;
    PnlTop: TPanel;
    Image1: TImage;
    PnlMenu: TPanel;
    BtnMenu: TSpeedButton;
    CategoryButtons1: TCategoryButtons;
    CategoryButtons2: TCategoryButtons;
    N2: TMenuItem;
    Departamentos1: TMenuItem;
    procedure FormCreate( Sender: TObject );
    procedure FormDestroy( Sender: TObject );
    procedure BtnFecharClick( Sender: TObject );

    procedure Paises1Click( Sender: TObject );
    procedure Estados1Click( Sender: TObject );
    procedure Cidades1Click( Sender: TObject );
    procedure Grupos1Click( Sender: TObject );
    procedure SubGrupos1Click( Sender: TObject );
    procedure BtnMenuClick( Sender: TObject );
    procedure SplitView1Opened( Sender: TObject );
    procedure SplitView1Closed( Sender: TObject );
    procedure CategoryButtons2Categories0Items0Click( Sender: TObject );
    procedure Departamentos1Click( Sender: TObject );

  private
    { Private declarations }
    ChamadaInter: TchamadasInterfaces;
  public
    { Public declarations }
  end;

var
  FRM_Principal: TFRM_Principal;

implementation

{$R *.dfm}


procedure TFRM_Principal.BtnFecharClick( Sender: TObject );
begin
  Close;
end;

procedure TFRM_Principal.BtnMenuClick( Sender: TObject );
begin
  SplitView1.Opened := not SplitView1.Opened;
end;

procedure TFRM_Principal.CategoryButtons2Categories0Items0Click(
            Sender: TObject );
begin
  Self.Close;
end;

procedure TFRM_Principal.Cidades1Click( Sender: TObject );
begin
  ChamadaInter.ChamadaConsultaCidades;
end;

procedure TFRM_Principal.Departamentos1Click( Sender: TObject );
begin
  ChamadaInter.ChamadaConsultaDepartamentos;
end;

procedure TFRM_Principal.Estados1Click( Sender: TObject );
begin
  ChamadaInter.ChamadaConsultaEstados;
end;

procedure TFRM_Principal.FormCreate( Sender: TObject );
begin
  ChamadaInter := TchamadasInterfaces.Create( Self );
end;

procedure TFRM_Principal.FormDestroy( Sender: TObject );
begin
  ChamadaInter.Free;
end;

procedure TFRM_Principal.Grupos1Click( Sender: TObject );
begin
  ChamadaInter.ChamadaConsultaGrupos;
end;

procedure TFRM_Principal.Paises1Click( Sender: TObject );
begin
  ChamadaInter.ChamadaConsultaPaises;
end;

procedure TFRM_Principal.SplitView1Closed( Sender: TObject );
begin
  CategoryButtons1.ShowHint := not SplitView1.Opened;
end;

procedure TFRM_Principal.SplitView1Opened( Sender: TObject );
begin
  CategoryButtons1.ShowHint := not SplitView1.Opened;
end;

procedure TFRM_Principal.SubGrupos1Click( Sender: TObject );
begin
  ChamadaInter.ChamadaConsultaSubGrupos;
end;

end.
