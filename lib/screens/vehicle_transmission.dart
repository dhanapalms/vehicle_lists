import 'package:flutter/material.dart';
import 'package:turbo_care/bloc/vehicle_bloc.dart';
import 'package:turbo_care/model/vehicle_model.dart';
import 'package:turbo_care/screens/vehicle_model.dart';
import 'package:turbo_care/screens/vehicle_profile.dart';
import 'package:provider/provider.dart';

class VehicleTransmission extends StatelessWidget {
  final String vehicleNo;
  final String wheeler;
  final String make;
  final String model;
  final String fuelType;

  VehicleTransmission(
      {this.vehicleNo, this.wheeler, this.make, this.model, this.fuelType});

  @override
  Widget build(BuildContext context) {
    final List<String> transmission = ['Manual', 'Automatic'];
    return Scaffold(
        appBar: AppBar(
          title: Text('Select Transmission'),
          backgroundColor: Colors.purple[900],
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            print('DETAILS COLLECTED');
            print(vehicleNo + wheeler + make + model + fuelType);
            return GestureDetector(
                child: ListTile(
                  leading: Text(transmission[index]),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
                onTap: () {
                  var vehicle = VehicleMod();
                  vehicle.fuelType = fuelType;
                  vehicle.make = make;
                  vehicle.vehicleNo = vehicleNo;
                  vehicle.wheeler = wheeler;
                  vehicle.transmission = transmission[index];
                  vehicle.model = model;
                  Provider.of<VehicleBloc>(context, listen: false)
                      .addVehicle(vehicle);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => VehicleProfile(
                            make: make,
                            vehicleNo: vehicleNo,
                            wheeler: wheeler,
                            model: model,
                            fuelType: fuelType,
                            transmission: transmission[index])),
                  );
                });
          },
          itemCount: transmission.length,
        ));
  }
}
