import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_jar/config/route_arguments.dart';
import 'package:tech_jar/provider/get_post_comments.dart';
import 'package:tech_jar/provider/get_post_details.dart';
import 'package:tech_jar/widgets/empty_widget.dart';
import 'package:tech_jar/widgets/loading_widget.dart';

class PostDetailScreen extends StatefulWidget {
  const PostDetailScreen({
    super.key,
    required this.arguments,
  });
  final PostDetailArgument arguments;

  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  @override
  Widget build(BuildContext context) {
    Provider.of<GetPostDetailsProvider>(context, listen: false)
        .getPostDetailsData(widget.arguments.postId);
    Provider.of<GetPostCommentsProvider>(context, listen: false)
        .getPostCommentData(widget.arguments.postId);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blueGrey[300],
        child: const Icon(
          Icons.add_card,
          size: 30,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Consumer<GetPostDetailsProvider>(
                  builder: (context, postDetails, child) {
                    return postDetails.loading
                        ? const LoadingWidget()
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                postDetails.postDetailsResponse.title!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                postDetails.postDetailsResponse.body!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          );
                  },
                ),
              ),
              const Divider(),
              Expanded(
                flex: 4,
                child: SingleChildScrollView(
                  child: Consumer<GetPostCommentsProvider>(
                    builder: (context, commentData, child) {
                      return commentData.loading
                          ? const LoadingWidget()
                          : ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: commentData.postCommentResponse.length,
                              itemBuilder: (context, index) {
                                var postData =
                                    commentData.postCommentResponse[index];
                                return commentData.postCommentResponse.isEmpty
                                    ? const EmptyWidget()
                                    : Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 5.0),
                                        decoration: BoxDecoration(
                                            color: Colors.grey[300],
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: ListTile(
                                          title: Text(
                                            postData.name!,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13,
                                            ),
                                          ),
                                          subtitle: Text(
                                            postData.body!,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 13,
                                            ),
                                          ),
                                        ),
                                      );
                              },
                            );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
