abstract class UsecaseInterface<Type, Params> {
  Future<Type> execute(Params params);
}
