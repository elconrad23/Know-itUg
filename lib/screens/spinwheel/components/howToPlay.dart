import 'package:flutter/material.dart';
import '../../../knowit_exporter.dart';

class Instructions extends StatefulWidget {
  const Instructions({super.key});

  @override
  State<Instructions> createState() => _InstructionsState();
}

class _InstructionsState extends State<Instructions> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar:AppBar(
          title: const Text(
            'How to Play!',
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.of(context).pop(),
          ),
          automaticallyImplyLeading: true,
        ),
        body: ListView(
        children: const [
          ListTile(
            title: Text("Play the puzzle"),
            leading: Icon(Icons.text_fields_outlined),
            trailing: Icon(Icons.chevron_right_sharp),
            subtitle: Text(""),
          
          ),        
          SizedBox(
            height: 15,
          ),
          ListTile(
            title: Text("Move to next round"),
            leading: Icon(Icons.text_fields_outlined),
            trailing: Icon(Icons.chevron_right_sharp),
            subtitle: Text(""),
          ), 
        ],
      ),
    );
  }
}