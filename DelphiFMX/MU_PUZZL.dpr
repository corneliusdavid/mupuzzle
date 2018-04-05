program MU_PUZZL;

uses
  FMX.Forms,
  MAIN in 'MAIN.PAS' {MuPuzzleFrm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMuPuzzleFrm, MuPuzzleFrm);
  Application.Run;
end.
