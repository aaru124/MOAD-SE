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
    "Define Agile scrum methodology.",
    [
      Answer("project management that emphasizes decremental progress", false),
      Answer("project management that emphasizes incremental progress", true),
      Answer("project management that emphasizes neutral progress", false),
      Answer("project management that emphasizes no progress", false),
    ],
  ));

  list.add(Question(
    "What are the major activities of the spiral model of software engineering?",
    [
      Answer("Planning, Risk Analysis, Engineering, Customer Evaluation", true),
      Answer("MicroDefining, Prototyping, Testing, Deliverysoft", false),
      Answer("Requirements", false),
      Answer(
          "Quick Design, Build Prototype, Evaluate Prototype, Refine Prototype",
          false),
    ],
  ));

  list.add(Question(
    "In the maintenance phase the product must be tested against previous test cases. This is known as _________ testing.",
    [
      Answer("Unit", false),
      Answer("Integration", false),
      Answer("Regression", true),
      Answer("Module", false),
    ],
  ));

  list.add(Question(
    "In a software project, COCOMO (Constructive Cost Model) is used to",
    [
      Answer("estimate effort and duration based on the size of the software",
          true),
      Answer("size and duration based on the effort of the software", false),
      Answer("effort and cost based on the duration of the software", false),
      Answer(
          "size, effort and duration based on the cost of the software", false),
    ],
  ));

  return list;
}
