# fluttering_phrases
Generate random noun phrases with an optional token to spice up names in your application.

The library uses a predefined set of attributives and nouns, with some dart-related terms thrown in, but you can
manually include some extra terms when generating a string.

Feel free to open a pull request to add new attributives and/or nouns or remove ill-fitting ones :)

*This project has not yet had a final release, therefore the API may experience small breakages.*

## Usage

A simple usage example:

```dart
import 'package:fluttering_phrases/fluttering_phrases.dart';

void main() {
  const extraAttributives = ['awesome', 'super', 'duper'];
  const extraNouns = ['parlough', 'example', 'sdk'];

  final generatedTitle = generate(
      delimiter: ' | ',
      tokenRadix: 16,
      extraAttributives: extraAttributives,
      extraNouns: extraNouns);

  print(generatedTitle);
}
```

Refer to the `generate()` method documentation and the tests for more information.

## Feature Requests and Issues

I'm heavily open to feedback and until the 1.0 release I'm willing to make drastic API changes if necessary.
Let me know of any features you'd like to see or of any issues you have on the
issue tracker [on Github](https://github.com/parlough/fluttering_phrases/issues).
