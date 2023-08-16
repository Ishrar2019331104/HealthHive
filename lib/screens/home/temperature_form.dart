import 'package:flutter/material.dart';
import 'package:health_hive/components/app_colors.dart';
import 'package:health_hive/components/app_text.dart';

class TemperatureForm extends StatefulWidget {
  const TemperatureForm({Key? key}) : super(key: key);

  @override
  State<TemperatureForm> createState() => _TemperatureFormState();
}

class _TemperatureFormState extends State<TemperatureForm> {
  double temperatureValue = 0;
  String selectedScale = "Fahrenheit"; // Set default scale
  final List<String> temperatureScales = ["Fahrenheit", "Celsius"]; // Renamed from 'doseUnits'

  void _submitForm() {
    print("Temperature: $temperatureValue $selectedScale");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.anchorGrey),
        title: AppText(text: 'Log temperature'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              _submitForm();
              Navigator.pushNamed(context, '/logbook');
            },
            icon: Icon(Icons.done, color: AppColors.anchorGrey),
          )
        ],
        backgroundColor: AppColors.slateGrey,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  labelText: 'Temperature',
                  labelStyle: TextStyle(color: AppColors.anchorGrey),
                ),
                onChanged: (value) {
                  setState(() {
                    temperatureValue = double.tryParse(value) ?? 0;
                  });
                },
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: selectedScale,
                onChanged: (newValue) {
                  setState(() {
                    selectedScale = newValue ?? "Fahrenheit"; // Handle null value
                  });
                },
                items: temperatureScales.map((scale) {
                  return DropdownMenuItem(
                    value: scale,
                    child: Text(
                      scale,
                      style: TextStyle(color: AppColors.anchorGrey),
                    ),
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: 'Temperature Scale',
                  labelStyle: TextStyle(color: AppColors.anchorGrey),
                ),
              ),
              SizedBox(height: 16),

            ],
          ),
        ),
      ),
    );
  }
}
