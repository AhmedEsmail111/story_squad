import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentMethodItem extends StatelessWidget {
  final String image;
  final bool isActive;
  final void Function()? onTap;
  const PaymentMethodItem(
      {super.key, required this.image, required this.isActive, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        height: 90,
        width: 150,
        decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(
                color: isActive
                    ? const Color(0xff34A853)
                    : Colors.black.withOpacity(0.5),
                width: isActive ? 1.5 : 1,
              ),
            ),
            shadows: [
              BoxShadow(
                color: isActive ? const Color(0xff34A853) : Colors.black26,
                blurRadius: 4,
              )
            ]),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: Center(
            child: SvgPicture.asset(
              image,
            ),
          ),
        ),
      ),
    );
  }
}
