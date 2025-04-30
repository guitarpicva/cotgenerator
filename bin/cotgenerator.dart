import 'package:args/args.dart';
import 'generator.dart';

const String version = '0.0.1';
bool doXML = false; // def. to use pBuf generator

ArgParser buildParser() {
  return ArgParser(allowTrailingOptions: false)
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
      help: 'Show program trace.'
    )
    ..addFlag(
      'version',
      abbr: 'v',
      negatable: false,
      help: 'Print the version string.'
    )
    ..addFlag(
      'xml',
      abbr: 'x',
      negatable: false,
      help: 'Use the XML generator.'
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
    if(results.flag('xml')) {
      // use the XML generator instead of the pBuf generator
      doXML = true;
    }
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
    
    //switch(results.arguments.length) {
    switch(results.rest.length) {
      case 6:
      print('6 Arguments: Make ${results.rest[0]} CoTs, Base Name: ${results.rest[1]} Every ${results.rest[2]} seconds');
      final g = Generator(xml: doXML, numPLIs: int.parse(results.rest[0]), baseName: results.rest[1], timeout: int.parse(results.rest[2]), lat : double.parse(results.rest[3]), lon : double.parse(results.rest[4]), endpoint: results.rest[5]);
      g.launchCOTs();
      break;
    case 5:
      print('5 Arguments: Make ${results.rest[0]} CoTs, Base Name: ${results.rest[1]} Every ${results.rest[2]} seconds');
      final g = Generator(xml: doXML, numPLIs: int.parse(results.rest[0]), baseName: results.rest[1], timeout: int.parse(results.rest[2]), lat : double.parse(results.rest[3]), lon : double.parse(results.rest[4]));
      g.launchCOTs();
      break;
    case 3:
      print('3 Arguments: Make ${results.rest[0]} CoTs, Base Name: ${results.rest[1]} Every ${results.rest[2]} seconds');
      final g = Generator(xml: doXML, numPLIs: int.parse(results.rest[0]), baseName: results.rest[1], timeout: int.parse(results.rest[2]));
      g.launchCOTs();
      break;
    case 2:
      print('2 Arguments: Make ${results.rest[0]} CoTs, Base Name: ${results.rest[1]} Every 30 seconds');
      final g = Generator(xml: doXML, numPLIs: int.parse(results.rest[0]), baseName: results.rest[1]);
      g.launchCOTs();
      break;
    case 1:
      print('1 Argument: Make ${int.parse(results.rest[0])} CoTs, Base Name: COTGEN Every 30 seconds');
      final g = Generator(xml: doXML, numPLIs: int.parse(results.rest[0]), baseName: 'COTGEN');
      g.launchCOTs();
      break;
    default:
      print('0 Arguments: Make 12 CoTs, Base Name: COTGEN Every 30 seconds');
      final g = Generator(xml: doXML, numPLIs: 12, baseName: 'COTGEN');
      g.launchCOTs();
    }
  } 
  on FormatException catch (e) {
    // Print usage information if an invalid argument was provided.
    print(e.message);
    print('');
    printUsage(argParser);
  }
}
