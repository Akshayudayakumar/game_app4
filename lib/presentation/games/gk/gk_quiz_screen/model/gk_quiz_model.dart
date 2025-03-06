class Question {
  final String questionText;
  final List<String> options;
  final int correctOptionIndex;

  Question({
    required this.questionText,
    required this.options,
    required this.correctOptionIndex,
  });

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      questionText: map['questionText'],
      options: List<String>.from(map['options']),
      correctOptionIndex: map['correctOptionIndex'],
    );
  }
}
