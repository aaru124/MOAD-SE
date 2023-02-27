class Question {
  final String questionText;
  final List<Answer> answersList;

  Question(this.questionText, this.answersList);
}

class Answer {
  final String answerText;
  final bool isCorrect;

  Answer(this.answerText, this.isCorrect);
}

List<Question> getQuestions() {
  List<Question> list = [];
  //ADD questions and answer here

  list.add(Question(
    "A widget that allows us to refresh the screen is called a ___.",
    [
      Answer("Stateless widgets", false),
      Answer("Stateful widget", true),
      Answer("Statebuild widget", false),
      Answer("All of the above", false),
    ],
  ));

  list.add(Question(
    "pubspec.yaml file does not contain?",
    [
      Answer("Project general settings", false),
      Answer("Project dependencies", false),
      Answer("Project language", true),
      Answer("Project assets", false),
    ],
  ));

  list.add(Question(
    "Which of the following takes more time to compile and update the app?",
    [
      Answer("Hot Reload", false),
      Answer("Hot Restart", true),
      Answer("Cold Reload", false),
      Answer("Depends on the Compiler", false),
    ],
  ));

  list.add(Question(
    "... component allow us to specify the distance between widgets on the screen.",
    [
      Answer("Table", false),
      Answer("AppBar", false),
      Answer("SafeArea", false),
      Answer("SizedBox", true),
    ],
  ));

  return list;
}
