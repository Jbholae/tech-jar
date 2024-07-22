// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:tech_jar/model/post.dart';

class PostWidget extends StatelessWidget {
  PostWidget({
    super.key,
    required this.gotData,
    required this.onTap,
  });
  PostModel gotData;
  Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
        color: Colors.blueGrey[100],
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: GestureDetector(
        onTap: () {
          onTap();
        },
        child: ListTile(
          leading: Text(gotData.id.toString()),
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
      ),
    );
  }
}
