import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/disorder_bloc.dart';
import '../bloc/disorder_state.dart';
import '../view_models/home_view_model.dart';
import 'steps_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = HomeViewModel(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Recovery Guide'),
        centerTitle: true,
      ),
      body: BlocBuilder<DisorderBloc, DisorderState>(
        builder: (context, state) {
          if (state is DisorderInitial) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is DisorderLoaded) {
            final disorders = viewModel.disorders;
            return Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'What is your diagnosis?',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff457B9D),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: DropdownButton<String>(
                      isExpanded: true,
                      hint: const Text('Select a disorder'),
                      value: null,
                      items: disorders.map((disorder) {
                        return DropdownMenuItem<String>(
                          value: disorder.id,
                          child: Text(disorder.name),
                        );
                      }).toList(),
                      onChanged: (value) {
                        viewModel.selectDisorder(value);
                        if (value != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const StepsScreen(),
                            ),
                          );
                        }
                      },
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                      underline: const SizedBox(),
                    ),
                  ),
                ],
              ),
            );
          } else if (state is DisorderError) {
            return Center(child: Text(state.message));
          }
          return const Center(child: Text('Error loading data'));
        },
      ),
    );
  }
}