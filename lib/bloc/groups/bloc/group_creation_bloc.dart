// lib/bloc/group_creation/group_creation_bloc.dart

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:campusbook/bloc/groups/bloc/group_creation_event.dart';
import 'package:campusbook/bloc/groups/bloc/group_creation_state.dart';
import 'package:campusbook/models/participant.dart';

class GroupCreationBloc extends Bloc<GroupCreationEvent, GroupCreationState> {
  List<Participant> selectedParticipants = [];

  GroupCreationBloc() : super(GroupCreationInitialState());

  @override
  Stream<GroupCreationState> mapEventToState(
    GroupCreationEvent event,
  ) async* {
    if (event is SelectParticipantEvent) {
      selectedParticipants.add(event.participant);
      yield ParticipantsSelectedState(
          selectedParticipants: selectedParticipants);
    } else if (event is DeselectParticipantEvent) {
      selectedParticipants.remove(event.participant);
      yield ParticipantsSelectedState(
          selectedParticipants: selectedParticipants);
    } else if (event is CreateGroupEvent) {
      // Implement logic to create the group in your data storage
      yield GroupCreatedState(groupSubject: event.groupSubject);
    }
  }
}
