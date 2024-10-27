import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class LoginScreenTopImage extends StatelessWidget {
  const LoginScreenTopImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "LOGIN",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: defaultPadding * 2),
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 8,
              child: Image.network("https://img.freepik.com/free-vector/tiny-doctors-examining-huge-patients-face-before-surgery-plastic-surgeon-drawing-incision-lines-womans-face-preparing-esthetic-surgery-flat-vector-illustration-cosmetic-operation-concept_74855-22566.jpg?t=st=1729945555~exp=1729949155~hmac=2a290cfb86548474a04b5df9b16e9b7936c4edd535de682e1ee9fadbfc561205&w=1060"),
            ),
            const Spacer(),
          ],
        ),
        const SizedBox(height: defaultPadding * 2),
      ],
    );
  }
}