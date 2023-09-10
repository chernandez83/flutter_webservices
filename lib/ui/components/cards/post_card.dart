import 'package:flutter/material.dart';
import 'package:flutter_webservices/models/post_model.dart';

class PostCard extends StatelessWidget {
  PostModel postModel;
  PostCard(this.postModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          postModel.title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle: Text(
          postModel.body,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
    );
  }

}