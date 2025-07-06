import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/disorder_bloc.dart';
import '../bloc/disorder_event.dart';
import '../bloc/disorder_state.dart';
import '../models/disorder_model.dart';

class HomeViewModel {
  final BuildContext context;

  HomeViewModel(this.context);

  List<Disorder> get disorders {
    final state = context.read<DisorderBloc>().state;
    if (state is DisorderLoaded) {
      return state.disorders;
    }
    return [];
  }

  void selectDisorder(String? disorderId) {
    if (disorderId != null) {
      context.read<DisorderBloc>().add(SelectDisorderEvent(disorderId));
    }
  }
}