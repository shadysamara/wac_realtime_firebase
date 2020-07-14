import 'package:flutter/material.dart';

class Group2Copy extends StatelessWidget {
  Group2Copy({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Transform.translate(
          offset: Offset(-0.59, 3.0),
          child:
              // Adobe XD layer: 'Rectangle-Copy-10' (group)
              Stack(
            children: <Widget>[
              Transform.translate(
                offset: Offset(0.59, 25.0),
                child: Container(
                  width: 162.0,
                  height: 92.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: const Color(0xffc60628),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0x0d000000),
                        offset: Offset(0, 13),
                        blurRadius: 16,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Transform.translate(
          offset: Offset(106.0, 47.0),
          child:
              // Adobe XD layer: 'Shri Spagetti' (text)
              Text(
            'خروف',
            style: TextStyle(
              fontFamily: 'GE SS Two',
              fontSize: 17,
              color: const Color(0xffffffff),
              letterSpacing: -0.4100000343322754,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        Transform.translate(
          offset: Offset(39.0, 87.0),
          child:
              // Adobe XD layer: 'Chicken World' (text)
              Text(
            'الأوزان المتاحة من ٨-١١٦ ك',
            style: TextStyle(
              fontFamily: 'GE SS Two',
              fontSize: 11,
              color: const Color(0xffffffff),
              letterSpacing: -0.0676923508644104,
              fontWeight: FontWeight.w300,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        Container(
          width: 90.0,
          height: 78.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage(''),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ],
    );
  }
}
