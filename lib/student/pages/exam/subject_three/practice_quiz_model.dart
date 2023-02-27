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
    "Which of the following are CPU scheduling algorithms?",
    [
      Answer("Priority scheduling", false),
      Answer("Round Robin", false),
      Answer("Shortest Job First", false),
      Answer("All of the above", true),
    ],
  ));

  list.add(Question(
    "FIFO scheduling is a type of:",
    [
      Answer("Pre-emptive scheduling", false),
      Answer("Non pre-emptive scheduling", true),
      Answer("Deadline scheduling", false),
      Answer("None of the above", false),
    ],
  ));

  list.add(Question(
    "In which of the following directory does the configuration files are present?",
    [
      Answer("/bin/", false),
      Answer("/root/", false),
      Answer("/etc/", true),
      Answer("/dev/", false),
    ],
  ));

  list.add(Question(
    "The file owner can change the access permission by _____ command.",
    [
      Answer("chmod", true),
      Answer("ahmod", false),
      Answer("enmod", true),
      Answer("ehmod", true),
    ],
  ));

  return list;
}
