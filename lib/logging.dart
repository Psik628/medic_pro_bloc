import 'package:logger/logger.dart';

// logger.v("Verbose log");
//
// logger.d("Debug log");
//
// logger.i("Info log");
//
// logger.w("Warning log");
//
// logger.e("Error log");
//
// logger.wtf("What a terrible failure log");

final logger = (Type type) => Logger(
  printer: CustomerPrinter(type.toString()),
  level: Level.verbose,
);

class CustomerPrinter extends LogPrinter {
  final String className;

  CustomerPrinter(this.className);

  @override
  List<String> log(LogEvent event) {
    final color = PrettyPrinter.levelColors[event.level];
    final emoji = PrettyPrinter.levelEmojis[event.level];
    final message = event.message;

    return [color!('$emoji $className: $message')];
  }
}