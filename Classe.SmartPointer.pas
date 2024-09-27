unit Classe.SmartPointer;

interface

{$M+}

uses
  System.SysUtils, System.Generics.Collections;

type
  ISmartPointer<T> = reference to function: T;

  TSmartPointer<T: class, constructor> = class(TInterfacedObject, ISmartPointer<T>)
  strict private
  var
    FValue: T;
  private
    procedure ValueCreate;
    procedure DoNothing;
  public
    constructor Create; overload;
    constructor Create(AValue: T); overload;
    destructor Destroy; override;
    function Invoke: T;
  published
  	property Value: T read FValue write FValue;
  end;

implementation

{ TSmartPointer<T> }

constructor TSmartPointer<T>.Create;
begin
	inherited;
  FValue := T.Create;
end;

constructor TSmartPointer<T>.Create(AValue: T);
var
  lValueCreate: TDictionary<Pointer, TProc>;
  lValueProc: TProc;
begin
	inherited Create;
  FValue := AValue;
  lValueCreate := TDictionary<Pointer, TProc>.Create;
  try
    lValueCreate.Add(Pointer(NativeInt(FValue)), DoNothing);
    lValueCreate.AddOrSetValue(nil, ValueCreate);
    lValueCreate.TryGetValue(Pointer(NativeInt(FValue)), lValueProc);
    lValueProc;
  finally
    lValueCreate.Free;
  end;
end;

destructor TSmartPointer<T>.Destroy;
begin
	FValue.Free;
  inherited;
end;

procedure TSmartPointer<T>.DoNothing;
begin

end;

function TSmartPointer<T>.Invoke: T;
begin
	Result := FValue;
end;

procedure TSmartPointer<T>.ValueCreate;
begin
  FValue := T.Create;
end;

end.
