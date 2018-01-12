program CountryQuiz (input, output);
{Small quiz where you should write capitals of some countries}

{Author: Vladislavs Mova;
 Version: 1.4.0}

  const
  ROUND = 9; {Number of rounds of the game = 10}
  NAMES_EURO = 45; {46 countries and cities in Europe}
  NAMES_ASIA = 45; {46 countries and cities in Asia}
  NAMES_AFRICA = 55; {56 countries and cities in Africa}
  NAMES_AMERICA = 53; {54 countries and cities in Americas}
  NAMES_OCEANIA = 22; {23 countries and cities in Oceania}
  NAMES_WORLD = 224; {225 countries and cities all over the world}
    
    
    
  type
  tQuestionNum = array [0..ROUND] of integer;
  tCity = array [0..224] of string;
  tCountry = array [0..224] of string;
  tResult = array [0..10] of string;
  tDataInput = record
    country : string[35];
    city : string[35]
    end;
  tAnswer = array [0..ROUND] of string;
    
    
  var
  i,
  a,
  score,
  choose,
  names,
  resultIndex : integer;
  dataInput : tDataInput;
  f : file of tDataInput;
  fResult : file of string[37];
  fromResultFile : string[37];
               
  
  answer : tAnswer;
  myResult : tResult;
  questionNum : tQuestionNum;
  city : tCity;
  country : tCountry;
  
  
  {Choose a continent}
  function Continent(var ioChoose : integer) : integer;
  
    var
    continentalChoise,
    newChoose : integer;
  
  begin
    continentalChoise := ioChoose;
    if (continentalChoise < 1) or (continentalChoise > 6) then
    begin
      writeln('Ошибка! Введите требуемое число:');
      writeln('Для выбора Европы - "1", для выбора Азии - "2", для выбора Африки - "3", для выбора Америки (Северной и Южной) - "4", для выбора Океании - "5", для выбора всего мира - "6"');
      readln(newChoose);
      continentalChoise := Continent(newChoose);
      Continent := continentalChoise
    end
    else
      Continent := continentalChoise
  end;
      
    
  
  {Proofs if the same question was already asked, and if yes, then looks for another, really new question}
  function Proof(inQuestionNum : tQuestionNum;
             var ioA : integer) : integer;
             
    var
    numberFromRandom,
    iProof : integer;
    
  begin
    numberFromRandom := ioA;
    for iProof := 0 to ROUND do
      if inQuestionNum[iProof] = numberFromRandom then
      begin
        numberFromRandom := random(names + 1);
        numberFromRandom := Proof(inQuestionNum, numberFromRandom)
      end
      else
        Proof := numberFromRandom
  end;
  
  
begin
  writeln('Для начала игры нажмите "Enter"');
  readln;
  
  writeln('Для выбора стран Европы нажмите "1"');
  writeln('Для выбора стран Азии нажмите "2"');
  writeln('Для выбора стран Африки нажмите "3"');
  writeln('Для выбора стран Северной и Южной Америки нажмите "4"');
  writeln('Для выбора стран Океании нажмите "5"');
  writeln('Для выбора стран со всего мира нажмите "6"');
  readln(choose);
 
  choose := Continent(choose);
  
  {Connect variables with appropriated "database"}
  case choose of
    1:
    begin
      names := NAMES_EURO;
      i := 0;
      
      assign(f, 'Euro countries.txt'); 
      reset(f);
      
      while not eof(f) do
      begin
        read(f, dataInput);
        city[i] := dataInput.city;
        country[i] := dataInput.country;
        i := i + 1
      end;
      
      close(f)
    end;
    2:
    begin
      names := NAMES_ASIA;
      i := 0;
      
      assign(f, 'Asia countries.txt'); 
      reset(f);
      
      while not eof(f) do
      begin
        read(f, dataInput);
        city[i] := dataInput.city;
        country[i] := dataInput.country;
        i := i + 1
      end;
      
      close(f)
    end;
    3:
    begin
      names := NAMES_AFRICA;
      i := 0;
      
      assign(f, 'Africa countries.txt'); 
      reset(f);
      
      while not eof(f) do
      begin
        read(f, dataInput);
        city[i] := dataInput.city;
        country[i] := dataInput.country;
        i := i + 1
      end;
      
      close(f)
    end;
    4:
    begin
      names := NAMES_AMERICA;
      i := 0;
      
      assign(f, 'America countries.txt'); 
      reset(f);
      
      while not eof(f) do
      begin
        read(f, dataInput);
        city[i] := dataInput.city;
        country[i] := dataInput.country;
        i := i + 1
      end;
      
      close(f)
    end;
    5:
    begin
      names := NAMES_OCEANIA;
      i := 0;
      
      assign(f, 'Oceania countries.txt'); 
      reset(f);
      
      while not eof(f) do
      begin
        read(f, dataInput);
        city[i] := dataInput.city;
        country[i] := dataInput.country;
        i := i + 1
      end;
      
      close(f)
    end;
    6:
    begin
      names := NAMES_WORLD;
      i := 0;
      
      assign(f, 'Euro countries.txt');
      reset(f);
      
      while not eof(f) do
      begin
        read(f, dataInput);
        city[i] := dataInput.city;
        country[i] := dataInput.country;
        i := i + 1
      end;
      close(f);
      
      assign(f, 'Asia countries.txt');
      reset(f);
      
      while not eof(f) do
      begin
        read(f, dataInput);
        city[i] := dataInput.city;
        country[i] := dataInput.country;
        i := i + 1
      end;
      close(f);
      
      assign(f, 'Africa countries.txt');
      reset(f);
      
      while not eof(f) do
      begin
        read(f, dataInput);
        city[i] := dataInput.city;
        country[i] := dataInput.country;
        i := i + 1
      end;
      close(f);
      
      assign(f, 'America countries.txt');
      reset(f);
      
      while not eof(f) do
      begin
        read(f, dataInput);
        city[i] := dataInput.city;
        country[i] := dataInput.country;
        i := i + 1
      end;
      close(f);
      
      assign(f, 'Oceania countries.txt');
      reset(f);
      
      while not eof(f) do
      begin
        read(f, dataInput);
        city[i] := dataInput.city;
        country[i] := dataInput.country;
        i := i + 1
      end;
      close(f)
    end
  end;
      
  writeln;
  
  
  {Write all questions and read all answers}
  for i := 0 to ROUND do
  begin
    a := random(names + 1);
    a := Proof(questionNum, a);
    writeln(i + 1, '. Назовите столицу государства ', country[a], ' и нажмите "Enter"');
    readln(answer[i]);
    questionNum[i] := a
  end;
  
  score := 0;
  writeln;
  
  {Write your and correct results}
  for i := 0 to ROUND do
  begin
    writeln(i + 1, '. Ваш ответ: ', answer[i], ', Правильный ответ: ', city[questionNum[i]]);
    
    {Count your answers if is was correct}
    if answer[i] = city[questionNum[i]] then
      score := score + 1
  end;
  
  
  
  {get all results from file into array}
  assign(fResult, 'result.txt');
  reset(fResult);
  
  resultIndex := 0;
  
  while not eof(fResult) do
  begin
    read(fResult, fromResultFile);
    myResult[resultIndex] := fromResultFile;
    resultIndex := resultIndex + 1
  end;
    
    
  {Write you result}
  writeln;
  writeln('Количество правильных ответов: ', score, ' из 10; ', myResult[score]);
  writeln('Для выхода нажмите "Enter"');
  readln
end.