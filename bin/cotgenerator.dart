import 'package:args/args.dart';
import 'generator.dart';

const String version = '0.0.1';

ArgParser buildParser() {
  return ArgParser()
    ..addFlag(
      'help',
      abbr: 'h',
      negatable: false,
      help: 'First parameter = number of PLIs to generate (def. 12).\nSeond parameter is the base Name to use for the callsign (def. "COTGEN").\nThird parameter is the period in seconds for repeating new CoTs (def. 30s).',
    )
    ..addFlag(
      'debug',
      abbr: 'd',
      negatable: false,
      help: 'Show program trace.',
    )
    ..addFlag(
      'version',
      abbr: 'v',
      negatable: false,
      help: 'Print the version string.',
    );
}

void printUsage(ArgParser argParser) {
  print('Usage: ./cotgenerator <flags> [arguments]');
  print(argParser.usage);
}

void main(List<String> arguments) {
  final ArgParser argParser = buildParser();
  try {
    final ArgResults results = argParser.parse(arguments);
    bool debug = false;

    // Process the parsed arguments.
    if (results.flag('help')) {
      printUsage(argParser);
      return;
    }
    if (results.flag('version')) {
      print('cotgenerator version: $version');
      return;
    }
    if (results.flag('debug')) {
      debug = true;
    }

    // Act on the arguments provided.
    print('Positional arguments: ${results.rest}');
    if (debug) {
      print('[DEBUG] All arguments: ${results.arguments}');
    }
    if(results.arguments.length > 1) {
      print('Arguments: Make ${results.arguments[0]} CoTs, Base Name: ${results.arguments[1]} Every ${results.arguments[2]} seconds');
      final g = Generator(numPLIs: int.parse(results.arguments[0]), baseName: results.arguments[1]);
      g.launchCOTs();
    }
    else if(results.arguments.length == 1) {
      print('Arguments: Make ${int.parse(results.arguments[0])} CoTs, Base Name: COTGEN Every 30 seconds');
      final g = Generator(numPLIs: int.parse(results.arguments[0]), baseName: 'COTGEN');
      g.launchCOTs();
    }
    else {
      print('Arguments: Make 12 CoTs, Base Name: COTGEN Every 30 seconds');
      final g = Generator(numPLIs: 12, baseName: 'COTGEN');
      g.launchCOTs();
    }    

  } on FormatException catch (e) {
    // Print usage information if an invalid argument was provided.
    print(e.message);
    print('');
    printUsage(argParser);
  }
}
