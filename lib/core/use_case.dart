abstract class UseCase<T, P> {
  const UseCase();

  Future<T> call(P params);
}

class NoParams {
  const NoParams();
}
