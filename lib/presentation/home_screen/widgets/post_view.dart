
import 'package:api_integration_app/domain/models/post_model/post_model.dart';
import 'package:api_integration_app/presentation/home_screen/widgets/post_grid.dart';
import 'package:api_integration_app/presentation/home_screen/widgets/posts_list.dart';
import 'package:flutter/material.dart';

class PostsView extends StatelessWidget {
  const PostsView({
    super.key,
    required this.posts,
  });

  final List<PostModel> posts;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 960) {
          return PostsGrid(posts: posts, crosscount: 4);
        } else if (constraints.maxWidth > 600) {
          return PostsGrid(posts: posts, crosscount: 2);
        } else {
          return PostListView(posts: posts);
        }
      },
    );
  }
}

