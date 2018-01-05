program AddCountry (input, output);
{Internal tool that helps to create databases with countries and cities}

  const
  NAMES_EURO = 45; {46 countries and cities in Europe}
  NAMES_ASIA = 45; {46 countries and cities in Asia}
  NAMES_AFRICA = 55; {56 countries and cities in Africa}
  NAMES_AMERICA = 53; {54 countries and cities in Americas}
  NAMES_OCEANIA = 22; {23 countries and cities in Oceania}
  
  type
  tDataInput = record
    country : string[35];
    city : string[35]
    end;
    
  var
  dataInput : tDataInput;
  f : file of tDataInput; {create and write into the file}
  i : integer;
  
begin
  assign(f, 'Oceania countries ENG.txt'); {you could choose any other file}
  rewrite(f);
  for i := 0 to NAMES_OCEANIA do {you could choose any other const}
  begin
    with dataInput do
    begin
      write('Country: ');
      readln(country);
      write('City: ');
      readln(city)
    end;
    write(f, dataInput)
  end;
  close(f)
end.