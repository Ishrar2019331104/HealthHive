
class Symptom {
  final String symptom_name;
  final String date;
  final String time;


  Symptom({required this.symptom_name, required this.date, required this.time});
}

class SymptomModel {
  static final symp_card = [
    Symptom(
        symptom_name: 'Abdominal pain',
        date: "17/8/23",
        time: "3:30 pm"

    ),


  ];
}