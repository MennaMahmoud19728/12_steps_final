import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/disorder_bloc.dart';
import '../bloc/disorder_event.dart';
import '../bloc/disorder_state.dart';
import '../models/disorder_model.dart';

class StepsViewModel {
  final BuildContext context;

  StepsViewModel(this.context);

  Disorder? get selectedDisorder {
    final state = context.read<DisorderBloc>().state;
    if (state is DisorderLoaded) {
      return state.selectedDisorder;
    }
    return null;
  }

  RecoveryStep? get currentStep {
    final state = context.read<DisorderBloc>().state;
    if (state is DisorderLoaded && state.selectedDisorder != null) {
      return state.selectedDisorder!.steps[state.currentStepIndex];
    }
    return null;
  }

  int get currentStepIndex {
    final state = context.read<DisorderBloc>().state;
    if (state is DisorderLoaded) {
      return state.currentStepIndex;
    }
    return 0;
  }

  bool get canGoNext {
    final state = context.read<DisorderBloc>().state;
    if (state is DisorderLoaded && state.selectedDisorder != null) {
      return state.currentStepIndex < state.selectedDisorder!.steps.length - 1;
    }
    return false;
  }

  bool get canGoPrevious {
    final state = context.read<DisorderBloc>().state;
    if (state is DisorderLoaded) {
      return state.currentStepIndex > 0;
    }
    return false;
  }

  void nextStep() {
    context.read<DisorderBloc>().add(NextStepEvent());
  }

  void previousStep() {
    context.read<DisorderBloc>().add(PreviousStepEvent());
  }
}