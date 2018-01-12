program ResultDBCheck (input, output);

  var
  quizResult : string[50];
  f : file of string[50];
  
begin
  assign(f, 'result.txt');
  reset(f);
  
  while not eof(f) do
  begin
    read(f, quizResult);
    writeln(quizResult)
  end;
  readln;
  close(f)
end.