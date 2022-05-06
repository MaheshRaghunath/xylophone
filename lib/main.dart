import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(xyloPhone());
}

class xyloPhone extends StatefulWidget {
  const xyloPhone({Key? key}) : super(key: key);

  @override
  State<xyloPhone> createState() => _xyloPhoneState();
}

class _xyloPhoneState extends State<xyloPhone> {
  @override
  Widget build(BuildContext context) {
    void changeAudio(int fileNumber) {
      AudioCache player = AudioCache();
      player.play('note$fileNumber.wav');
    }

    Card buildKey({int fileNumber = 0, dynamic color}) {
      return Card(
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
        child: Expanded(
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: color,
              padding: const EdgeInsets.symmetric(vertical: 30.0),
            ),
            onPressed: () {
              changeAudio(fileNumber);
            },
            child: Text(
              '[F-$fileNumber]',
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      );
    }

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey[800],
        appBar: AppBar(
          backgroundColor: Colors.black12,
          title: const Text('Xylophone'),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(fileNumber: 1, color: Colors.pink),
              buildKey(fileNumber: 2, color: Colors.blue),
              buildKey(fileNumber: 3, color: Colors.purple),
              buildKey(fileNumber: 4, color: Colors.teal),
              buildKey(fileNumber: 5, color: Colors.blueGrey),
              buildKey(fileNumber: 6, color: Colors.black54),
              buildKey(fileNumber: 7, color: Colors.orange),
            ],
          ),
        ),
      ),
    );
  }
}
