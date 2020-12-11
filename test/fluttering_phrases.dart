import 'package:fluttering_phrases/fluttering_phrases.dart';
import 'package:test/test.dart';

void main() {
  group('Basic tests', () {
    test('Returns a non-null, non-empty, string', () {
      expect(generate(), allOf(isA<String>(), isNotNull, isNotEmpty));
    });

    test('First character is not an integer', () {
      expect(int.tryParse(generate()[0]), isNull);
    });

    test('First character of token is an integer', () {
      expect(int.tryParse(generate().split('-')[2]), isNotNull);
    });

    test('Two successive results are not equivalent', () {
      expect(generate() == generate(), isFalse);
    });
  });

  group('Delimiter tests', () {
    test('Contains a delimiter', () {
      expect(generate(), contains('-'));
    });

    test('Contains two delimiters', () {
      expect(generate().split('-').length, equals(3));
    });

    test('Contains one delimiter', () {
      expect(generate(includeToken: false).split('-').length, equals(2));
    });

    test('Changes at least one delimiter', () {
      expect(generate(delimiter: '|'), contains('|'));
    });

    test('Changes all delimiters', () {
      expect(generate(delimiter: '|').split('|').length, equals(3));
    });
  });

  group('General token tests', () {
    test('Includes token', () {
      expect(generate().split('-').length, equals(3));
    });

    test('Does not include token', () {
      expect(generate(includeToken: false).split('-').length, equals(2));
    });

    test('Token is 4 characters long', () {
      expect(generate().split('-')[2].length, equals(4));
    });

    test('Token is 0 characters long', () {
      expect(generate(tokenLength: 0).split('-')[2].length, isZero);
    });

    test('Token is 10 characters long', () {
      expect(generate(tokenLength: 10).split('-')[2].length, equals(10));
    });

    test('Throws if token length is negative', () {
      expect(() => generate(tokenLength: -4), throwsRangeError);
    });
  });

  group('Radix tests', () {
    test('Changing radix works', () {
      const radix = 16;

      var foundNonDecimal = false;

      // In 100 iterations, there should be at least one token with a-f
      for (var i = 0; i < 100; i++) {
        final result = generate(tokenRadix: radix);
        final token = result.split('-')[2];

        if (int.tryParse(token) == null) {
          foundNonDecimal = true;
          break;
        }
      }

      expect(foundNonDecimal, isTrue);
    });

    test('Negative radix throws', () {
      expect(() => generate(tokenRadix: -5), throwsRangeError);
    });

    test('Radix below 2 throws', () {
      expect(() => generate(tokenRadix: 1), throwsRangeError);
    });

    test('Radix of 2 does not throw', () {
      expect(() => generate(tokenRadix: 2), isNot(throwsRangeError));
    });

    test('Radix greater than 36 throws', () {
      expect(() => generate(tokenRadix: 37), throwsRangeError);
    });

    test('Radix of 36 does not throw', () {
      expect(() => generate(tokenRadix: 36), isNot(throwsRangeError));
    });
  });

  group('Seed tests', () {
    test('Two successive results are the same', () {
      const seed = 42;
      expect(generate(seed: seed), equals(generate(seed: seed)));
    });
  });

  group('Attributive and noun tests', () {
    test('Throws error if no attributives', () {
      expect(() => generate(attributives: []), throwsArgumentError);
    });

    test('Throws error if no nouns', () {
      expect(() => generate(nouns: []), throwsArgumentError);
    });

    test('Throws error if no nouns and no attributives', () {
      expect(() => generate(attributives: [], nouns: []), throwsArgumentError);
    });

    test('Does not throw error if only one attribute', () {
      expect(() => generate(attributives: ['fluttering']), isNot(throwsArgumentError));
    });

    test('Does not throw error if only one noun', () {
      expect(() => generate(nouns: ['dart']), isNot(throwsArgumentError));
    });

    test('If only one attribute contains it as first piece', () {
      expect(generate(attributives: ['fluttering']).split('-')[0], equals('fluttering'));
    });

    test('If only one noun contains it as second piece', () {
      expect(generate(nouns: ['dart']).split('-')[1], equals('dart'));
    });
  });
}
