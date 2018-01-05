program CountryQuiz (input, output);
{Small quiz where you should write capitals of some countries}

{Author: Vladislavs Mova;
 Version: 1.3.0}

  const
  ROUND = 9; {Number of rounds of the game = 10}
  NAMES_EURO = 45; {45 countries and cities in Europe}
  NAMES_ASIA = 45; {45 countries and cities in Asia}
  NAMES_AFRICA = 55; {56 countries and cities in Africa}
  NAMES_AMERICA = 53; {54 countries and cities in Americas}
  NAMES_OCEANIA = 22; {23 countries and cities in Oceania}
  NAMES_WORLD = 224; {225 countries and cities all over the world}
  
  
  
  type
  tQuestionNum = array [0..ROUND] of integer;
  tCity = array [0..224] of string;
  tCountry = array [0..224] of string;
  tDataInput = record
    country : string[35];
    city : string[35]
    end;
    
    
  var
  i,
  a,
  score,
  choose,
  names : integer;
  dataInput : tDataInput;
  f : file of tDataInput;
  

             
  answer : array [0..ROUND] of string;
  myResult : array [0..10] of string = ('You schould go back to school!', 'Very, very bad.', 'Very bad.', 'Bad.', 
             'Mediocre.', 'One half you have guessed.', 'More than a half - not bad!', 'Good result.', 'Excellent!',
             'Terrific!', 'Everything is right! You are a real geographer!');
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
      writeln('Error! Enter a correct number:');
      writeln('"1" for Europe, "2" for Asia, "3" for Africa, "4" for North and South America, "5" for Oceania, "6" for the whole world');
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
        numberFromRandom := random(NAMES + 1);
        numberFromRandom := Proof(inQuestionNum, numberFromRandom)
      end
      else
        Proof := numberFromRandom
  end;
  
  
begin
  writeln('Press "Enter" to start');
  readln;
  
  writeln('Enter "1" to choose European countries');
  writeln('Enter "2" to choose Asian countries');
  writeln('Enter "3" to choose African countries');
  writeln('Enter "4" to choose North and South American countries');
  writeln('Enter "5" to choose Oceanian countries');
  writeln('Enter "6" to choose countries from the whole world');
  readln(choose);
 
  choose := Continent(choose);
 
  {Connect variables with appropriated "database"}
  case choose of
    1:
    begin
      names := NAMES_EURO;
      i := 0;
      
      assign(f, 'Euro countries ENG.txt'); 
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
      
      assign(f, 'Asia countries ENG.txt'); 
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
      
      assign(f, 'Africa countries ENG.txt'); 
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
      
      assign(f, 'America countries ENG.txt'); 
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
      
      assign(f, 'Oceania countries ENG.txt'); 
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
      
      assign(f, 'Euro countries ENG.txt');
      reset(f);
      
      while not eof(f) do
      begin
        read(f, dataInput);
        city[i] := dataInput.city;
        country[i] := dataInput.country;
        i := i + 1
      end;
      close(f);
      
      assign(f, 'Asia countries ENG.txt');
      reset(f);
      
      while not eof(f) do
      begin
        read(f, dataInput);
        city[i] := dataInput.city;
        country[i] := dataInput.country;
        i := i + 1
      end;
      close(f);
      
      assign(f, 'Africa countries ENG.txt');
      reset(f);
      
      while not eof(f) do
      begin
        read(f, dataInput);
        city[i] := dataInput.city;
        country[i] := dataInput.country;
        i := i + 1
      end;
      close(f);
      
      assign(f, 'America countries ENG.txt');
      reset(f);
      
      while not eof(f) do
      begin
        read(f, dataInput);
        city[i] := dataInput.city;
        country[i] := dataInput.country;
        i := i + 1
      end;
      close(f);
      
      assign(f, 'Oceania countries ENG.txt');
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
    writeln(i + 1, '. Write a name of the capital of the following country: ', country[a], ' and press "Enter"');
    readln(answer[i]);
    questionNum[i] := a
  end;
  
  score := 0;
  writeln;
  
  {Write your and correct results}
  for i := 0 to ROUND do
  begin
    writeln(i + 1, '. Your answer: ', answer[i], ', Correct answer: ', city[questionNum[i]]);
    
    {Count your answers if is was correct}
    if answer[i] = city[questionNum[i]] then
      score := score + 1
  end;
  
  {Write you result}
  writeln;
  writeln('Number of correct answers: ', score, ' of 10; ', myResult[score]);
  writeln('Press "Enter" to quit');
  readln
end.
