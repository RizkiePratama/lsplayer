import 'package:flutter/material.dart';
import 'package:lsplayer/playback.dart';

void main() {
  runApp(const LSPlayerApp());
}

class LSPlayerApp extends StatelessWidget {
  const LSPlayerApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LS Player',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const LSPlayerLanding(),
    );
  }
}

class LSPlayerLanding extends StatefulWidget {
  const LSPlayerLanding({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<LSPlayerLanding> createState() => _LSPlayerLandingState();
}

class _LSPlayerLandingState extends State<LSPlayerLanding> {
  void beforeConnect(String playbackURL) {

  }

  final pURLFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text ("LS Player Beta"),
      ),
      body: Container(
        margin: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 5.0, bottom: 10.0),
              child: Text(
                "Quick Play",
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),
              )
            ),
            TextField(
              controller: pURLFieldController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Playback URL',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PlaybackPage(playback_url: pURLFieldController.text)),
                );
              },
              child: const Text('Connect'),
            ),
            Padding(
                padding: EdgeInsets.only(top: 25.0, bottom: 10.0),
                child: Text(
                  "Recently Played",
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                )
            ),
            Column(
              children: <Widget> [
                Center(
                  child: Text("No History Yet"),
                )
              ],
            )
          ]
        ),
      )
    );
  }
}
