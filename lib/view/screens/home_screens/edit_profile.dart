import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
            width: media.height * 0.10,
            height: media.height * 0.10,
            child: Stack(
              children: [
                const Image(
                  fit: BoxFit.contain,
                  image: AssetImage('assets/images/logo.png'),
                ),
                Icon(
                  Icons.camera,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
