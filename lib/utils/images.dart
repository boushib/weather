String codeToIcon(int code) {
  String iconCode;
  if (code == 800)
    iconCode = '01';
  else if (code == 801)
    iconCode = '02';
  else if (code == 802)
    iconCode = '03';
  else if (code == 803 || code == 804)
    iconCode = '04';
  else if (code >= 200 && code <= 232)
    iconCode = '11';
  else if ((code >= 300 && code <= 321) || (code >= 520 && code <= 531))
    iconCode = '09';
  else if (code >= 500 && code <= 504)
    iconCode = '10';
  else if (code == 511 || (code >= 600 && code <= 622))
    iconCode = '13';
  //else if (code >= 701 && code <= 781)
  else
    iconCode = '50';
  return 'http://openweathermap.org/img/wn/${iconCode}d@2x.png';
}
