import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context)?.settings.arguments as Map;
    print(data);

    String bgImage = data['isDayTime'] ? 'day.jpg' : 'night.jpg';

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$bgImage'),
            fit: BoxFit.fitHeight,
          )
        ),

        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 90, 0, 0),
          child: Column(
            children: [
              TextButton.icon(
                icon: Icon(Icons.edit_location),
                label: Text('Edit location'),
                style: TextButton.styleFrom(
                  primary: Colors.teal,
                ),
                onPressed: () async {
                  dynamic result = await Navigator.pushNamed(context, '/location');
                  setState(() {
                    data = {
                      'location': result['location'],
                      'flag': result['flag'],
                      'time': result['time'],
                      'isDayTime': result['isDayTime']
                    };
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data['location'],
                    style: TextStyle(
                      color: data['isDayTime'] ? Colors.black : Colors.white,
                      fontSize: 35.0,
                      letterSpacing: 2.0,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40.0),
              Text(
                data['time'],
                style: TextStyle(
                  color: data['isDayTime'] ? Colors.black : Colors.white,
                  fontSize: 70.0,
                  letterSpacing: 4.0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}