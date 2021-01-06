library fluttering_phrases;

import 'dart:math';

/// The default attributive terms used to generate phrases.
const defaultAttributives = [
  'alluring',
  'amber',
  'ancient',
  'astonishing',
  'avian',
  'bold',
  'bustling',
  'chilly',
  'crimson',
  'cylindrical',
  'dashing',
  'decadent',
  'delicate',
  'divine',
  'elegant',
  'elusive',
  'enchanted',
  'enchanted',
  'enchanted',
  'ensorcelled',
  'exquisite',
  'fascinating',
  'fluttering',
  'forlorn',
  'fuchsia',
  'glistening',
  'golden',
  'grandiose',
  'hollow',
  'hopeful',
  'infinite',
  'jade',
  'joyful',
  'keen',
  'lingering',
  'lively',
  'loth',
  'magenta',
  'malevolent',
  'mellow',
  'neapolitan',
  'notorious',
  'obsidian',
  'oval',
  'periwinkle',
  'poetic',
  'powerful',
  'primal',
  'quaint',
  'quiet',
  'quintessential',
  'resonating',
  'reverberating',
  'rustic',
  'silent',
  'slick',
  'snowy',
  'solar',
  'solid',
  'sparkling',
  'spectral',
  'swift',
  'tangled',
  'tropical',
  'ubiquitous',
  'unbridled',
  'vagrant',
  'volcanic',
  'wild',
  'windy',
  'xenial',
  'yawning',
  'zealous',
];

/// The default nouns used to generate phrases.
const defaultNouns = [
  'aqueduct',
  'arc',
  'branch',
  'bulb',
  'charm',
  'cliff',
  'cloud',
  'clover',
  'crest',
  'dart',
  'dawn',
  'destiny',
  'diamond',
  'dryad',
  'durian',
  'echo',
  'end',
  'eucalyptus',
  'fauna',
  'flash',
  'flora',
  'glacier',
  'glimmer',
  'gorge',
  'gust',
  'hollow',
  'hyacinth',
  'illusion',
  'jungle',
  'kettle',
  'kingdom',
  'lantern',
  'lotus',
  'marble',
  'marsh',
  'midnight',
  'mirror',
  'neutron',
  'oak',
  'osmium',
  'patter',
  'peak',
  'performance',
  'pomelo',
  'pool',
  'qualm',
  'rainbow',
  'ray',
  'rhythm',
  'ritual',
  'rose',
  'snow',
  'snowflake',
  'sparkle',
  'spray',
  'sunshine',
  'toast',
  'truth',
  'tulip',
  'tundra',
  'utopia',
  'vibration',
  'villa',
  'waterfall',
  'zephyr',
];

/// The random shared by generation calls which don't pass in a seed.
final _sharedRandom = Random();

/// Generates a lowercase attributive+noun pair with an optional token appended
/// to the end and delimited by the specified [delimiter].
///
/// An example is fluttering-dart-3215 where '-' is the delimiter, 'fluttering'
/// is the attributive, 'dart' is the noun, and 3215 is the token.
///
/// This generator uses a shared [Random], but you can specify a [seed]
/// to create a new [Random] to get a consistent result.
///
/// The token is included by default, but you can set [includeToken] to `false`
/// to exclude it. You can also optionally set [tokenLength] to a positive
/// number to configure its length and [tokenRadix] to control what
/// characters it can use. The defaults are a length of `4` and a radix
/// of `10` resulting in 0-9.
///
/// The specified [tokenRadix] must be an [int] in the range 2-36.
///
/// While this method uses a predefined list of attributives and nouns by
/// default, you can override these with the [attributives] and [nouns]
/// parameters respectively. You can add [defaultAttributives] and
/// [defaultNouns] to your passed in lists if you'd like the default ones
/// as well. There must be at least one attributive and one noun.
String generate(
    {String delimiter = '-',
    bool includeToken = true,
    int tokenLength = 4,
    int tokenRadix = 10,
    int? seed,
    List<String> attributives = defaultAttributives,
    List<String> nouns = defaultNouns}) {
  if (attributives.isEmpty || nouns.isEmpty) {
    throw ArgumentError('There must be at least 1 attributive and 1 noun.');
  }

  final rand = seed == null ? _sharedRandom : Random(seed);

  final buffer = StringBuffer();
  buffer.write(attributives[rand.nextInt(attributives.length)]);
  buffer.write(delimiter);
  buffer.write(nouns[rand.nextInt(nouns.length)]);

  if (includeToken) {
    if (tokenLength < 0) {
      throw RangeError('The token length must be a positive integer');
    }

    buffer.write(delimiter);
    for (var i = 0; i < tokenLength; i++) {
      buffer.write(rand.nextInt(tokenRadix).toRadixString(tokenRadix));
    }
  }

  return buffer.toString();
}
