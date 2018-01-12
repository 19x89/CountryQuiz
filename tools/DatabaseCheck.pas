program DatabaseCheck(input, output);
{read from the database and display it}

  type
  tDataInput = record
    country : string[35];
    city : string[35]
    end;
  
  var
  dataInput : tDataInput;
  f : file of tDataInput;
  
begin
  assign(f, 'Oceania countries ENG.txt'); {you could choose any other file}
  reset(f);
  
  while not eof(f) do
  begin
    read(f, dataInput);
    writeln(dataInput)
  end;
  readln;
  close(f)
end.