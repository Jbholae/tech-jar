import 'package:flutter/material.dart';
import 'package:tech_jar/config/api_services.dart';
import 'package:tech_jar/config/app_routes.dart';
import 'package:tech_jar/config/route_arguments.dart';
import 'package:tech_jar/model/post.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<List<PostModel>>(
          future: ApiServices().getPosts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Center(
                  child: Text('${snapshot.error}'),
                );
              } else if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    var gotData = snapshot.data?[index];
                    return GestureDetector(
                      onTap: () {
                        final args = PostDetailArgument(postId: gotData.id!);
                        Navigator.pushNamed(
                          context,
                          AppRoutes.postDetail,
                          arguments: args,
                        );
                      },
                      child: ListTile(
                        leading: Text(gotData!.id.toString()),
                        title: Text(
                          gotData.title!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          gotData.body!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    );
                  },
                );
              }
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
