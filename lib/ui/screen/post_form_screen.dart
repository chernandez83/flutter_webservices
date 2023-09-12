import 'package:flutter/material.dart';
import 'package:flutter_webservices/common/validate.dart';
import 'package:flutter_webservices/http_protocol/request_error.dart';
import 'package:flutter_webservices/models/post_model.dart';

class PostFormScreen extends StatelessWidget {
  GlobalKey<FormState> keyForm = GlobalKey();
  TextEditingController ctrlTitle = TextEditingController();
  TextEditingController ctrlBody = TextEditingController();

  PostFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Formulario post',
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(25),
        child: Form(
          key: keyForm,
          child: Column(
            children: [
              TextFormField(
                controller: ctrlTitle,
                decoration: const InputDecoration(
                  hintText: 'Título',
                  prefixIcon: Icon(Icons.title),
                ),
              ),
              TextFormField(
                controller: ctrlBody,
                maxLines: 5,
                decoration: const InputDecoration(
                  hintText: 'Contenido',
                  prefixIcon: Icon(Icons.title),
                ),
              ),
              TextButton(
                  onPressed: () => save(context),
                  child: Text(
                    'Guardar',
                    style: Theme.of(context).textTheme.titleSmall,
                  )),
            ],
          ),
        ),
      ),
    );
  }

  save(context) async {
    if(keyForm.currentState!.validate()) {
      var post = await PostModel().savePost();
      if(Validate.isNotRequestError(post)) {
        Navigator.pop(context);
      } else {
        RequestError requestError = post as RequestError;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: requestError.textError!,
          ),
        );
      }
    }
  }

}