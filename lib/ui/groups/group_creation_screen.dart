// lib/screens/group_creation_screen.dart

import 'package:campusbook/bloc/groups/bloc/group_creation_bloc.dart';
import 'package:campusbook/bloc/groups/bloc/group_creation_event.dart';
import 'package:campusbook/config/constants.dart';
import 'package:campusbook/config/global_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class GroupCreationScreen extends StatefulWidget {
  @override
  _GroupCreationScreenState createState() => _GroupCreationScreenState();
}

class _GroupCreationScreenState extends State<GroupCreationScreen> {
  final TextEditingController _groupSubjectController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      
        title: Text(
          ' campusbook',
          style: TextStyle(color: PRIMARY_COLOR),
          ),
        actions: [
          
          IconButton(
            onPressed: (){}, 
            icon:Icon(Icons.search),
            ),
          IconButton(
            onPressed: (){}, 
            icon: Icon(Icons.more_vert),
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _groupSubjectController,
              decoration: InputDecoration(labelText: 'Group Subject'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                context.read<GroupCreationBloc>().add(
                      CreateGroupEvent(groupSubject: _groupSubjectController.text),
                    );
              },
              child: Text('Create Group'),
            ),
          ],
        ),
      ),
    );
  }
}
