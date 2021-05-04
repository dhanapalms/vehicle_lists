import 'package:flutter/material.dart';
import 'package:turbo_care/screens/vehicle_transmission.dart';

class VehicleFuel extends StatelessWidget {
  final String vehicleNo;
  final String wheeler;
  final String make;
  final String model;

  VehicleFuel({this.vehicleNo, this.wheeler, this.make, this.model});

  @override
  Widget build(BuildContext context) {
    final List<String> fuelType = [
      'Petrol',
      'Diesel',
      'CNG',
      'Petrol + CNG',
      'Electric',
      'Hybrid'
    ];
    return Scaffold(
        appBar: AppBar(
          title: Text('Select Fuel Type'),
          backgroundColor: Colors.purple[900],
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return GestureDetector(
              child: ListTile(
                leading: Text(fuelType[index]),
                trailing: Icon(Icons.keyboard_arrow_right),
              ),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => VehicleTransmission(
                          make: make,
                          vehicleNo: vehicleNo,
                          wheeler: wheeler,
                          model: model,
                          fuelType: fuelType[index]))),
            );
          },
          itemCount: fuelType.length,
        ));
  }
}
