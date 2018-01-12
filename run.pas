program StartGame (input, output);
{Small quiz where you should write capitals of some countries}

{Author: Vladislavs Mova;
 Version: 1.4.0}  
  
  
  var
  lang : integer;
  
  
  {Choose a language}
  function Language(var ioLang : integer) : integer;
  
    var
    langChoise,
    newLangChoise : integer;
    
  begin
    langChoise := ioLang;
    if (langChoise < 1) or (langChoise > 2) then
    begin
      writeln('Error! Choose a language:');
      writeln('Ошибка! Выберите язык:');
      writeln;
      writeln('"1 + Enter" to choose English language');
      writeln('"2 + Enter" для выбора Русского языка');
      readln(newLangChoise);
      langChoise := Language(newLangChoise);
      Language := langChoise
    end
    else
      Language := langChoise
  end;
  
  
begin
  writeln('Choose a language:');
  writeln('Выберите язык:');
  writeln;
  writeln('"1 + Enter" to choose English language');
  writeln('"2 + Enter" для выбора Русского языка');
  readln(lang);
  
  lang := Language(lang);
  
  {go to the folder with chosen language}
  case lang of
    1 : ChDir('eng');
    2 : ChDir('rus')
  end;
  
  {start a game}
  exec('CountryQuiz.exe', '')
end.