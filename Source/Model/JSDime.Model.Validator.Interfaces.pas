unit JSDime.Model.Validator.Interfaces;

interface

uses
  JSDime.Model.Classes,
  JSDime.Service.Interfaces;

type
  IJSDimeModelValidator = interface
    ['{98D6C225-9017-4FB0-95D0-1FE7284A7314}']

    procedure Validate(AValue: TJSDimeModelRegistro; ALinha: Integer);
  end;

function DimeModelValidator(Config: IJSDimeConfig<IJSDimeService>): IJSDimeModelValidator;

implementation

uses
  JSDime.Model.Validator.Base;

function DimeModelValidator(Config: IJSDimeConfig<IJSDimeService>): IJSDimeModelValidator;
begin
  Result := TJSDimeModelValidator.New(Config);
end;

end.
