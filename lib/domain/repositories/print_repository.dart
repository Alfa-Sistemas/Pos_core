import 'package:flutter/widgets.dart';

abstract class PrintRepository {
   Future<String> printFile({
    required String filePath,
    required BuildContext context,
  });
}