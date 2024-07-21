import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_jar/config/app_routes.dart';
import 'package:tech_jar/config/route_arguments.dart';
import 'package:tech_jar/provider/get_post.dart';
import 'package:tech_jar/widgets/empty_widget.dart';
import 'package:tech_jar/widgets/loading_widget.dart';
import 'package:tech_jar/widgets/post_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Provider.of<GetPostProvider>(context, listen: false).getPostData();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<GetPostProvider>(
          builder: (context, getPost, child) {
            return getPost.loading
                ? const LoadingWidget()
                : ListView.builder(
                    itemCount: getPost.getpostResponse.length,
                    itemBuilder: (context, index) {
                      var gotData = getPost.getpostResponse[index];
                      return getPost.getpostResponse.isEmpty
                          ? const EmptyWidget()
                          : PostWidget(
                              gotData: gotData,
                              onTap: () {
                                final args =
                                    PostDetailArgument(postId: gotData.id!);
                                Navigator.pushNamed(
                                  context,
                                  AppRoutes.postDetail,
                                  arguments: args,
                                );
                              },
                            );
                      // return postWidget(gotData!, context);
                    },
                  );
          },
        ),
      ),
    );
  }
}
