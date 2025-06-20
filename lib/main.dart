import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ActivityEditor(title: 'Editor'))),
              child: Text('Activity Editor'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Rooms(title: 'Rooms'))),
              child: Text('Rooms'),
            ),

          ],
        ),
      ),

    );
  }
}

typedef ActivityEntry = DropdownMenuEntry<Activity>;
enum Activity {
  art('Art', 'assets/art.jpeg'),
  cooking('Cooking', 'assets/cooking.jpeg'),
  goo('Goo', 'assets/goo.jpeg'),
  outdoors('Outdoors', 'assets/outdoors.jpeg'),
  parachute('Parachute','assets/Parachute.jpeg'),
  seesaw('Seesaw','assets/seesaw.jpeg'),
  sports('Sports', 'assets/sports.jpeg'),
  stories('Stories', 'assets/stories.jpeg'),
  technology('Technology', 'assets/technology.jpeg');

  const Activity(this.text, this.image);
  final String text;
  final String image;

  static final List<ActivityEntry> entries = UnmodifiableListView<ActivityEntry>(
    values.map<ActivityEntry>(
      (Activity activity) => ActivityEntry(value: activity, label: activity.text),
    ),
  );
}

class InformationTruck
{
  InformationTruck();

  Activity act1 = Activity.art;
  Activity act2 = Activity.sports;
  Activity act3 = Activity.stories;
  Activity act4 = Activity.outdoors;
  Activity act5 = Activity.cooking;
  Activity act6 = Activity.technology;

  String? act1Text; 
  String? act2Text; 
  String? act3Text; 
  String? act4Text; 
  String? act5Text; 
  String? act6Text; 

}

class ActivityEditor extends StatefulWidget {
  const ActivityEditor({super.key, required this.title});

  final String title;

  @override
  State<ActivityEditor> createState() => _ActivityEditorState();
}

class ActivityField extends StatelessWidget
{
  const ActivityField({super.key, required this.id, required this.truck, this.initial=Activity.art});

  final int id;
  final InformationTruck truck;
  final Activity initial;

  void dropdownUpdateTruck(Activity selected)
  {
    id==1?
    {
      truck.act1=selected,
      truck.act1Text = null,
    }:id==2?
    {
      truck.act2=selected,
      truck.act2Text = null,
    }:id==3?
    {
      truck.act3=selected,
      truck.act3Text = null,
    }:id==4?
    {
      truck.act4=selected,
      truck.act4Text = null,
    }:id==5?
    {
      truck.act5=selected,
      truck.act5Text = null,
    }:
    {
      truck.act6=selected,
      truck.act6Text = null,
    };
  }

  void textfieldUpdateTruck (String val)
  {
    id==1?
    {
      truck.act1Text = val
    }:id==2?
    {
      truck.act2Text = val
    }:id==3?
    {
      truck.act3Text = val
    }:id==4?
    {
      truck.act4Text = val
    }:id==5?
    {
      truck.act5Text = val
    }:
    {
      truck.act6Text = val
    };
  }

  @override
  Widget build(BuildContext context)
  {
    return Column(
      children: [
        DropdownMenu<Activity>(
          initialSelection: initial,
          dropdownMenuEntries: Activity.entries, 
          onSelected: (selected) => dropdownUpdateTruck(selected!)
        ),
        SizedBox(
          width: 100,
          child: TextField( 
            controller: TextEditingController(),
            decoration: InputDecoration(
              counterText: '',
              label: Text('Override Text'),
            ),
            onSubmitted: (value) => textfieldUpdateTruck(value),
          ),
        ),
      ],
    );
  }
}

