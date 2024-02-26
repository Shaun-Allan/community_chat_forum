import 'package:flutter/material.dart';


class AddCommunites extends StatefulWidget {
  @override
  _AddCommunitesState createState() => _AddCommunitesState();
}

class _AddCommunitesState extends State<AddCommunites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Join/Create Communities'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 40, 8.0, 0),
        child: Center(
          child: Column(
            children: [
              TextButton.icon(
                  onPressed: () {

                  },
                  icon: const Icon(Icons.join_right_rounded),
                  label: const Text('Join a Community')),
              const SizedBox(
                height: 20,
              ),
              TextButton.icon(
                  onPressed: () {

                  },
                  icon: const Icon(Icons.add),
                  label: const Text('Create a Commmunity')),
            ],
          ),
        ),
      ),
    );
  }
}
