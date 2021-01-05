import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

void main() => runApp(new MaterialApp(home: new MyApp(), debugShowCheckedModeBanner: false,),);

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new ListView.builder(
        itemCount: vehicles.length,
        itemBuilder: (context, i) {
          return new ExpansionTile(
            title: new Text(vehicles[i].title, style: new TextStyle(fontSize: 20.0, ),),
            children: <Widget>[
              new Column(
                children: _buildExpandableContent(vehicles[i]),
              ),
            ],
          );
        },
      ),
    );
  }

  _buildExpandableContent(Vehicle vehicle) {
    List<Widget> columnContent = [];

    for (int i=0; i<vehicle.contents.length;i++)
      columnContent.add(
         TimelineTile(
          alignment: TimelineAlign.start,
          afterLineStyle: LineStyle(color: Colors.blue),
          beforeLineStyle: LineStyle(color: Colors.blue),
          indicatorStyle: IndicatorStyle(width: 20,height: 20,color: Colors.blue.withOpacity(0.4)),
          endChild: InkWell(
            onLongPress: (){
              setState(() {
                i!=(vehicle.contents.length-1) && i != 0 ? vehicle.contents.removeAt(i) : null;
              });
            },
            child: Container(
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey,width: 1),
                color: Colors.white,

              ),
              constraints: const BoxConstraints(
                minHeight: 50,
              ),

              child: i==(vehicle.contents.length-1) ?
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MaterialButton(onPressed: (){
                    setState(() {
                      i==(vehicle.contents.length-1) ?
                      vehicle.contents.add("ponka") : null;
                    });
                  },
                    color: Colors.orangeAccent,
                    child: Text("Add item"),)
                ],
              ): null,
            ),
           ),
           isFirst: i==0?true:false,
           isLast: i==(vehicle.contents.length-1)?true:false,

       // );
        // new ListTile(
        //   title: new Text(content, style: new TextStyle(fontSize: 18.0),),
        //   subtitle: new Text(content, style: new TextStyle(fontSize: 14.0),),
        // ),
      )
      );

    return columnContent;
  }
}

class Vehicle {
  final String title;
  List<String> contents = [];
  final String subtitle;

  Vehicle(this.title, this.contents, this.subtitle);
}

List<Vehicle> vehicles = [
  new Vehicle(
    'fssdsdfsf',
    ['VA', 'VB', 'VC', 'VD'],
    "My life my rules",
  ),
  new Vehicle(
    'qwerty',
    ['VE', 'VF', 'VG'],
    "My Ponka",
  ),
];