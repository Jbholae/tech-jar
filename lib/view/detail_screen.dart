import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_jar/config/route_arguments.dart';
import 'package:tech_jar/provider/get_post_comments.dart';
import 'package:tech_jar/provider/get_post_details.dart';
import 'package:tech_jar/provider/post_comments.dart';
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
    TextEditingController commentController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    Provider.of<GetPostDetailsProvider>(context, listen: false)
        .getPostDetailsData(widget.arguments.postId);
    Provider.of<GetPostCommentsProvider>(context, listen: false)
        .getPostCommentData(widget.arguments.postId);

    @override
    void dispose() {
      commentController.dispose();
      super.dispose();
    }

    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  fit: FlexFit.loose,
                  flex: 1,
                  child: SingleChildScrollView(
                    child: Consumer<GetPostDetailsProvider>(
                      builder: (context, postDetails, child) {
                        return postDetails.loading
                            ? const LoadingWidget()
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.start,
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
                ),
                const Divider(),
                Flexible(
                  fit: FlexFit.tight,
                  flex: 4,
                  child: SingleChildScrollView(
                    child: Consumer<GetPostCommentsProvider>(
                      builder: (context, commentData, child) {
                        return commentData.loading
                            ? const LoadingWidget()
                            : ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount:
                                    commentData.postCommentResponse.length,
                                itemBuilder: (context, index) {
                                  var postData =
                                      commentData.postCommentResponse[index];
                                  return commentData.postCommentResponse.isEmpty
                                      ? const EmptyWidget()
                                      : Container(
                                          margin: const EdgeInsets.only(
                                              bottom: 5.0),
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
                const Divider(),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.1,
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Field Cannot be empty';
                      }
                      return null;
                    },
                    controller: commentController,
                    maxLines: 4,

                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      suffixIcon: Consumer<PostCommentsProvider>(
                          builder: (context, postcomment, child) {
                        return postcomment.loading
                            ? const CircularProgressIndicator()
                            : IconButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    Provider.of<PostCommentsProvider>(context,
                                            listen: false)
                                        .postComment(widget.arguments.postId,
                                            commentController.text, () {
                                      commentController.clear();
                                      FocusScope.of(context)
                                          .requestFocus(FocusNode());
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content:
                                              Text('Successfully Posted !!!'),
                                          duration: Duration(seconds: 1),
                                        ),
                                      );
                                    });
                                  }
                                },
                                icon: const Icon(Icons.send),
                              );
                      }),
                    ),
                    // Add any other properties or callbacks you need for the TextField
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  /*  void _showAddCardModal() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  suffixIcon:
                      IconButton(onPressed: () {}, icon: Icon(Icons.send))),
              // Add any other properties or callbacks you need for the TextField
            ),
          ),
        );
      },
    );
  } */
}
