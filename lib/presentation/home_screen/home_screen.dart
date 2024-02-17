import 'package:api_integration_app/application/post_provider.dart';
import 'package:api_integration_app/utils/styles.dart';
import 'package:api_integration_app/presentation/home_screen/widgets/appbar.dart';
import 'package:api_integration_app/presentation/home_screen/widgets/post_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
     Provider.of<PostsProvider>(context,listen: false).getPosts();
   super.initState();

     
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbarWidget(),
        body: Padding(
            padding: mainPadding,
            child:
Consumer<PostsProvider>(builder: (context, postProvider, child) {
 
if (postProvider.isload) {
                return const Center(child: CircularProgressIndicator());
              } else if (postProvider.posts.isEmpty) {
                return const Center(
                  child: Text(
                    'No Posts Available',
                  ),
                );
              } else {
                return Column(
                  children: [
                    const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('All Posts', style: titleTextStyle),
                        ),
                      ],
                    ),
                    Expanded(
                      child: PostsView(posts: postProvider.posts),
                    ),
                  ],
                );
              }
            })));
  }
}
