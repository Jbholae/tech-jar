import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:tech_jar/provider/get_post.dart';
import 'package:tech_jar/provider/get_post_comments.dart';
import 'package:tech_jar/provider/get_post_details.dart';
import 'package:tech_jar/provider/post_comments.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<GetPostProvider>(
    create: (context) => GetPostProvider(),
  ),
  ChangeNotifierProvider<GetPostDetailsProvider>(
    create: (context) => GetPostDetailsProvider(),
  ),
  ChangeNotifierProvider<GetPostCommentsProvider>(
    create: (context) => GetPostCommentsProvider(),
  ),
  ChangeNotifierProvider<PostCommentsProvider>(
    create: (context) => PostCommentsProvider(),
  ),
];
