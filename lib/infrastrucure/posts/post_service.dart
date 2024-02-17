import 'package:api_integration_app/domain/Failures/main_failues.dart';
import 'package:api_integration_app/domain/api_endpoints/api_end_points.dart';
import 'package:api_integration_app/utils/constants.dart';
import 'package:api_integration_app/domain/models/post_model/post_model.dart';
import 'package:api_integration_app/domain/models/posts_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: PostRepository)
class PostRepo implements PostRepository {
  List<PostModel> postsList = [];
  @override
  Future<Either<MainFailures, List<PostModel>>> getPosts() async {
    Dio dio = Dio();
    try {
      final response = await dio.get(base_url + ApiEndPoints.postapi);
      if (response.statusCode == 200) {
        final postsList =
            (response.data as List).map((e) => PostModel.fromJson(e)).toList();
        return right(postsList);
      } else {
        return const Left(MainFailures.serverFailure());
      }
    } catch (e) {
      return const Left(MainFailures.serverFailure());
    }
  }
}
