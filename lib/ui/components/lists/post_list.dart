import 'package:flutter/material.dart';
import 'package:flutter_webservices/models/post_model.dart';
import 'package:flutter_webservices/ui/components/cards/post_card.dart';
import 'package:flutter_webservices/ui/components/errors/list_future_error.dart';

class PostList extends StatelessWidget {
  const PostList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListFutureError(view, PostModel().getPosts);
  }

  view(List posts) {
    return ListView.builder(
      shrinkWrap: true,
      reverse: true,
      itemCount: posts.length,
      itemBuilder: (context, index) {
        PostModel postModel =  posts[index];
        return PostCard(postModel);
      }
    );
  }
  
}