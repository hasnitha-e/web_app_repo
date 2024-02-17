
import 'package:api_integration_app/utils/colors.dart';
import 'package:api_integration_app/domain/models/post_model/post_model.dart';
import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    super.key,
    required this.post,
  });

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(leading: Container(
          height: 32,
          width: 32,
          decoration:const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(6)),
          
          ),
          child: CircleAvatar(radius: 6, backgroundColor: indigo, child: Icon(Icons.person,color: white,),)
        ),
          title: Text(
            post.title ?? "Unknown",
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(left:3.0),
            child: Text(
              post.body ?? "No body available",
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
          ),
        ),
      ),
    );
  }
}
