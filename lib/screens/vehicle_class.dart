import 'package:flutter/material.dart';
import 'package:turbo_care/providers/api_providers.dart';
import 'package:turbo_care/screens/vehicle_make.dart';

class VehicleClass extends StatefulWidget {
  final String vehicleNo;
  VehicleClass({@required this.vehicleNo});
  @override
  _VehicleClassState createState() => _VehicleClassState();
}

class _VehicleClassState extends State<VehicleClass> {
  List<String> carModels;
  List<String> bikeModels;
  @override
  void initState() {
    carModels = [];
    bikeModels = [];
    fetchClass2();
    fetchClass4();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Select Class'),
          backgroundColor: Colors.purple[900],
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: Column(
          children: [wheeler('Car'), wheeler('Bike')],
        ));
  }

  void fetchClass2() async {
    bikeModels = await ApiProviders().getVehicle2Class();
    print('resp2w - $bikeModels');
  }

  void fetchClass4() async {
    carModels = await ApiProviders().getVehicle4Class();
    print('resp4w - $carModels');
  }

  Widget wheeler(String title) => GestureDetector(
        child: ListTile(
          leading: Text(title),
          trailing: Icon(Icons.keyboard_arrow_right),
        ),
        onTap: () async {
          if (title == 'Car') {
            //fetchClass4();
            await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => VehicleMake(
                          wheeler: 'Car',
                          vehicleNo: widget.vehicleNo,
                          modelsList: carModels,
                        )));
          } else {
            //fetchClass2();
            await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => VehicleMake(
                          wheeler: 'Bike',
                          vehicleNo: widget.vehicleNo,
                          modelsList: bikeModels,
                        )));
          }
        },
      );
}
