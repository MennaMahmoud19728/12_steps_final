class Disorder {
  final String id;
  final String name;
  final List<RecoveryStep> steps;

  Disorder({required this.id, required this.name, required this.steps});

  factory Disorder.fromJson(Map<String, dynamic> json) {
    return Disorder(
      id: json['id'],
      name: json['name']['en'], // Changed to 'en'
      steps: (json['steps'] as List)
          .map((step) => RecoveryStep.fromJson(step))
          .toList(),
    );
  }
}

class RecoveryStep {
  final String id;
  final int stepNumber;
  final String description;
  final String relevance;
  final List<String> practicalSuggestions;

  RecoveryStep({
    required this.id,
    required this.stepNumber,
    required this.description,
    required this.relevance,
    required this.practicalSuggestions,
  });

  factory RecoveryStep.fromJson(Map<String, dynamic> json) {
    return RecoveryStep(
      id: json['id'],
      stepNumber: json['step_number'],
      description: json['description']['en'], // Changed to 'en'
      relevance: json['relevance']['en'], // Changed to 'en'
      practicalSuggestions: (json['practical_suggestions']['en'] as List)
          .cast<String>(),
    );
  }
}