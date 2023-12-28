// lib/screens/participants_screen.dart

import 'package:campusbook/bloc/groups/bloc/group_creation_bloc.dart';
import 'package:campusbook/bloc/groups/bloc/group_creation_event.dart';
import 'package:campusbook/bloc/groups/bloc/group_creation_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:campusbook/models/participant.dart';

class ParticipantsScreen extends StatelessWidget {
  final List<Participant> participants = [
    Participant(id: '1', name: 'User 1'),
    Participant(id: '2', name: 'User 2'),
    // Add more participants as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Participants'),
      ),
      body: BlocConsumer<GroupCreationBloc, GroupCreationState>(
        listener: (context, state) {
          // Implement any listeners if needed
        },
        builder: (context, state) {
          return ListView.builder(
            itemCount: participants.length,
            itemBuilder: (context, index) {
              final participant = participants[index];
              final isSelected = state is ParticipantsSelectedState &&
                  state.selectedParticipants.contains(participant);

              return ListTile(
                title: Text(participant.name),
                trailing: isSelected
                    ? Icon(Icons.check, color: Colors.green)
                    : null,
                onTap: () {
                  if (isSelected) {
                    context.read<GroupCreationBloc>().add(
                          DeselectParticipantEvent(participant: participant),
                        );
                  } else {
                    context.read<GroupCreationBloc>().add(
                          SelectParticipantEvent(participant: participant),
                        );
                  }
                },
              );
            },
          );
        },
      ),
    );
  }
}
