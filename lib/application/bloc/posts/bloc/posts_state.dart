part of 'posts_bloc.dart';

@freezed
class PostsState with _$PostsState {
  factory PostsState(
      {required bool isload,
      required List<PostModel>? posts,
      required bool isError}) = _PostsState;

  factory PostsState.initial() {
    return PostsState(isload: true, posts: [],isError: false);
  }
}