class _ActivityEditorState extends State<ActivityEditor> 
{
  InformationTruck truck = InformationTruck();

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          children: <Widget>[
            Text('Select Activities:'),
            Row(
              children: [
                Spacer(),
                Column(
                  spacing: 10,
                  children: [
                    Text('First Morning Activity:'),
                    ActivityField(id: 1, truck: truck, initial: Activity.art,),
                    Text('First Afternoon Activity:'),
                    ActivityField(id: 4, truck: truck, initial: Activity.outdoors,),
                  ],
                ),
                Spacer(),
                Column(
                  spacing: 10,
                  children: [
                    Text('Second Morning Activity:'),
                    ActivityField(id: 2, truck: truck, initial: Activity.sports,),
                    Text('Second Afternoon Activity:'),
                    ActivityField(id: 5, truck: truck, initial: Activity.cooking,),
                  ],
                ),
                Spacer(),
                Column(
                  spacing: 10,
                  children: [
                    Text('Third Morning Activity:'),
                    ActivityField(id: 3, truck: truck, initial: Activity.stories,),
                    Text('Third Afternoon Activity:'),
                    ActivityField(id: 6, truck: truck, initial: Activity.technology,),
                  ],
                ),
                Spacer(),
              ],
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ActivityDisplay(title: 'ActivityDisplay (REMOVE THE APPBAR ON THIS SCREEN)', truck: truck,))),
              child: Text('Run Selection'))
          ],
        ),
      ),

    );
  }
}

class ActivityDisplay extends StatefulWidget {
  const ActivityDisplay({super.key, required this.title, required this.truck,});

  final String title;
  final InformationTruck truck;


  @override
  State<ActivityDisplay> createState() => _ActivityDisplayState();
}

class _ActivityDisplayState extends State<ActivityDisplay> {

  DateTime now = DateTime.now();

  get isAfternoon
  {
    return now.hour>=12 ? true : false;
  }

  @override
  Widget build(BuildContext context) 
  {
    String convertedDateTime = "${now.weekday==1? "Monday ": now.weekday==2? "Tuesday ": now.weekday==3? "Wednesday ": now.weekday==4? "Thursday ": now.weekday==5? "Friday ":"Its the weekend why are you here? "
    }${now.day.toString()}/${now.month.toString().padLeft(2,'0')}/${now.year.toString().padLeft(2,'0')}";

    if (!isAfternoon)
    {
      DateTime noon = DateTime(now.year,  now.month, now.day, 12);
      Duration tillNoon = now.difference(noon);

      Timer(Duration(seconds: tillNoon.inSeconds), (){
        if (mounted)
        {
          setState(() {
            now = DateTime.now();
            isAfternoon;
          });
        }
      });
    }
    

    return Scaffold(
      appBar: AppBar(title: Text(widget.title),),
      body: Center(
        child: Column(
          children: [
            Text(convertedDateTime),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: !isAfternoon? <Widget>[
                Spacer(),
                Column(
                  children: [
                    Image.asset(widget.truck.act1.image),
                    Text(widget.truck.act1Text==null? widget.truck.act1.text : widget.truck.act1Text!),
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    Image.asset(widget.truck.act2.image),
                    Text(widget.truck.act2Text==null? widget.truck.act2.text : widget.truck.act2Text!),
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    Image.asset(widget.truck.act3.image),
                    Text(widget.truck.act3Text==null? widget.truck.act3.text : widget.truck.act3Text!),
                  ],
                ),
                Spacer(),
              ]
              : <Widget>[
                Spacer(),
                Column(
                  children: [
                    Image.asset(widget.truck.act4.image),
                    Text(widget.truck.act4Text==null? widget.truck.act4.text : widget.truck.act4Text!),
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    Image.asset(widget.truck.act5.image),
                    Text(widget.truck.act5Text==null? widget.truck.act5.text : widget.truck.act5Text!),
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    Image.asset(widget.truck.act6.image),
                    Text(widget.truck.act6Text==null? widget.truck.act6.text : widget.truck.act6Text!),
                  ],
                ),
                Spacer(),
              ],

            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

class Rooms extends StatefulWidget {
  const Rooms({super.key, required this.title});

  final String title;

  @override
  State<Rooms> createState() => _RoomsState();
}

class _RoomsState extends State<Rooms> {

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Rooms screen'),
          ],
        ),
      ),

    );
  }
}
