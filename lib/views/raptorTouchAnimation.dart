part of design_raptor;

class RaptorTouchAnimation extends StatefulWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final double? startAnimationSize, stopAnimationSize;
  final Color defaultColor, animatedColor;

  RaptorTouchAnimation(
      {required this.onPressed,
      required this.icon,
      this.startAnimationSize,
      this.stopAnimationSize,
      required this.defaultColor,
      required this.animatedColor});

  @override
  _RaptorTouchAnimationState createState() => _RaptorTouchAnimationState();
}

class _RaptorTouchAnimationState extends State<RaptorTouchAnimation>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Color?> colorAnimation;
  late Animation<double> sizeAnimation;
  bool statusAnimation = false;

  @override
  void initState() {
    controller =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);

    colorAnimation =
        ColorTween(begin: widget.defaultColor, end: widget.animatedColor)
            .animate(controller);

    sizeAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
          tween: Tween(
              begin: widget.startAnimationSize ?? 20,
              end: widget.stopAnimationSize ?? 50),
          weight: 50),
      TweenSequenceItem<double>(
          tween: Tween(
              begin: widget.stopAnimationSize ?? 50,
              end: widget.startAnimationSize ?? 20),
          weight: 50)
    ]).animate(controller);

    controller.addStatusListener((status) {
      status == AnimationStatus.completed
          ? statusAnimation = true
          : statusAnimation = false;
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, _) {
          return IconButton(
            onPressed: () {
              statusAnimation ? controller.reverse() : controller.forward();
              setState(() {});
              widget.onPressed();
            },
            icon: Icon(
              widget.icon,
              size: sizeAnimation.value,
              color: colorAnimation.value,
            ),
          );
        });
  }
}
