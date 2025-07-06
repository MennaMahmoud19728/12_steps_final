import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/disorder_bloc.dart';
import '../bloc/disorder_state.dart';
import '../view_models/steps_view_model.dart';

class StepsScreen extends StatelessWidget {
  const StepsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = StepsViewModel(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(viewModel.selectedDisorder?.name ?? 'Error'),
        centerTitle: true,
      ),
      body: BlocBuilder<DisorderBloc, DisorderState>(
        builder: (context, state) {
          if (state is DisorderLoaded) {
            final step = viewModel.currentStep;
            final disorder = viewModel.selectedDisorder;

            if (step == null || disorder == null) {
              return const Center(child: Text('Error loading data'));
            }

            return SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Step ${step.stepNumber}',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Description:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff457B9D),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        step.description,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Relevance:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff457B9D),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        step.relevance,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Practical Suggestions:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff457B9D),
                        ),
                      ),
                      const SizedBox(height: 8),
                      ...step.practicalSuggestions.map(
                            (suggestion) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                '• ',
                                style: TextStyle(fontSize: 16),
                              ),
                              Expanded(
                                child: Text(
                                  suggestion,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed:
                            viewModel.canGoPrevious ? viewModel.previousStep : null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: viewModel.canGoPrevious
                                  ? const Color(0xff457B9D)
                                  : Colors.grey,
                            ),
                            child: const Text('Previous Step'),
                          ),
                          ElevatedButton(
                            onPressed: viewModel.canGoNext ? viewModel.nextStep : null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: viewModel.canGoNext
                                  ? const Color(0xff457B9D)
                                  : Colors.grey,
                            ),
                            child: const Text('Next Step'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
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