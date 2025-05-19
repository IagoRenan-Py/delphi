program ProjetoClientes;

uses
  Vcl.Forms,
  uFrmPrincipal in 'Apresentacao\uFrmPrincipal.pas' {frmPrincipal},
  uFrmClientes in 'Apresentacao\uFrmClientes.pas' {frmClientes},
  uClientesController in 'Negocios\uClientesController.pas',
  uClientesDAO in 'DAO\uClientesDAO.pas',
  dtmDM in 'Dados\dtmDM.pas' {DataModule1: TDataModule},
  uUtils in 'Utils\uUtils.pas',
  uConstantes in 'Utils\uConstantes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmClientes, frmClientes);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
