// Question(
// question : String,
// isSingleChoice : bool,
// answerChoices : Map<String, List<Question>?>,
// isMandatory : bool,
// errorText : String,
// answers : List<String>
// )

class SampleQuestionModel {
  late String question;
  late bool isSingleChoice;
  List<String>? answerChoices;
  Map<String,bool>? multipleAnswerChoices;
  late bool isMandatory;
  late String errorText;
  String? answers;

  SampleQuestionModel(
      {required this.question,
      required this.isSingleChoice,
      this.answerChoices,
      this.multipleAnswerChoices,
      required this.isMandatory,
      required this.errorText,
      this.answers});
}
