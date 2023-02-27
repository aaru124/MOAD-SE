import 'package:flutter/material.dart';
import 'package:flutter_application_1/student/pages/feed/model/user_model.dart';
import 'package:flutter_application_1/student/pages/feed/view/widgets/user_details.dart';

/*class UserDetailsWithFollowKeys {
  static final ValueKey userDetails = ValueKey("UserDetails");
  static final ValueKey follow = ValueKey("follow");
}

class UserDetailsWithFollow extends StatelessWidget {
  final String userData;

  const UserDetailsWithFollow({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          flex: 2,
          child: UserDetails(
            key: UserDetailsWithFollowKeys.userDetails,
            userData: userData,
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            key: UserDetailsWithFollowKeys.follow,
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: Icon(Icons.group_add),
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }
}
*/