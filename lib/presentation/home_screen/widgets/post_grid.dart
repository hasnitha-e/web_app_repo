
import 'package:api_integration_app/domain/models/post_model/post_model.dart';
import 'package:api_integration_app/presentation/home_screen/widgets/posts_card.dart';
import 'package:flutter/material.dart';

class PostsGrid extends StatelessWidget {
  const PostsGrid({
    super.key,
    required this.posts,
    required this.crosscount,
  });

  final List<PostModel> posts;
  final int crosscount;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(scrollDirection: Axis.vertical,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisExtent: 120,
        crossAxisCount: crosscount,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemBuilder: (context, index) {
        return PostCard(post: posts[index]);
      },
      itemCount: posts.length,
    );
  }
}
