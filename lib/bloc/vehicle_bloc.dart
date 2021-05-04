import 'package:flutter/material.dart';
import 'package:turbo_care/model/vehicle_model.dart';

class VehicleBloc extends ChangeNotifier {
  List<VehicleMod> vehicles = [];

  List<VehicleMod> get getVehicles => this.vehicles;

  addVehicle(VehicleMod vehicle) {
    vehicles.add(vehicle);
    print('Vehicle model added to Bloc successfully');
    notifyListeners();
  }
}
