
class Temperature {
  final double temperature;
  final String time;
  final String scale;


  Temperature({required this.temperature, required this.time, required this.scale});
}

class TemperatureModel {
  static final temp_card = [
    Temperature(
        temperature: 38,
        time: "9:40 am",
        scale: "C"
    ),


  ];
}