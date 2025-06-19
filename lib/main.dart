import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


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
                    DropdownMenu<Activity>(
                      initialSelection: Activity.art,
                      dropdownMenuEntries: Activity.entries, 
                      onSelected: (object) => 
                      {
                        truck.act1=object!,
                        truck.act1Text = null,
                      }
                    ),
                    SizedBox(
                      width: 100,
                      child: TextField( 
                        controller: TextEditingController(),
                        decoration: InputDecoration(
                          counterText: '',
                          label: Text('Override Text'),
                        ),
                        onSubmitted: (String value)
                        {
                          truck.act1Text = value;
                        },
                      ),
                    ),
                    Text('First Afternoon Activity:'),
                    DropdownMenu<Activity>(
                      initialSelection: Activity.outdoors,
                      dropdownMenuEntries: Activity.entries, 
                      onSelected: (object) => truck.act4=object!
                    ),
                    SizedBox(
                      width: 100,
                      child: TextField( 
                        controller: TextEditingController(),
                        decoration: InputDecoration(
                          counterText: '',
                          label: Text('Override Text'),
                        ),
                        onSubmitted: (String value)
                        {
                          truck.act4Text = value;
                        },
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  spacing: 10,
                  children: [
                    Text('Second Morning Activity:'),
                    DropdownMenu<Activity>(
                      initialSelection: Activity.sports,
                      dropdownMenuEntries: Activity.entries, 
                      onSelected: (object) => truck.act2=object!
                    ),
                    SizedBox(
                      width: 100,
                      child: TextField( 
                        controller: TextEditingController(),
                        decoration: InputDecoration(
                          counterText: '',
                          label: Text('Override Text'),
                        ),
                        onSubmitted: (String value)
                        {
                          truck.act2Text = value;
                        },
                      ),
                    ),
                    Text('Second Afternoon Activity:'),
                    DropdownMenu<Activity>(
                      initialSelection: Activity.cooking,
                      dropdownMenuEntries: Activity.entries, 
                      onSelected: (object) => truck.act5=object!
                    ),
                    SizedBox(
                      width: 100,
                      child: TextField( 
                        controller: TextEditingController(),
                        decoration: InputDecoration(
                          counterText: '',
                          label: Text('Override Text'),
                        ),
                        onSubmitted: (String value)
                        {
                          truck.act5Text = value;
                        },
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  spacing: 10,
                  children: [
                    Text('Third Morning Activity:'),
                    DropdownMenu<Activity>(
                      initialSelection: Activity.stories,
                      dropdownMenuEntries: Activity.entries, 
                      onSelected: (object) => truck.act3=object!
                    ),
                    SizedBox(
                      width: 100,
                      child: TextField( 
                        controller: TextEditingController(),
                        decoration: InputDecoration(
                          counterText: '',
                          label: Text('Override Text'),
                        ),
                        onSubmitted: (String value)
                        {
                          truck.act3Text = value;
                        },
                      ),
                    ),
                    Text('Third Afternoon Activity:'),
                    DropdownMenu<Activity>(
                      initialSelection: Activity.technology,
                      dropdownMenuEntries: Activity.entries, 
                      onSelected: (object) => truck.act6=object!
                    ),
                    SizedBox(
                      width: 100,
                      child: TextField( 
                        controller: TextEditingController(),
                        decoration: InputDecoration(
                          counterText: '',
                          label: Text('Override Text'),
                        ),
                        onSubmitted: (String value)
                        {
                          truck.act6Text = value;
                        },
                      ),
                    ),
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

  @override
  Widget build(BuildContext context) 
  {
    DateTime now = DateTime.now();
    String convertedDateTime = "${now.weekday==1? "Monday ": now.weekday==2? "Tuesday ": now.weekday==3? "Wednesday ": now.weekday==4? "Thursday ": now.weekday==5? "Friday ":"Its the weekend why are you here? "
    }${now.day.toString()}/${now.month.toString().padLeft(2,'0')}/${now.year.toString().padLeft(2,'0')}";

    return Scaffold(
      appBar: AppBar(title: Text(widget.title),),
      body: Center(
        child: Column(
          children: [
            Text(convertedDateTime),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
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
                    Text(widget.truck.act2.text),
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    Image.asset(widget.truck.act3.image),
                    Text(widget.truck.act3.text),
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
