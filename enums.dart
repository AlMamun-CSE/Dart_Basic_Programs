//Declaring enums
enum Weather {
  SUNNY,
  CLOUDY,
  RAINY,
}

void main() {
  mainSwitchConstants();
}

//Using constants to display weather information
void mainSwitchConstants() {
  const SUNNY = 'Sunny';
  const CLOUDY = 'Cloudy';
  const RAINY = 'Rainy';

  //#1. Switch doesn't complain for const, but raise error for enums
  var choice = SUNNY;
  switch (choice) {
    case SUNNY:
      print("Sunny weather today");
      break;
  }
}

//Using Enums to display weather information
void mainSwitchEnums() {
  var weather = Weather.SUNNY;
  //Following code will complain about
  // not including other types of weather
  //OR use default
  switch (weather) {
    case Weather.SUNNY:
      print("Sunny weather today!");
      break;
    case Weather.CLOUDY:
      print("Cloudy today!");
      break;
    case Weather.RAINY:
      print("Rainy and gloomy weather.");
      break;
  }
}

//Only default case. No compilation issue
void mainSwitchEnumsDefault() {
  var weather = Weather.SUNNY;

  switch (weather) {
    default:
      print("Current weather:${weather}");
  }
}

void mainIterating() {
  //#2. enums can iterate on all types at once.
  //No need to create a list of consts
  Weather.values.forEach((w) => print(w));
}

void mainExtension() {
  //#3. Enum extensions. Using extension method console
  Weather.values.forEach((w) => w.console());
}

extension WeatherExt on Weather {
  //custom message for each weather type
  static const weatherMap = {
    Weather.SUNNY: "What a lovely weather",
    Weather.CLOUDY: "Scattered showers predicted",
    Weather.RAINY: "Will be raining today",
  };

  //prints enum index and custom message
  void console() {
    print("${this.index} ${this.about}");
  }

  //about property returns the custom message
  String? get about => weatherMap[this];
}