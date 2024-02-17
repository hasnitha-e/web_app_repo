import 'package:api_integration_app/domain/Failures/main_failues.dart';
import 'package:api_integration_app/domain/models/post_model/post_model.dart';
import 'package:api_integration_app/domain/models/posts_service.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class PostsProvider extends ChangeNotifier {
  final PostRepository _postRepository;

  PostsProvider(this._postRepository);

  bool isload = false;

  List<PostModel> _posts = [];

  List<PostModel> get posts => _posts;

  Future<void> getPosts() async {
    isload = true;
    try {
      final Either<MainFailures, List<PostModel>> postsOption =
          await _postRepository.getPosts();

      isload = false;
      postsOption.fold(
        (failure) {

          _posts = [];
        },
        (success) {
          _posts = success;
        },
      );
     notifyListeners();
    } catch (e) {
      return ;
    }
  }
}
