Generate random noun phrases with an optional token to spice up names in your application.

The library uses a predefined set of attributives and nouns, with some dart-related terms thrown in, but you can
manually include some extra terms when generating a string.

Feel free to open a pull request to add new attributives and/or nouns or remove ill-fitting ones :)

## Usage

A simple usage example:

```dart
import 'package:fluttering_phrases/fluttering_phrases.dart';

void main() {
  const attributives = ['awesome', 'super', 'duper', ...defaultAttributives];
  const nouns = ['parlough', 'example', 'sdk', ...defaultNouns];

  final generatedTitle = generate(
      delimiter: ' | ',
      tokenRadix: 16,
      attributives: attributives,
      nouns: nouns);

  print(generatedTitle);
}
```

Refer to the `generate()` method documentation and the tests for more information.

## Feature Requests and Issues

I'm heavily open to feedback, so let me know of any features you'd like to see or of any issues
you have on the issue tracker [on Github](https://github.com/parlough/fluttering_phrases/issues).
