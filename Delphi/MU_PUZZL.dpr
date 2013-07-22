program MU_PUZZL;

uses
  Forms,
  MAIN in 'MAIN.PAS' {MuPuzzleFrm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMuPuzzleFrm, MuPuzzleFrm);
  Application.Run;
end.
