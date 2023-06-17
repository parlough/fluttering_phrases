import 'package:fluttering_phrases/fluttering_phrases.dart';

void main() {
  const attributives = ['awesome', 'super', 'duper', ...defaultAttributives];
  const nouns = ['parlough', 'example', 'sdk', ...defaultNouns];

  final generatedTitle = generate(
    delimiter: ' | ',
    tokenRadix: 16,
    attributives: attributives,
    nouns: nouns,
  );

  print(generatedTitle);
}
