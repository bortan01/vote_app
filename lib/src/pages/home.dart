import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/band.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Band> bands = [
    Band(id: '1', idrequest: 5, name: 'Real Madrid', votes: 34),
    Band(id: '2', idrequest: 5, name: 'Barcelona', votes: 11),
    Band(id: '3', idrequest: 5, name: 'PSG', votes: 10),
    Band(id: '4', idrequest: 5, name: 'Manchester City', votes: 33),
    Band(id: '5', idrequest: 5, name: 'Bayer', votes: 22),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: const Text(
          'Best Futbol Club',
          style: TextStyle(
            color: Colors.black87,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: bands.length,
        itemBuilder: (_, i) => BandTile(
          band: bands[i],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 1,
        onPressed: addNewBand,
        child: const Icon(Icons.add),
      ),
    );
  }

  void addNewBand() {
    final textController = TextEditingController();
    if (Platform.isAndroid) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('New Band Name'),
            content: TextField(
              controller: textController,
            ),
            actions: [
              MaterialButton(
                onPressed: () => addBandToList(textController.text),
                elevation: 5,
                textColor: Colors.blue,
                child: const Text('Add'),
              )
            ],
          );
        },
      );
      return;
    }
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text('new Band name'),
          content: CupertinoTextField(
            controller: textController,
          ),
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              child: const Text('Add'),
              onPressed: () => addBandToList(textController.text),
            ),
            CupertinoDialogAction(
              isDestructiveAction: true,
              child: const Text('Close'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
  }

  void addBandToList(String name) {
    if (name.length > 1) {
      bands.add(Band(id: '22', idrequest: 22, name: name, votes: 31));
      setState(() {});
    }
    Navigator.pop(context);
  }
}

class BandTile extends StatelessWidget {
  const BandTile({
    Key? key,
    required this.band,
  }) : super(key: key);

  final Band band;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(band.id),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction) {
        
      },
      background: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        alignment: Alignment.centerLeft,
        color: Colors.red,
        child: const Text(
          'Delete band',
          style: TextStyle(color: Colors.white),
        ),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue[100],
          child: Text(band.name.substring(0, 2)),
        ),
        title: Text(band.name),
        trailing: Text('${band.votes}', style: const TextStyle(fontSize: 20)),
        onTap: () => print(band.name),
      ),
    );
  }
}
