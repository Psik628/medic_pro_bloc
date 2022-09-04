import 'package:injectable/injectable.dart';
import 'package:medic_pro_bloc/main_common.dart';

Future<void> main() async {
  await mainCommon(Environment.dev);
}