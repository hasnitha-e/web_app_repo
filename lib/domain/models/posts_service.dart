import 'package:api_integration_app/domain/Failures/main_failues.dart';
import 'package:api_integration_app/domain/models/post_model/post_model.dart';
import 'package:dartz/dartz.dart';

abstract class PostRepository {
  Future<Either<MainFailures, List<PostModel>>> getPosts();
}
