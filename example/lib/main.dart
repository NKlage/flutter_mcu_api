import 'package:example/pages/character_page.dart';
import 'package:example/pages/comic_page.dart';
import 'package:example/pages/creator_page.dart';
import 'package:example/pages/events_page.dart';
import 'package:example/pages/series_page.dart';
import 'package:example/pages/stories_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_marvel_api/flutter_marvel_api.dart';

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

  late MarvelApi _marvelApi;
  // set your api keys here
  final String publicApiKey = const String.fromEnvironment('publicKey');
  final String privateApiKey = const String.fromEnvironment('privateKey');

  _HomePageState();

  @override
  void initState() {
    super.initState();
    _marvelApi = MarvelApi(
      publicApiKey: publicApiKey, // use your own public key
      privateApiKey: privateApiKey, // use your own private key
    );
  }

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
        children: [
          CharacterPage(
            marvelApi: _marvelApi,
          ),
          ComicPage(marvelApi: _marvelApi),
          CreatorPage(marvelApi: _marvelApi),
          EventsPage(marvelApi: _marvelApi),
          SeriesPage(marvelApi: _marvelApi),
          StoriesPage(marvelApi: _marvelApi),
        ],
      ),
    );
  }
}
