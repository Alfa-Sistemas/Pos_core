// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class ImpressoraEvent {}

class ImpressaIniciou extends ImpressoraEvent {
  final String filePath;
  final String machineType;

  ImpressaIniciou({
    required this.filePath,
    required this.machineType,
  });
}

class ImpressoraFinalizou extends ImpressoraEvent {
  final String result;

  ImpressoraFinalizou({required this.result});
}
