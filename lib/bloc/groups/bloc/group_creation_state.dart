// lib/bloc/group_creation/group_creation_state.dart

import 'package:equatable/equatable.dart';
import 'package:campusbook/models/participant.dart';

abstract class GroupCreationState extends Equatable {
  const GroupCreationState();

  @override
  List<Object?> get props => [];
}

class GroupCreationInitialState extends GroupCreationState {}

class ParticipantsSelectedState extends GroupCreationState {
  final List<Participant> selectedParticipants;

  ParticipantsSelectedState({required this.selectedParticipants});

  @override
  List<Object?> get props => [selectedParticipants];
}

class GroupCreatedState extends GroupCreationState {
  final String groupSubject;

  GroupCreatedState({required this.groupSubject});

  @override
  List<Object?> get props => [groupSubject];
}
