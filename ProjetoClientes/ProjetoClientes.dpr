program ProjetoClientes;

uses
  Vcl.Forms,
  uFrmPrincipal in 'Apresentacao\uFrmPrincipal.pas' {frmPrincipal},
  uFrmClientes in 'Apresentacao\uFrmClientes.pas' {frmClientes};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmClientes, frmClientes);
  Application.Run;
end.
