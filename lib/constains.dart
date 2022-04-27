class MapString {
  static String mapStringToIcon(String input) {
    String myText = '';
    switch (input) {
      case 'Thunderstorm':
        myText = 'assets/images/ThunderStorm.jpeg';
        break;
      case 'Drizzle':
        myText = 'assets/images/Drizzle.jpeg';
        break;
      case 'Rain':
        myText = 'assets/images/Rain.jpeg';
        break;
      case 'Snow':
        myText = 'assets/images/Snow.jpeg';
        break;
      case 'Clear':
        myText = 'assets/images/Clear.jpeg';
        break;
      case 'Clouds':
        myText = 'assets/images/Clouds.jpeg';
        break;

      default:
        myText = 'assets/images/white.png';
    }
    return myText;
  }
}
