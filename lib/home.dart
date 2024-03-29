import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;

    //set background image

    Color? bgColor = data['isDaytime']? Colors.blue: Colors.indigo[700];
    return Scaffold(
     backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0,120, 0, 0),
                child:Column(
                  children: <Widget>[

                    TextButton(onPressed: () async{
                      dynamic result = await Navigator.pushNamed(context, '/location');
                      setState((){
                        data =  {
                          'time':result['time'],
                          'location':result['location'],
                          'isDaytime':result['isDaytime'],
                          'flag': result['flag'],
                        };
                      });
                    },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Choose Location",style: TextStyle(color: Colors.white),),
                            SizedBox(width: 16),
                            Icon(Icons.edit_location,
                                color: Colors.grey[300]),
                          ],
                        )),
                    SizedBox(height:20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(data['location'],
                            style:TextStyle(
                                fontSize: 28,
                                letterSpacing: 2.0,
                              color: Colors.white,

                            )),
                      ],
                    ),
                    SizedBox (height:20),
                    Text(data['time'],
                    style:TextStyle(
                      fontSize:66,
                      color: Colors.white,

                    ))
                  ],
                )
            )

          ),
        ),
      )
    );
  }
}