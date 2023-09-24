import 'package:flutter/material.dart';

class AnimatingHomeBackground extends StatefulWidget {
  const AnimatingHomeBackground({super.key});

  @override
  State<AnimatingHomeBackground> createState() =>
      _AnimatingHomeBackgroundState();
}

class _AnimatingHomeBackgroundState extends State<AnimatingHomeBackground>
    with TickerProviderStateMixin {
  late ColorTween darkColorTween;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();
    ba = CurvedAnimation(parent: _animationController, curve: Curves.easeIn);
  }

  late Animation<double> ba;

  late AnimationController _animationController;

  AlignmentTween aT =
      AlignmentTween(begin: Alignment.topRight, end: Alignment.topLeft);
  AlignmentTween aB =
      AlignmentTween(begin: Alignment.bottomRight, end: Alignment.bottomLeft);

  Animatable<Color> darkBackground = TweenSequence<Color>(
    [
      TweenSequenceItem(
        weight: .5,
        tween: Tween<Color>(
            begin: Colors.green, end: Colors.red),
      ),
      TweenSequenceItem(
          weight: .5,
          tween: Tween<Color>(
              begin: Colors.red, end: Colors.green)),
    ],
  );

  Animatable<Color> normalBackground = TweenSequence<Color>(
    [
      TweenSequenceItem(
        weight: .5,
        tween: Tween<Color>(
            begin: smalt.withOpacity(.6), end: oldRose.withOpacity(.6)),
      ),
      TweenSequenceItem(
          weight: .5,
          tween: Tween<Color>(
              begin: oldRose.withOpacity(.6), end: smalt.withOpacity(.6))),
    ],
  );

  Animatable<Color> lightBackground = TweenSequence<Color>(
    [
      TweenSequenceItem(
          weight: .5,
          tween: Tween<Color>(
              begin: smalt.withOpacity(.4), end: oldRose.withOpacity(.4))),
      TweenSequenceItem(
          weight: .5,
          tween: Tween<Color>(
              begin: oldRose.withOpacity(.4), end: smalt.withOpacity(.4))),
    ],
  );

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    double _h = MediaQuery.of(context).size.height;

    final darkColorTween = ColorTween(
  begin: smalt.withOpacity(0.8),
  end: oldRose.withOpacity(0.8),
);

// final normalColorTween = ColorTween(
//   begin: Colors.green,
//   end: Colors.red,
// );
final normalColorTween = ColorTween(
  begin: smalt.withOpacity(0.6),
  end: oldRose.withOpacity(0.6),
);

final lightColorTween = ColorTween(
  begin: smalt.withOpacity(0.4),
  end: oldRose.withOpacity(0.4),
);

final colorsList = [
  darkColorTween.evaluate(_animationController),
  normalColorTween.evaluate(_animationController),
  lightColorTween.evaluate(_animationController),
];


    return AnimatedBuilder(
      animation: ba,
      builder: (context, child) {
        return Container(
          width: _w,
          height: _h,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: aT.evaluate(ba),
              end: aB.evaluate(ba),
              colors: [
                darkBackground.evaluate(ba),
                normalBackground.evaluate(ba),
                lightBackground.evaluate(ba)
                // colorsList[0] as Color,
                // colorsList[1] as Color,
                // colorsList[2] as Color
              ],
            ),
          ),
        );
      },
    );
  }
}

Color smalt = Color(0xff121856);
Color oldRose = Color(0xffD23756);

//-------------------------------------------------------------------------------------------------

class AnimatedGradientBackground extends StatefulWidget {
  @override
  _AnimatedGradientBackgroundState createState() =>
      _AnimatedGradientBackgroundState();
}

class _AnimatedGradientBackgroundState extends State<AnimatedGradientBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 7),
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  LinearGradient createGradient(double t) {
    final colors = [
      Color.lerp(smalt.withOpacity(.8), oldRose.withOpacity(.8), t),
      Color.lerp(oldRose.withOpacity(.8), smalt.withOpacity(.8), t),
      Color.lerp(smalt.withOpacity(.6), oldRose.withOpacity(.6), t),
      Color.lerp(oldRose.withOpacity(.6), smalt.withOpacity(.6), t),
      Color.lerp(smalt.withOpacity(.4), oldRose.withOpacity(.4), t),
      Color.lerp(oldRose.withOpacity(.4), smalt.withOpacity(.4), t),
    ];

    return LinearGradient(
      colors: colors
          .where((color) => color != null)
          .map((color) => color!)
          .toList(),
      begin: Alignment.center,
      end: Alignment.bottomCenter,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        final gradient = createGradient(_animation.value);
        return Container(
          decoration: BoxDecoration(
            gradient: gradient,
          ),
          // Add your other UI components here
        );
      },
    );
  }
}

// _darkColor = TweenSequence<Color>(
//   [
//     TweenSequenceItem(
//     weight: .5,
//     tween: ColorTween(begin: smalt.withOpacity(.8), end: oldRose.withOpacity(.8)),
//   ),
//   TweenSequenceItem(
//     weight: .5,
//     tween: Tween<Color>(begin: oldRose.withOpacity(.8), end: smalt.withOpacity(.8))
//   ),
//   ]
// ).animate(_controller);

// _normalColor = TweenSequence<Color>(
//   [
//     TweenSequenceItem(
//     weight: .5,
//     tween: Tween<Color>(begin: smalt.withOpacity(.6), end: oldRose.withOpacity(.6)),
//   ),
//   TweenSequenceItem(
//     weight: .5,
//     tween: Tween<Color>(begin: oldRose.withOpacity(.6), end: smalt.withOpacity(.6))
//   ),
//   ]
// ).animate(_controller);

// _lightColor = TweenSequence<Color>(
//   [
//     TweenSequenceItem(
//     weight: .5,
//     tween: Tween<Color>(begin: smalt.withOpacity(.4), end: oldRose.withOpacity(.6)),
//   ),
//   TweenSequenceItem(
//     weight: .5,
//     tween: Tween<Color>(begin: oldRose.withOpacity(.6), end: smalt.withOpacity(.6))
//   ),
//   ]
// ).animate(_controller);
