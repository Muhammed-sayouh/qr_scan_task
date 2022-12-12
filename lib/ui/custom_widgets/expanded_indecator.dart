import 'package:flutter/material.dart';

import '../theme/sizes/sizes.dart';

class ExpandEndecator extends StatelessWidget {
  const ExpandEndecator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width(context, 0.18),
      height: 7,
      decoration: BoxDecoration(color:Colors.grey[300], 
      borderRadius: BorderRadius.circular(10)
      ),
      child: const Text(""),
    );
  }
}
