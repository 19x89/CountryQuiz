program CountryQuiz (input, output);
{Small quiz where you should write capitals of some countries}

{Author: Vladislavs Mova;
 Version: 1.2.0}

  const
  ROUND = 9; {Number of rounds of the game = 10}
  NAMES_EURO = 45; {45 countries and cities in Europe}
  NAMES_ASIA = 45; {45 countries and cities in Asia}
  NAMES_AFRICA = 55; {56 countries and cities in Africa}
  NAMES_AMERICA = 53; {54 countries and cities in Americas}
  NAMES_OCEANIA = 22; {23 countries and cities in Oceania}
  
  type
  tQuestionNum = array [0..ROUND] of integer;
  tCity = array [0..55] of string;
  tCountry = array [0..55] of string;
    
  var
  i,
  a,
  score,
  choose,
  names : integer;
  
  
  cityEuro : array [0..NAMES_EURO] of string = ({0}'Berlin', {1}'Paris', {2}'Oslo', {3}'Helsinki', {4}'Prague', {5}'Bucharest', 
             {6}'Belgrade', {7}'Ljubljana', {8}'Reykjavik', {9}'Tirana', {10}'Andorra la Vella', {11}'Vienna', {12}'Minsk',
             {13}'Brussels', {14}'Sarajevo', {15}'Sofia', {16}'Zagreb', {17}'Nicosia', {18}'Copenhagen', {19}'Tallinn', 
             {20}'Athens', {21}'Budapest', {22}'Dublin', {23}'Rome', {24}'Riga', {25}'Vaduz', {26}'Vilnius', {27}'Luxembourg', 
             {28}'Skopje', {29}'Valletta', {30}'Chisinau', {31}'Monaco', {32}'Podgorica', {33}'Amsterdam', {34}'Warsaw', 
             {35}'Lisbon', {36}'Moscow', {37}'San Marino', {38}'Bratislava', {39}'Madrid', {40}'Stockholm', {41}'Bern', 
             {42}'Kiev', {43}'London', {44}'Vatican', {45}'Torshavn');
  countryEuro : array [0..NAMES_EURO] of string = ({0}'Germany', {1}'France', {2}'Norway', {3}'Finland', {4}'Czech Republic', 
             {5}'Romania', {6}'Serbia', {7}'Slovenia', {8}'Iceland', {9}'Albania', {10}'Andorra', {11}'Austria', {12}'Belarus', 
             {13}'Belgium', {14}'Bosnia and Herzegovina', {15}'Bulgaria', {16}'Croatia', {17}'Cyprus', {18}'Denmark', 
             {19}'Estonia', {20}'Greece', {21}'Hungary', {22}'Ireland', {23}'Italy', {24}'Latvia', {25}'Liechtenstein', 
             {26}'Lithuania', {27}'Luxembourg', {28}'Macedonia', {29}'Malta', {30}'Moldova', {31}'Monaco', {32}'Montenegro', 
             {33}'Netherlands', {34}'Poland', {35}'Portugal', {36}'Russia', {37}'San Marino', {38}'Slovakia', {39}'Spain', 
             {40}'Sweden', {41}'Switzerland', {42}'Ukraine', {43}'United Kingdom', {44}'Vatican', {45}'Faroe Islands');
             
  cityAsia : array [0..NAMES_ASIA] of string = ({0}'Kabul', {1}'Yerevan', {2}'Baku', {3}'Manama', {4}'Dhaka', {5}'Thimphu', 
             {6}'Bandar Seri Begawan', {7}'Phnom Penh', {8}'Beijing', {9}'Tbilisi', {10}'Delhi', {11}'Jakarta', {12}'Tehran',
             {13}'Baghdad', {14}'Jerusalem', {15}'Tokyo', {16}'Amman', {17}'Astana', {18}'Pyongyang', {19}'Seoul', 
             {20}'Kuwait', {21}'Bishkek', {22}'Vientiane', {23}'Beirut', {24}'Kuala Lumpur', {25}'Male', {26}'Ulaanbaatar', 
             {27}'Nay Pyi Taw', {28}'Kathmandu', {29}'Muscat', {30}'Islamabad', {31}'Manila', {32}'Doha', {33}'Riyadh', 
             {34}'Singapore', {35}'Kotte', {36}'Damascus', {37}'Dushanbe', {38}'Bangkok', {39}'Dili', {40}'Ankara', 
             {41}'Ashgabat', {42}'Abu Dhabi', {43}'Tashkent', {44}'Hanoi', {45}'Sana');
  countryAsia : array [0..NAMES_ASIA] of string = ({0}'Afganistan', {1}'Armenia', {2}'Azerbaijan', {3}'Bahrain', 
             {4}'Bangladesh', {5}'Bhutan', {6}'Brunei', {7}'Cambodia', {8}'China', {9}'Georgia', {10}'India', {11}'Indonesia',
             {12}'Iran', {13}'Iraq', {14}'Israel', {15}'Japan', {16}'Jordan', {17}'Kazakhstan', {18}'North Korea',
             {19}'South Korea', {20}'Kuwait', {21}'Kyrgyzstan', {22}'Laos', {23}'Lebanon', {24}'Malaysia', {25}'Maldives',
             {26}'Mongolia', {27}'Myanmar', {28}'Nepal', {29}'Oman', {30}'Pakistan', {31}'Philippines', {32}'Qatar',
             {33}'Saudi Arabia', {34}'Singapore', {35}'Sri Lanka', {36}'Syria', {37}'Tajikistan', {38}'Thailand', 
             {39}'Timor-Leste', {40}'Turkey', {41}'Turkmenistan', {42}'United Arab Emirates', {43}'Uzbekistan', {44}'Vietnam',
             {45}'Yemen');
             
  cityAfrica : array [0..NAMES_AFRICA] of string = ({0}'Algiers', {1}'Luanda', {2}'Porto-Novo', {3}'Gaborone', {4}'Ouagadougou', 
             {5}'Bujumbura', {6}'Yaounde', {7}'Praia', {8}'Bangui', {9}'Ndjamena', {10}'Moroni', {11}'Kinshasa', 
             {12}'Brazzaville', {13}'Djibouti', {14}'Cairo', {15}'Malabo', {16}'Asmara', {17}'Addis Ababa', {18}'Liberville', 
             {19}'Banjul', {20}'Accra', {21}'Conakry', {22}'Bissau', {23}'Yamoussoukro', {24}'Nairobi', {25}'Maseru', 
             {26}'Monrovia', {27}'Tripoli', {28}'Antananarivo', {29}'Lilongwe', {30}'Bamako', {31}'Nouakchott', {32}'Port Louis', 
             {33}'Rabat', {34}'Maputo', {35}'Windhoek', {36}'Niamey', {37}'Abuja', {38}'Kigali', {39}'Sao Tome', {40}'Dakar', 
             {41}'Victoria', {42}'Freetown', {43}'Mogadishu', {44}'Pretoria', {45}'Juba', {46}'Khartoum', {47}'Lobamba', 
             {48}'Dodoma', {49}'Lome', {50}'Tunis', {51}'Kampala', {52}'Lusaka', {53}'Harare', {54}'Mamoudzou', {55}'Saint-Denis');
  countryAfrica : array [0..NAMES_AFRICA] of string = ({0}'Algeria', {1}'Angola', {2}'Benin', {3}'Botswana', {4}'Burkina Faso', 
             {5}'Burundi', {6}'Cameroon', {7}'Cape Verde', {8}'Central African Republic', {9}'Chad', {10}'Comors', 
             {11}'Democratic Republic of the Congo', {12}'Republic of the Congo', {13}'Djibouti', {14}'Egypt', 
             {15}'Equatorial Guinea', {16}'Eritrea', {17}'Ethiopia', {18}'Gabon', {19}'Gambia', {20}'Ghana', {21}'Guinea', 
             {22}'Guinea-Bissau', {23}'Ivory Coast', {24}'Kenya', {25}'Lesotho', {26}'Liberia', {27}'Libya', {28}'Madagascar', 
             {29}'Malawi', {30}'Mali', {31}'Mauritania', {32}'Mauritius', {33}'Morocco', {34}'Mozambique', {35}'Namibia', 
             {36}'Niger', {37}'Nigeria', {38}'Rwanda', {39}'Sao Tome and Principe', {40}'Senegal', {41}'Seychelles', 
             {42}'Sierra Leone', {43}'Somalia', {44}'South Africa', {45}'South Sudan', {46}'Sudan', {47}'Swaziland', {48}'Tanzania', 
             {49}'Togo', {50}'Tunisia', {51}'Uganda', {52}'Zambia', {53}'Zimbabwe', {54}'Mayotte', {55}'Reunion');
             
  cityAmerica : array [0..NAMES_AMERICA] of string = ({0}'Buenos Aires', {1}'Sucre', {2}'Brasilia', {3}'Santiago', {4}'Bogota', 
             {5}'Quito', {6}'Georgetown', {7}'Asuncion', {8}'Lima', {9}'Paramaribo', {10}'Montevideo', {11}'Caracas', {12}'Stanley', 
             {13}'Cayenne', {14}'St. Johns', {15}'Nassau', {16}'Bridgetown', {17}'Belmopan', {18}'Ottawa', {19}'San Jose', 
             {20}'Havana', {21}'Roseau', {22}'Santo Domingo', {23}'San Salvador', {24}'St. Georges', {25}'Guatemala City', 
             {26}'Port-au-Prince', {27}'Tegucigalpa', {28}'Kingston', {29}'Mexico City', {30}'Managua', {31}'Panama City', 
             {32}'Basseterre', {33}'Castries', {34}'Kingstown', {35}'Port of Spain', {36}'Washington', {37}'The Valley', 
             {38}'Hamilton', {39}'Road Town', {40}'George Town', {41}'Plymouth', {42}'Cockburn Town', {43}'Oranjestad', 
             {44}'Kralendijk', {45}'Willemstad', {46}'Nuuk', {47}'Basse-Terre', {48}'Fort-de-France', {49}'Gustavia', {50}'Marigot', 
             {51}'Saint-Pierre', {52}'Philipsburg', {53}'Charlotte Amalie');
  countryAmerica : array [0..NAMES_AMERICA] of string = ({0}'Argentina', {1}'Bolivia', {2}'Brazil', {3}'Chile', {4}'Colombia', 
             {5}'Ecuador', {6}'Guyana', {7}'Paraguay', {8}'Peru', {9}'Suriname', {10}'Uruguay', {11}'Venezuela', 
             {12}'Falkland Islands', {13}'French Guiana', {14}'Antigua and Barbuda', {15}'Bahamas', {16}'Barbados', {17}'Belize', 
             {18}'Canada', {19}'Costa Rica', {20}'Cuba', {21}'Dominica', {22}'Dominican Republic', {23}'El Salvador', {24}'Grenada', 
             {25}'Guatemala', {26}'Haiti', {27}'Honduras', {28}'Jamaica', {29}'Mexico', {30}'Nicaragua', {31}'Panama', 
             {32}'Saint Kitts and Nevis', {33}'Saint Lucia', {34}'Saint Vincent and the Grenadines', {35}'Trinidad and Tobago', 
             {36}'USA', {37}'Anguilla', {38}'Bermuda', {39}'British Virgin Islands', {40}'Cayman Islands', {41}'Montserrat', 
             {42}'Turks and Caicos Islands', {43}'Aruba', {44}'Bonaire', {45}'Curacao', {46}'Greenland', {47}'Guadeloupe', 
             {48}'Martinique', {49}'Saint Barthelemy', {50}'Saint Martin', {51}'Saint Pierre and Miquelon', {52}'Sint Maarten', 
             {53}'United States Virgin Islands');
             
  cityOceania : array [0..NAMES_OCEANIA] of string = ({0}'Canberra', {1}'Palikir', {2}'Suva', {3}'Tarawa', {4}'Majuro', 
             {5}'Wellington', {6}'Ngerulmud', {7}'Port Moresby', {8}'Apia', {9}'Honiara', {10}'Nukualofa', {11}'Funafuti', 
             {12}'Port Vila', {13}'Avarua', {14}'Alofi', {15}'Pago Pago', {16}'Papeete', {17}'Hagatna', {18}'Noumea', {19}'Kingston', 
             {20}'Saipan', {21}'Adamstown', {22}'Mata-Utu');
  countryOceania : array [0..NAMES_OCEANIA] of string = ({0}'Australia', {1}'Federated States of Micronesia', {2}'Fiji', {3}'Kiribati',
             {4}'Marshall Islands', {5}'New Zealand', {6}'Palau', {7}'Papua New Guinea', {8}'Samoa', {9}'Solomon Islands', {10}'Tonga', 
             {11}'Tuvalu', {12}'Vanuatu', {13}'Cook Islands', {14}'Niue', {15}'American Samoa', {16}'French Polynesia', {17}'Guam', 
             {18}'New Caledonia', {19}'Norfolk Island', {20}'Northern Mariana Islands', {21}'Pitcairn Islands', {22}'Wallis and Futuna');
             
  answer : array [0..ROUND] of string;
  myResult : array [0..ROUND + 1] of string = ('You schould go back to school!', 'Very, very bad.', 'Very bad.', 'Bad.', 
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
    if (continentalChoise < 1) or (continentalChoise > 5) then
    begin
      writeln('Error! Enter a correct number:');
      writeln('"1" for Europe, "2" for Asia, "3" for Africa, "4" for North and South America, "5" for Oceania');
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
  readln(choose);
 
  choose := Continent(choose);
 
  {Connect variables with appropriated "database"}
  if choose = 1 then
  begin
    names := NAMES_EURO;
    for i := 0 to names do
    begin
      city[i] := cityEuro[i];
      country[i] := countryEuro[i]
    end
  end
  else
    if choose = 2 then
    begin
      names := NAMES_ASIA;
      for i := 0 to names do
      begin
        city[i] := cityAsia[i];
        country[i] := countryAsia[i]
      end
    end
    else
      if choose = 3 then
      begin
        names := NAMES_AFRICA;
        for i := 0 to names do
        begin
          city[i] := cityAfrica[i];
          country[i] := countryAfrica[i]
        end
      end
      else
        if choose = 4 then
        begin
          names := NAMES_AMERICA;
          for i := 0 to names do
          begin
            city[i] := cityAmerica[i];
            country[i] := countryAmerica[i]
          end
        end
        else
          if choose = 5 then
          begin
            names := NAMES_OCEANIA;
            for i := 0 to names do
            begin
              city[i] := cityOceania[i];
              country[i] := countryOceania[i]
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
