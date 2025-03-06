import 'package:game_app/presentation/games/gk/gk_quiz_screen/model/gk_quiz_model.dart';

final Map<String, List<Map<String, dynamic>>> questionData = {
  "easy": [
    {
      "questionText": "Which sentence is grammatically correct?",
      "options": [
        "She do not like pizza",
        "She does not like pizza",
        "She do not likes pizza",
        "She is not liking pizza",
      ],
      "correctOptionIndex": 0
    },
    {
      "questionText": "Which word is a pronoun?",
      "options": [
        "Run",
        "Beautiful",
        "They",
        "Quickly",
      ],
      "correctOptionIndex": 2
    },
    {
      "questionText": "What is the correct form of the plural for 'child'?",
      "options": [
        "Childs",
        "Children",
        "Childers",
        "childer",
      ],
      "correctOptionIndex": 1
    },
    {
      "questionText":
          "Identify the conjunction in the following sentence: 'I wanted to go to the party, but I had to finish my homework.'",
      "options": [
        "wanted",
        "and",
        "but",
        "had",
      ],
      "correctOptionIndex": 1
    },
    {
      "questionText": "Which of the following is a preposition?",
      "options": [
        "Quickly",
        "Under",
        "Singing",
        "Happy",
      ],
      "correctOptionIndex": 0
    },
    {
      "questionText": "What is the comparative form of the adjective 'good'?",
      "options": [
        "Gooder",
        "Better",
        "Best",
        "Goodest",
      ],
      "correctOptionIndex": 1
    },
    {
      "questionText": "Which sentence is in the past tense?",
      "options": [
        "I am running.",
        "I will run.",
        "I run.",
        "I ran.",
      ],
      "correctOptionIndex": 3
    },
    {
      "questionText":
          "Choose the correct possessive form: 'The car belongs to Sarah and John.'",
      "options": [
        "Sarah's and John car",
        "Sarah's and John's car",
        "Sarah and John car",
        "Sarah and John's car",
      ],
      "correctOptionIndex": 1
    },
    {
      "questionText": "What is the antonym of 'vivid'?",
      "options": [
        "Dull",
        "Bright",
        "Colorful",
        "Vivacious",
      ],
      "correctOptionIndex": 0
    },
    {
      "questionText":
          "Identify the adverb in the following sentence: 'She sang beautifully.'",
      "options": [
        "She",
        "Beautifully",
        "Sang",
        "Song",
      ],
      "correctOptionIndex": 1
    },
  ],
  "medium": [
    {
      "questionText": "What is a synonym for 'happy'?",
      "options": [
        "Sad",
        "Joyful",
        "Angry",
        "Tired",
      ],
      "correctOptionIndex": 1
    },
    {
      "questionText": "Choose the synonym for 'abundant.'?",
      "options": [
        "Scarce",
        "Plentiful",
        "Limited",
        "Sparse",
      ],
      "correctOptionIndex": 1
    },
    {
      "questionText": "Which word is a synonym for 'brave'?",
      "options": [
        "Fearful",
        "Courageous",
        "Timid",
        "Shy",
      ],
      "correctOptionIndex": 1
    },
    {
      "questionText": "Identify the synonym for 'knowledge.'",
      "options": [
        "Wisdom",
        "Ignorance",
        "Confusion",
        "Stupidity",
      ],
      "correctOptionIndex": 0
    },
    {
      "questionText": "What is a synonym for 'celebrate'?",
      "options": [
        "Mourn",
        "Commemorate",
        "Lament",
        "Bemoan",
      ],
      "correctOptionIndex": 1
    },
    {
      "questionText": "Choose the correctly phrased sentence: ",
      "options": [
        "Between you and I, the decision was made.",
        "Between you and me, the decision was made.",
        "Between I and you, the decision was made.",
        "Between me and you, the decision was made.",
      ],
      "correctOptionIndex": 1
    },
    {
      "questionText": "What is the past participle form of the verb 'sing'?",
      "options": [
        "Singed",
        "Sang",
        "Sung",
        "Singing",
      ],
      "correctOptionIndex": 2
    },
    {
      "questionText": "Select the properly phrased sentence:",
      "options": [
        "I haven't never been to that city before.",
        "I haven't ever been to that city before.",
        "I never haven't been to that city before.",
        "I have never been to that city before.",
      ],
      "correctOptionIndex": 3
    },
    {
      "questionText": "Identify the correctly phrased sentence: ",
      "options": [
        "The dog quickly ran through the yard.",
        "Quickly the dog ran through the yard.",
        "The quickly dog ran through the yard.",
        "The dog ran quickly through the yard.",
      ],
      "correctOptionIndex": 3
    },
    {
      "questionText": "Choose the properly phrased sentence: ",
      "options": [
        "She sings good.",
        "She sings well.",
        "She sings goodly",
        "She sings gooder.",
      ],
      "correctOptionIndex": 1
    },
  ],
  "hard": [
    {
      "questionText":
          "Convert the sentence 'The cake was baked by Mary' to the active voice.",
      "options": [
        "Mary was baking the cake.",
        "Mary baked the cake.",
        "The cake baked Mary.",
        "Mary has been baking the cake.",
      ],
      "correctOptionIndex": 1
    },
    {
      "questionText":
          "Rewrite the sentence 'A story was told by the teacher' in the active voice.?",
      "options": [
        "The teacher telling a story.",
        "The teacher told a story.",
        "A story was telling the teacher.",
        "The teacher was telling a story.",
      ],
      "correctOptionIndex": 1
    },
    {
      "questionText":
          "Change the sentence 'The letter has been written by him' to the active voice.",
      "options": [
        "He has written the letter.",
        "He wrote the letter.",
        "The letter wrote him.",
        "Written by him is the letter.",
      ],
      "correctOptionIndex": 0
    },
    {
      "questionText":
          "Transform the sentence 'The prize will be awarded by the principal' into the active voice.",
      "options": [
        "The principal awarded the prize.",
        "The prize being awarded by the principal.",
        "The principal was awarding the prize.",
        "The prize will award the principal.",
      ],
      "correctOptionIndex": 0
    },
    {
      "questionText":
          "Convert the sentence 'The movie was watched by millions of people' to the active voice.",
      "options": [
        "Millions of people watched the movie.",
        "The movie was watching millions of people.",
        "The movie watched millions of people.",
        "Watching by millions of people was the movie.",
      ],
      "correctOptionIndex": 0
    },
    {
      "questionText":
          "Change the sentence 'She eats lunch at 12:00 every day' to the past tense.",
      "options": [
        "She ate lunch at 12:00 every day.",
        "She eats lunch at 12:00 every day.",
        "She eating lunch at 12:00 every day.",
        "She will eat lunch at 12:00 every day.",
      ],
      "correctOptionIndex": 0
    },
    {
      "questionText":
          "Rewrite the sentence 'They will visit the museum next week' in the present continuous tense.",
      "options": [
        "They visited the museum next week.",
        "They will be visiting the museum next week.",
        "They visit the museum next week.",
        "They are visiting the museum next week",
      ],
      "correctOptionIndex": 1
    },
    {
      "questionText":
          "Convert the sentence 'I am studying for my exams' to the future tense.",
      "options": [
        "I studied for my exams.",
        "I will study for my exams.",
        "I study for my exams.",
        " I will be studying for my exams.",
      ],
      "correctOptionIndex": 1
    },
    {
      "questionText":
          "Transform the sentence 'He has finished his homework' into the present perfect continuous tense.",
      "options": [
        " He finishes his homework.",
        "He has been finishing his homework.",
        "He finished his homework.",
        "He will finish his homework.",
      ],
      "correctOptionIndex": 1
    },
    {
      "questionText":
          "Change the sentence 'The sun rises in the east' to the future tense.",
      "options": [
        " The sun rises in the east.",
        "The sun will rise in the east.",
        "The sun is rising in the east.",
        " The sun will be rising in the east.",
      ],
      "correctOptionIndex": 1
    },
  ]
};

List<Question> fetchQuestions(String difficulty) {
  return questionData[difficulty]!.map((q) => Question.fromMap(q)).toList();
}
