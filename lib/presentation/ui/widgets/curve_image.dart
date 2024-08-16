import 'package:flutter/material.dart';
import 'package:task_1_api_data_fetch/presentation/ui/utility/image_asset.dart';

class CurvedImageBottom extends StatelessWidget {
  const CurvedImageBottom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CurveClipper(),
      child: Image.asset(
        ImageAssets.nightMosqueImage,
        fit: BoxFit.cover,
        width: double.infinity,
      ),
    );
  }
}

class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height * 0.8); // Start at left bottom
    //U Shaped, just edit here size.height*value 
    path.quadraticBezierTo(size.width / 2, size.height * 1.05, size.width,
        size.height * 0.8); // Curve up (inverted control point)

// Opposite of U Shaped ,just edit here size.height*value 
/*   path.quadraticBezierTo(size.width / 2, size.height * 0.6, size.width,
        size.height * 0.8); // Curve up */
    path.lineTo(size.width, 0); // Go to top right
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
