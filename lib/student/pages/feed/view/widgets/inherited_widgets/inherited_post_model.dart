import 'package:flutter/material.dart';
//import 'package:flutter_application_1/student/pages/feed/model/post_model.dart';

class InheritedPostModel extends InheritedWidget {
  final String postData;
  final Widget child;

  InheritedPostModel({super.key,  required this.postData,required this.child,})
      : super(child: child);

  static InheritedPostModel? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedPostModel>();
  }

  static InheritedPostModel of(BuildContext context) {
    final InheritedPostModel? result = maybeOf(context);
    assert(result != null, 'No FrogColor found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(InheritedPostModel oldWidget) {
    return true;
  }
}
