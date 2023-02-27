import 'package:flutter/material.dart';
import 'package:flutter_application_1/student/pages/feed/model/user_model.dart';

class InheritedUserModel extends InheritedWidget {
  final String userData;
  final Widget child;

InheritedUserModel({super.key,  required this.userData,required this.child,})
      : super(child: child);
  
static InheritedUserModel? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedUserModel>();
  }

  static InheritedUserModel of(BuildContext context) {
    final InheritedUserModel? result = maybeOf(context);
    assert(result != null, 'No FrogColor found in context');
    return result!;
  }
  @override
  bool updateShouldNotify(InheritedUserModel oldWidget) {
    return true;
  }
}
