program CountryQuiz (input, output);
{Small quiz where you should write capitals of some countries}

{Author: Vladislavs Mova;
 Version: 1.1.0}

  const
  ROUND = 9; {Number of rounds of the game = 10}
  NAMES = 44; {45 countries and cities at all}
    
  var
  i,
  a,
  score : integer;
  city : array [0..NAMES] of string = ({0}'Berlin', {1}'Paris', {2}'Oslo', {3}'Helsinki', {4}'Prague', {5}'Bucharest', 
             {6}'Belgrade', {7}'Ljubljana', {8}'Reykjavik', {9}'Tirana', {10}'Andorra la Vella', {11}'Vienna', {12}'Minsk',
             {13}'Brussels', {14}'Sarajevo', {15}'Sofia', {16}'Zagreb', {17}'Nicosia', {18}'Copenhagen', {19}'Tallinn', 
             {20}'Athens', {21}'Budapest', {22}'Dublin', {23}'Rome', {24}'Riga', {25}'Vaduz', {26}'Vilnius', {27}'Luxembourg', 
             {28}'Skopje', {29}'Valletta', {30}'Chisinau', {31}'Monaco', {32}'Podgorica', {33}'Amsterdam', {34}'Warsaw', 
             {35}'Lisbon', {36}'Moscow', {37}'San Marino', {38}'Bratislava', {39}'Madrid', {40}'Stockholm', {41}'Bern', 
             {42}'Kiev', {43}'London', {44}'Vatican');
  country : array [0..NAMES] of string = ({0}'Germany', {1}'France', {2}'Norway', {3}'Finland', {4}'Czech Republic', 
             {5}'Romania', {6}'Serbia', {7}'Slovenia', {8}'Iceland', {9}'Albania', {10}'Andorra', {11}'Austria', {12}'Belarus', 
             {13}'Belgium', {14}'Bosnia and Herzegovina', {15}'Bulgaria', {16}'Croatia', {17}'Cyprus', {18}'Denmark', 
             {19}'Estonia', {20}'Greece', {21}'Hungary', {22}'Ireland', {23}'Italy', {24}'Latvia', {25}'Liechtenstein', 
             {26}'Lithuania', {27}'Luxembourg', {28}'Macedonia', {29}'Malta', {30}'Moldova', {31}'Monaco', {32}'Montenegro', 
             {33}'Netherlands', {34}'Poland', {35}'Portugal', {36}'Russia', {37}'San Marino', {38}'Slovakia', {39}'Spain', 
             {40}'Sweden', {41}'Switzerland', {42}'Ukraine', {43}'United Kingdom', {44}'Vatican');
  answer : array [0..ROUND] of string;
  myResult : array [0..ROUND + 1] of string = ('You schould go back to school!', 'Very, very bad.', 'Very bad.', 'Bad.', 
             'Mediocre.', 'One half you have guessed.', 'More than a half - not bad!', 'Good result.', 'Excellent!',
             'Terrific!', 'Everything is right! You are a real geographer!');
  questionNum : array [0..ROUND] of integer;
  
begin
  writeln('Press "Enter" to start');
  readln;
  
  {Write all questions and read all answers}
  for i := 0 to ROUND do
  begin
    a := random(NAMES + 1);
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
