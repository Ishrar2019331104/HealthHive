class Medicine {
  final String name;
  final String time;
  final String status;

  Medicine({required this.name, required this.time, required this.status});
}

class MedicineModel {
  static final meds = [
    Medicine(
        name: "Paracetamol",
        time: "9:40 am",
        status: "taken"
    ),
    Medicine(name: "Ace", time: "10:20", status: "not taken"),
    Medicine(name: "Montair", time: "5:00", status: "taken"),

  ];
}