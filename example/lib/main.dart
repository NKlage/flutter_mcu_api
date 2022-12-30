import 'package:example/pages/character_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MCU Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentViewIndex = 0;

  void setIndex(int index) {
    setState(() {
      currentViewIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('MCU Heros'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0.0),
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: Center(
                  child: Text(
                'Marvel API Demo',
                style: textTheme.headlineSmall,
              )),
            ),
            ListTile(
              title: const Text('Characters'),
              onTap: () {
                setIndex(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Comics'),
              onTap: () {
                setIndex(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Creators'),
              onTap: () {
                setIndex(2);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Events'),
              onTap: () {
                setIndex(3);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Series'),
              onTap: () {
                setIndex(4);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Stories'),
              onTap: () {
                setIndex(5);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: IndexedStack(
        index: currentViewIndex,
        children: const [
          CharacterPage(),
          Text('Comics'),
          Text('Creators'),
          Text('Events'),
          Text('Series'),
          Text('Stories'),
        ],
      ),
    );
  }
}
