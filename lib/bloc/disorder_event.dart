import 'package:flutter/material.dart';

abstract class DisorderEvent {}

class LoadDisordersEvent extends DisorderEvent {
  final BuildContext context;
  LoadDisordersEvent(this.context);
}

class SelectDisorderEvent extends DisorderEvent {
  final String disorderId;
  SelectDisorderEvent(this.disorderId);
}

class NextStepEvent extends DisorderEvent {}

class PreviousStepEvent extends DisorderEvent {}