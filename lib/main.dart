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

  Activity act1 = Activity.a;
  Activity act2 = Activity.a;
  Activity act3 = Activity.a;
  Activity act4 = Activity.a;
  Activity act5 = Activity.a;
  Activity act6 = Activity.a;

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
                      initialSelection: Activity.a,
                      dropdownMenuEntries: Activity.entries, 
                      onSelected: (object) => act1=object!
                    ),
                    Text('First Afternoon Activity:'),
                    DropdownMenu<Activity>(
                      initialSelection: Activity.a,
                      dropdownMenuEntries: Activity.entries, 
                      onSelected: (object) => act4=object!
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  spacing: 10,
                  children: [
                    Text('Second Morning Activity:'),
                    DropdownMenu<Activity>(
                      initialSelection: Activity.a,
                      dropdownMenuEntries: Activity.entries, 
                      onSelected: (object) => act2=object!
                    ),
                    Text('Second Afternoon Activity:'),
                    DropdownMenu<Activity>(
                      initialSelection: Activity.a,
                      dropdownMenuEntries: Activity.entries, 
                      onSelected: (object) => act5=object!
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  spacing: 10,
                  children: [
                    Text('Third Morning Activity:'),
                    DropdownMenu<Activity>(
                      initialSelection: Activity.a,
                      dropdownMenuEntries: Activity.entries, 
                      onSelected: (object) => act3=object!
                    ),
                    Text('Third Afternoon Activity:'),
                    DropdownMenu<Activity>(
                      initialSelection: Activity.a,
                      dropdownMenuEntries: Activity.entries, 
                      onSelected: (object) => act6=object!
                    ),
                  ],
                ),
                Spacer(),
              ],
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ActivityDisplay(title: 'ActivityDisplay (REMOVE THE APPBAR ON THIS SCREEN)', act1: act1, act2: act2, act3: act3, act4: act4, act5: act5, act6: act6,))),
              child: Text('Run Selection'))
          ],
        ),
      ),

    );
  }
}

class ActivityDisplay extends StatefulWidget {
  const ActivityDisplay({super.key, required this.title, required this.act1, required this.act2, required this.act3, required this.act4, required this.act5,required this.act6,});

  final String title;
  final Activity act1;
  final Activity act2;
  final Activity act3;
  final Activity act4;
  final Activity act5;
  final Activity act6;

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
                    Image.asset(widget.act1.image),
                    Text(widget.act1.text),
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    Image.asset(widget.act2.image),
                    Text(widget.act2.text),
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    Image.asset(widget.act3.image),
                    Text(widget.act3.text),
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
