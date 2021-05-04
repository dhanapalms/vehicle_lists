import 'package:flutter/material.dart';
import 'package:turbo_care/screens/vehicle_model.dart';

class VehicleMake extends StatefulWidget {
  final String vehicleNo;
  final String wheeler;
  final List<String> modelsList;
  VehicleMake({this.vehicleNo, this.wheeler, @required this.modelsList});
  @override
  _VehicleMakeState createState() => _VehicleMakeState();
}

class _VehicleMakeState extends State<VehicleMake> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Select Make'),
          backgroundColor: Colors.purple[900],
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return GestureDetector(
              child: ListTile(
                leading: Text(widget.modelsList[index]
                    .substring(1, widget.modelsList[index].length - 1)),
                trailing: Icon(Icons.keyboard_arrow_right),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => VehicleModel(
                              make: widget.modelsList[index].substring(
                                  1, widget.modelsList[index].length - 1),
                              vehicleNo: widget.vehicleNo,
                              wheeler: widget.wheeler,
                            )));
              },
            );
          },
          itemCount: widget.modelsList.length,
        ));
  }
}
