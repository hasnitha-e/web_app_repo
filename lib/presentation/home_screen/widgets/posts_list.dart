import 'package:api_integration_app/domain/models/post_model/post_model.dart';
import 'package:api_integration_app/presentation/home_screen/widgets/posts_card.dart';
import 'package:flutter/material.dart';

class PostListView extends StatelessWidget {
  const PostListView({
    super.key,
    required this.posts,
  });

  final List<PostModel> posts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: PostCard(post: posts[index]),
        );
      },
      itemCount: posts.length,
    );
  }
}
