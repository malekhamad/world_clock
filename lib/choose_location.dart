import 'package:flutter/material.dart';
import 'package:world_time/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  int counter =0;
  List<WorldTime> locations = [
    WorldTime(url: 'Asia/Amman', location: 'Amman'),
    WorldTime(url: 'Asia/Riyadh', location: 'Riyadh'),
    WorldTime(url: 'Europe/London', location: 'London'),
    WorldTime(url: 'Europe/Moscow', location: 'Moscow'),
    WorldTime(url: 'America/New_York', location: 'New York'),
  ];

  void updateTime(index) async{
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: ListView.builder(
        itemCount:locations.length,
        itemBuilder: (context, index){
          return Card(
            child:ListTile(
              onTap: (){
                updateTime(index);
              },
              title: Text(locations[index].location),

            )
          );

        }
      ),
      appBar: AppBar(
        title: Text('Location'),
        backgroundColor: Colors.blue,
      ),
    );
  }
}

