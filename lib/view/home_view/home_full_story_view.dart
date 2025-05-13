import 'package:flutter/material.dart';
import 'package:social_media/res/appImage/App_images.dart';

class HomeFullStoryView extends StatelessWidget {
  const HomeFullStoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DraggableScrollableSheet(
        initialChildSize: 1.0,
        minChildSize: 0.7,
        maxChildSize: 1.0,
        expand: false,
        builder: (context, scrollController) {
          return Container(
            color: Colors.black, // background color
            child: Stack(
              children: [
                Center(
                  child: SizedBox(
                    width: double.infinity,
                    child: Image.asset(
                      AppImages.marcedes,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                Positioned(
                  top: 45,
                  left: 16,
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
