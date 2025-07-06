import '../models/disorder_model.dart';

abstract class DisorderState {}

class DisorderInitial extends DisorderState {}

class DisorderLoaded extends DisorderState {
  final List<Disorder> disorders;
  final Disorder? selectedDisorder;
  final int currentStepIndex;

  DisorderLoaded({
    required this.disorders,
    required this.selectedDisorder,
    required this.currentStepIndex,
  });
}

class DisorderError extends DisorderState {
  final String message;
  DisorderError(this.message);
}