import 'package:flutter/material.dart';
import 'package:flutter_webservices/common/validate.dart';
import 'package:flutter_webservices/http_protocol/request_error.dart';


class ListFutureError extends StatefulWidget {
  var method;
  var view;
  ListFutureError(this.view, this.method, {super.key});

  @override
  State<StatefulWidget> createState() => ListFutureErrorState();

}

class ListFutureErrorState extends State<ListFutureError> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.method(),
      builder: (context, snapshot) {
        if(Validate.isNotRequestError(snapshot.data)
            && snapshot.hasData
            && snapshot.connectionState == ConnectionState.done
          ) {
          return widget.view(snapshot.data);
        } else if(snapshot.data is RequestError) {
            RequestError requestError = snapshot.data as RequestError;
            return RefreshIndicator(
              onRefresh: onRefresh,
              child: requestError.swipeError!,
            );
        } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
        }
      }
    );
  }

  Future<void> onRefresh() async {
    setState(() {});
  }
}