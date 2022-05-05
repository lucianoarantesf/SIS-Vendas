﻿unit uTeste;

interface
uses TestFramework, uSincronismo;

type
  TNotasTestes = class(TTestCase)
  private
    FSync: TSincronismo;
  protected
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestGravaCadPessoa;
  end;

implementation

{ TNotasTestes }

procedure TNotasTestes.SetUp;
begin
  inherited;

end;

procedure TNotasTestes.TearDown;
begin
  inherited;

end;

procedure TNotasTestes.TestGravaCadPessoa;
begin
 CheckTrue(FSync.GravaCadPessoa('teste','teste','teste','teste','teste'));
end;

end.
