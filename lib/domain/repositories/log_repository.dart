import 'package:pos_core/domain/entities/log_entity.dart';

abstract class LogRepository {
  Future<List<Log>> getLastLogsTransaction();
  Future<String> saveLog(Log log);
}