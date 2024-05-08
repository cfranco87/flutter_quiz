class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getShuffledAnswer() {
    final shuffledList = List.of(
        answers); //.of() constructor function copies list, created new shuffled list
    shuffledList.shuffle();
    return shuffledList;
  }
}
