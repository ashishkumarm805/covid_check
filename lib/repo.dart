 class Repository {
  String welcome;
  List<Questions> questions;
  List<String> results;
  List<String> precautions;
  Repository(
      {this.welcome,
      this.questions,
      this.results,
      this.precautions});
}
class Questions {
  int number;
  String question;
  List<String> answers;
  List<int> scores;

  Questions({this.number, this.question, this.answers, this.scores});
}