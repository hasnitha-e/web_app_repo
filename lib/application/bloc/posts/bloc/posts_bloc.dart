import 'package:api_integration_app/domain/Failures/main_failues.dart';
import 'package:api_integration_app/domain/models/post_model/post_model.dart';
import 'package:api_integration_app/domain/models/posts_service.dart';
import 'package:bloc/bloc.dart';

import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'posts_event.dart';
part 'posts_state.dart';
part 'posts_bloc.freezed.dart';

@injectable
class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final PostRepository _postRepository;
  PostsBloc(this._postRepository) : super(PostsState.initial()) {
    on<_GetPosts>((event, emit) async {
      emit(state.copyWith(
        isload: true,isError: false
      ));
      final Either<MainFailures, List<PostModel>> postsOption =
          await _postRepository.getPosts();
      emit(postsOption.fold(
          (faiure) => state.copyWith(isload: false, posts: [],isError:true),
          (success) => state.copyWith(isload: false, posts: success,isError: false))
       ); 
    });
  }
}
