import 'package:api_integration_app/application/bloc/posts/bloc/posts_bloc.dart';
import 'package:api_integration_app/utils/styles.dart';
import 'package:api_integration_app/presentation/home_screen/widgets/appbar.dart';
import 'package:api_integration_app/presentation/home_screen/widgets/post_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<PostsBloc>(context).add(PostsEvent.getPosts());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbarWidget(),
        body: Padding(
            padding: mainPadding,
            child:
                BlocBuilder<PostsBloc, PostsState>(builder: (context, state) {
              if (state.isload) {
                return const Center(child: CircularProgressIndicator());
              } else if (state.isError) {
                return const Center(
                  child: Text(
                    'Error Occurred',
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
                      child: PostsView(posts: state.posts!),
                    ),
                  ],
                );
              }
            })));
  }
}
