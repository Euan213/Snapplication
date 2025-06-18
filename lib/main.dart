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
  a('Option A', 'assets/placeholder.jpg'),
  b('Option B', 'assets/b.jpg'),
  c('Option C', 'assets/c.jpg');

  const Activity(this.text, this.image);
  final String text;
  final String image;

  static final List<ActivityEntry> entries = UnmodifiableListView<ActivityEntry>(
    values.map<ActivityEntry>(
      (Activity activity) => ActivityEntry(value: activity, label: activity.text),
    ),
  );
}

class ActivityEditor extends StatefulWidget {
  ActivityEditor({super.key, required this.title});

  final String title;
  final List<DropdownMenuItem> activities = [];

  @override
  State<ActivityEditor> createState() => _ActivityEditorState();
}

class _ActivityEditorState extends State<ActivityEditor> {

  Activity morning = Activity.a;
  Activity lunch = Activity.a;
  Activity afternoon = Activity.a;

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
          children: <Widget>[
            Text('Select Activities:'),
            Row(
              children: [
                Spacer(),
                Text('Morning'),
                Spacer(),
                Text('Midday'),
                Spacer(),
                Text('Afternoon'),
                Spacer(),
              ],
            ),
            Row(
              children: [
                Spacer(),
                DropdownMenu<Activity>(
                  initialSelection: Activity.a,
                  dropdownMenuEntries: Activity.entries, 
                  onSelected: (object) => morning=object!
                ),
                Spacer(),
                DropdownMenu<Activity>(
                  initialSelection: Activity.a,
                  dropdownMenuEntries: Activity.entries, 
                  onSelected: (object) => lunch=object!
                ),
                Spacer(),
                DropdownMenu<Activity>(
                  initialSelection: Activity.a,
                  dropdownMenuEntries: Activity.entries, 
                  onSelected: (object) => afternoon=object!
                ),
                Spacer(),
              ],
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ActivityDisplay(title: 'ActivityDisplay (REMOVE THE APPBAR ON THIS SCREEN)', morning: morning, lunch: lunch, afternoon: afternoon,))),
              // onPressed: () => print('${morning.image}, ${lunch.image}, ${afternoon.image}'),
              child: Text('Run Selection'))
          ],
        ),
      ),

    );
  }
}

class ActivityDisplay extends StatefulWidget {
  const ActivityDisplay({super.key, required this.title, required this.morning, required this.lunch, required this.afternoon});

  final String title;
  final Activity morning;
  final Activity lunch;
  final Activity afternoon;

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
                    Image.asset(widget.morning.image),
                    Text(widget.morning.text),
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    Image.asset(widget.lunch.image),
                    Text(widget.lunch.text),
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    Image.asset(widget.afternoon.image),
                    Text(widget.afternoon.text),
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
