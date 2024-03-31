import 'package:fpdart/fpdart.dart';
import 'package:movie_app_clean_bloc/core/errors/failure.dart';

abstract interface class UseCase<SuccessType, Params> {
  Future<Either<Failure, SuccessType>> call(Params params);
}
