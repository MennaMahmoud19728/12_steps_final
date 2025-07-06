import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:convert';
import '../models/disorder_model.dart';
import 'disorder_event.dart';
import 'disorder_state.dart';

class DisorderBloc extends Bloc<DisorderEvent, DisorderState> {
  DisorderBloc() : super(DisorderInitial()) {
    on<LoadDisordersEvent>(_onLoadDisorders);
    on<SelectDisorderEvent>(_onSelectDisorder);
    on<NextStepEvent>(_onNextStep);
    on<PreviousStepEvent>(_onPreviousStep);
  }

  Future<void> _onLoadDisorders(
      LoadDisordersEvent event, Emitter<DisorderState> emit) async {
    try {
      final context = event.context;
      final jsonString =
      await DefaultAssetBundle.of(context).loadString('assets/12_steps.json');
      final data = jsonDecode(jsonString);
      final disorders = (data['disorders'] as List)
          .map((disorder) => Disorder.fromJson(disorder))
          .toList();
      emit(DisorderLoaded(
        disorders: disorders,
        selectedDisorder: null,
        currentStepIndex: 0,
      ));
    } catch (e) {
      emit(DisorderError('Failed to load data: $e'));
    }
  }

  void _onSelectDisorder(SelectDisorderEvent event, Emitter<DisorderState> emit) {
    if (state is DisorderLoaded) {
      final currentState = state as DisorderLoaded;
      final selectedDisorder = currentState.disorders
          .firstWhere((disorder) => disorder.id == event.disorderId);
      emit(DisorderLoaded(
        disorders: currentState.disorders,
        selectedDisorder: selectedDisorder,
        currentStepIndex: 0,
      ));
    }
  }

  void _onNextStep(NextStepEvent event, Emitter<DisorderState> emit) {
    if (state is DisorderLoaded) {
      final currentState = state as DisorderLoaded;
      if (currentState.selectedDisorder != null &&
          currentState.currentStepIndex <
              currentState.selectedDisorder!.steps.length - 1) {
        emit(DisorderLoaded(
          disorders: currentState.disorders,
          selectedDisorder: currentState.selectedDisorder,
          currentStepIndex: currentState.currentStepIndex + 1,
        ));
      }
    }
  }

  void _onPreviousStep(PreviousStepEvent event, Emitter<DisorderState> emit) {
    if (state is DisorderLoaded) {
      final currentState = state as DisorderLoaded;
      if (currentState.currentStepIndex > 0) {
        emit(DisorderLoaded(
          disorders: currentState.disorders,
          selectedDisorder: currentState.selectedDisorder,
          currentStepIndex: currentState.currentStepIndex - 1,
        ));
      }
    }
  }
}