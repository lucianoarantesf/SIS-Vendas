unit uFormat;

interface

uses
   winapi.windows, System.SysUtils, System.MaskUtils;

Function formacpf(numtexto:String):String;
Function formacnpj(numtexto:String):String;
Function formatelefone(numtexto:String):String;
Function formatcep(numtexto:String):String;
Function formacelular(numtexto:String):String;
implementation

//Formata número CPF
Function formacpf(numtexto:String):String;
begin
    Delete(numtexto,ansipos('.',numtexto),1);  //Remove ponto .
    Delete(numtexto,ansipos('.',numtexto),1);
    Delete(numtexto,ansipos('-',numtexto),1); //Remove traço -
    Delete(numtexto,ansipos('/',numtexto),1); //Remove barra /
    Result:=FormatmaskText('000\.000\.000\-00;0;',numtexto); // Formata os numero

end;
//Formata número CNPJ
Function formacnpj(numtexto:String):String;
begin
    Delete(numtexto,ansipos('.',numtexto),1);  //Remove ponto .
    Delete(numtexto,ansipos('.',numtexto),1);
    Delete(numtexto,ansipos('-',numtexto),1); //Remove traço -
    Delete(numtexto,ansipos('/',numtexto),1); //Remove barra /
    Result:=FormatmaskText('00\.000\.000\/0000\-00;0;',numtexto);

end;
//Formata número telefone fixo
Function formatelefone(numtexto:String):String;
begin
    Delete(numtexto,ansipos('-',numtexto),1);  //Remove traço -
    Delete(numtexto,ansipos('-',numtexto),1);
    Delete(numtexto,ansipos('(',numtexto),1); //Remove parenteses  (
    Delete(numtexto,ansipos(')',numtexto),1); //Remove parenteses  )
    Result:=FormatmaskText('\(00\)0000\-0000;0;',numtexto); // Formata os numero
end;
// Formata CEP
Function formatcep(numtexto:String):String;
begin
    Delete(numtexto,ansipos('-',numtexto),1);  //Remove traço -
    Delete(numtexto,ansipos('-',numtexto),1);
    Delete(numtexto,ansipos('(',numtexto),1); //Remove parenteses  (
    Delete(numtexto,ansipos(')',numtexto),1); //Remove parenteses  )
    Result:=FormatmaskText('00000\-000;0;',numtexto); // Formata os numero
end;
//Formata número celular
Function formacelular(numtexto:String):String;
begin
    Delete(numtexto,ansipos('-',numtexto),1);  //Remove traço -
    Delete(numtexto,ansipos('-',numtexto),1);
    Delete(numtexto,ansipos('(',numtexto),1); //Remove parenteses  (
    Delete(numtexto,ansipos(')',numtexto),1); //Remove parenteses  )
    Result:=FormatmaskText('\(00\)00000\-0000;0;',numtexto); // Formata os numero
end;
end.
