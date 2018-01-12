program AddResult (input, output);

  var
  quizResult : string[50];
  i : integer;
  f : file of string[50];
  
begin
  assign(f, 'result.txt');
  rewrite(f);
  for i := 0 to 10 do
  begin
    write('For ', i, ' correct answers you will get the followong result: ');
    readln(quizResult);
    write(f, quizResult)
  end;
  close(f)
end.
  