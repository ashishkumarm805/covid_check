import 'package:covid_check/repo.dart';

Repository createNewRepoClass(de) {
  String welcome = de['welcome'];
  List<Questions> list = createListOfQues(de);
  List<String> results = new List<String>();
  for (var a in de['results']) {
    results.add(a);
  }
  List<String> precautions = new List<String>();
  for (var a in de['precautions']) {
    precautions.add(a);
  }
  return Repository(
      welcome: welcome,
      questions: list,
      results: results,
      precautions: precautions);
}

List<Questions> createListOfQues(de) {
  List<Questions> qList = new List<Questions>();
  for (var q in de['questions']) {
    List<String> answers = new List<String>();
    List<int> scores = new List<int>();
    String question = q['question'];
    int number = int.parse(q['number'].toString());
    for (var a in q['answers']) {
      answers.add(a);
    }
    for (var s in q['scores']) {
      scores.add(int.parse(s.toString()));
    }
    qList.add(Questions(
        number: number, question: question, answers: answers, scores: scores));
  }
  if (qList.isNotEmpty) {
    return qList;
  }
  return null;
}
