program CountryQuiz (input, output);
{Small quiz where you should write capitals of some countries}

{Author: Vladislavs Mova;
 Version: 1.0.0}

  const
  ROUND = 10; {Number of rounds of the game = 10}
    
  var
  i,
  score : integer;
  city : array [1..ROUND] of string = ('Berlin', 'Paris', 'Oslo', 'Helsinki', 'Prague', 'Bucharest', 'Belgrade', 'Ljubljana', 'Reykjavik', 'Kuala Lumpur');
  country : array [1..ROUND] of string = ('Germany', 'France', 'Norway', 'Finland', 'Czech Republic', 'Romania', 'Serbia', 'Slovenia', 'Iceland', 'Malaysia');
  answer : array [1..ROUND] of string;
  myResult : array [0..ROUND] of string = ('You schould go back to school!', 'Very, very bad.', 'Very bad.', 'Bad.', 
             'Mediocre.', 'One half you have guessed.', 'More than a half - not bad!', 'Good result.', 'Excellent!',
             'Terrific!', 'Everything is right! You are a real geographer!');
  
begin
  writeln('Press "Enter" to start');
  readln;
  
  {Write all questions and read all answers}
  for i := 1 to ROUND do
  begin
    writeln(i, '. Write a name of the capital of the following country: ', country[i], ' and press "Enter"');
    readln(answer[i]);
  end;
  
  score := 0;
  writeln;
  
  {Write your and correct results}
  for i := 1 to ROUND do
  begin
    writeln(i, '. Your answer: ', answer[i], ', Correct answer: ', city[i]);
    
    {Count your answers if is was correct}
    if answer[i] = city[i] then
      score := score + 1
  end;
  
  {Write you result}
  writeln;
  writeln('Number of correct answers: ', score, ' of 10; ', myResult[score]);
  writeln('Press "Enter" to quit');
  readln
end.