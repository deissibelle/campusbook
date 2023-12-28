// lib/bloc/group_creation/group_creation_event.dart

// ignore_for_file: override_on_non_overriding_member

import 'package:campusbook/models/participant.dart';
import 'package:equatable/equatable.dart';

abstract class GroupCreationEvent extends Equatable {
  const GroupCreationEvent();

  @override
  List<Object?> get props => [];
}

class SelectParticipantEvent extends GroupCreationEvent {
  final Participant participant;

  SelectParticipantEvent({required this.participant});

  @override
  List<Object?> get props => [participant];
}

class DeselectParticipantEvent extends GroupCreationEvent {
  final Participant participant;

  DeselectParticipantEvent({required this.participant});

  @override
  List<Object?> get props => [participant];
}

class CreateGroupEvent extends GroupCreationEvent {
  final String groupSubject;

  CreateGroupEvent({required this.groupSubject});

  @override
  List<Object?> get props => [groupSubject];
}
