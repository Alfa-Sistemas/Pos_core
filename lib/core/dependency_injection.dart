import 'package:pos_core/data/repository_impl/repository_impl.dart';
import 'package:pos_core/domain/repositories/repository.dart';
import 'package:pos_core/domain/usecases/device/get_device_type_usecase.dart';
import 'package:pos_core/domain/usecases/device/get_serial_usecase.dart';
import 'package:pos_core/domain/usecases/log/get_last_logs_usecase.dart';
import 'package:pos_core/domain/usecases/log/save_log_usecase.dart';
import 'package:pos_core/domain/usecases/payment/payment_complete_usecase.dart';
import 'package:pos_core/domain/usecases/payment/payment_usecase.dart';
import 'package:pos_core/domain/usecases/print/print_usecase.dart';
import 'package:pos_core/domain/usecases/refund/refund_usecase.dart';
import 'package:pos_core/domain/usecases/screen/screen_wake_usecase.dart';
import 'package:pos_core/domain/usecases/usecase_interface.dart';
import 'package:pos_core/pos_core.dart';
import 'package:pos_core/presentation/stone/refund/refund_bloc.dart';

Future<void> initInjectors(String machineType) async {
  // Data
  

  // Repositories
  getIt.registerLazySingleton<Repository>(() => RepositoryImpl(getIt(instanceName: machineType)));

  // Usecases
  getIt.registerLazySingleton<UsecaseInterface>(
    () => MakePaymentUsecase(getIt()),
    instanceName: "payment",
  );
  getIt.registerLazySingleton<UsecaseInterface>(
    () => PaymentCompleteUsecase(getIt()),
    instanceName: "paymentComplete",
  );
  getIt.registerLazySingleton<UsecaseInterface>(
    () => RefundUsecase(getIt()),
    instanceName: "refund",
  );
  getIt.registerLazySingleton<UsecaseInterface>(
    () => PrintUsecase(getIt()),
    instanceName: "print",
  );
  getIt.registerLazySingleton<UsecaseInterface>(
    () => ScreenWakeUsecase(getIt()),
    instanceName: "screen",
  );
  getIt.registerLazySingleton<UsecaseInterface>(
    () => GetSerialUsecase(getIt()),
    instanceName: "serial",
  );
  getIt.registerLazySingleton<UsecaseInterface>(
    () => GetDeviceTypeUsecase(getIt()),
    instanceName: "deviceType",
  );
  getIt.registerLazySingleton<UsecaseInterface>(
    () => GetLastLogsUsecase(getIt()),
    instanceName: "getLog",
  );
  getIt.registerLazySingleton<UsecaseInterface>(
    () => SaveLogUsecase(getIt()),
    instanceName: "saveLog",
  );

  // Blocs
  getIt.registerLazySingleton<RefundBloc>(() => RefundBloc(getIt()));

  getIt.registerFactoryParam<PosCore, String, void>(
    (machineType, _) => PosCore(machineType),
  );
}
