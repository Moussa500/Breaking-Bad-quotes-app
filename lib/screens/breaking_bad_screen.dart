import 'dart:convert';

import 'package:breakingbad_application/models/character.dart';
import 'package:breakingbad_application/service/character_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BreakingBadScreen extends StatefulWidget {
  const BreakingBadScreen({super.key});

  @override
  State<BreakingBadScreen> createState() => _BreakingBadScreenState();
}

class _BreakingBadScreenState extends State<BreakingBadScreen> {
  List<Character> characterList = <Character>[];
  void getCharacterFromApi() async {
    CharacterApi.getCharacters().then((response) {
      setState(() {
        Iterable list = jsonDecode(response.body);
        characterList = list.map((model) => Character.fromJson(model)).toList();
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCharacterFromApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: ()=>getCharacterFromApi(),child: const Icon(Icons.refresh),),
      appBar: AppBar(title: const Text('Breaking bad quotes app'),centerTitle: true,),
        body: SizedBox(
      child: ListView.builder(
        itemCount: characterList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(characterList[index].quote,style: const TextStyle(fontWeight: FontWeight.bold),),
            subtitle: Text(characterList[index].author),
          );
        },
      ),
    ));
  }
}
