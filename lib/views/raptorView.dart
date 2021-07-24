part of design_raptor;

///
///This Button helps to create the custom button with icon
///and you can provide color and callback method to it
///
/// It Helps to provide an icon to the button[icon]
///
/// [onSubmit] is used to perform an operation on the button pressed.
///
/// [fontFamily],[color],[height],[width] is not required it depsnds on user to design such things
class RaptorButton extends StatefulWidget {
  final double? height, width;
  final Icon? icon;
  final Color? color;
  final VoidCallback onSubmit;
  final Text buttonText;
  RaptorButton(
      {this.height,
      this.width,
      this.icon,
      this.color,
      required this.onSubmit,
      required this.buttonText});
  @override
  _RapptorButtonState createState() => _RapptorButtonState();
}

class _RapptorButtonState extends State<RaptorButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onSubmit,
      child: Container(
        height: widget.height ?? MediaQuery.of(context).size.height * 0.05,
        width: widget.width ?? MediaQuery.of(context).size.width * 0.26,
        decoration: BoxDecoration(
            color: widget.color ?? Colors.blue,
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.icon ??
                Icon(
                  Icons.add,
                  size: 20,
                ),
            widget.buttonText
          ],
        ),
      ),
    );
  }
}

///
///Animated Dialog box to display element on dialogbox
///
///[dialogText] used for display the text on dialog box
///
///[size] contains the size like height and width as per differnt device size
///
class RaptorDialog extends StatefulWidget {
  final Text dialogText;
  final Size size;
  RaptorDialog({required this.dialogText, required this.size});
  @override
  State<StatefulWidget> createState() => RaptorDialogState();
}

class RaptorDialogState extends State<RaptorDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;
  late Animation<double> height, width;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    height = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
          tween: Tween(begin: 10, end: widget.size.height * 0.25), weight: 50)
    ]).animate(controller);

    width = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
          tween: Tween(begin: 10, end: widget.size.width * 0.7), weight: 50)
    ]).animate(controller);
    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: WillPopScope(
            onWillPop: onWillPop,
            child: ScaleTransition(
              scale: scaleAnimation,
              child: Container(
                height: height.value,
                width: width.value,
                decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                child: height.value == widget.size.height * 0.25
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.red),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Wrap(
                              children: [widget.dialogText],
                            ),
                          )
                        ],
                      )
                    : Container(),
              ),
            )),
      ),
    );
  }

  Future<bool> onWillPop() async {
    return false;
  }
}




 // Container(
            //     height: 200,
            //     child: Hero(
            //       tag: 'flutterLogo',
            //       child: GestureDetector(
            //         onTap: () {
            //           Navigator.push(
            //               context,
            //               MaterialPageRoute(
            //                   builder: (BuildContext context) => Details()));
            //         },
            //         child: FlutterLogo(
            //           size: 100,
            //         ),
            //       ),
            //     )),
            // AnimatedContainer(
            //     color: colorContainer,
            //     height: height,
            //     duration: Duration(seconds: 1),
            //     child: TweenAnimationBuilder(
            //       tween: Tween<double>(begin: 0, end: 1),
            //       duration: Duration(seconds: 2),
            //       child: ListView.builder(
            //           itemCount: 10,
            //           itemBuilder: (context, index) {
            //             return Container(
            //               height: 60,
            //               child: Card(
            //                 color: Colors.blue,
            //                 child: ListTile(
            //                   title: Text('$index'),
            //                   trailing: Text("Price: 1200.00 Rs"),
            //                   leading: AnimatedBuilder(
            //                       animation: controller,
            //                       builder: (BuildContext context, _) {
            //                         return IconButton(
            //                           onPressed: () {
            //                             statusAnimation
            //                                 ? controller.reverse()
            //                                 : controller.forward();
            //                             setState(() {});
            //                           },
            //                           icon: Icon(
            //                             Icons.home,
            //                             size: sizeAnimation.value,
            //                             color: colorAnimation.value,
            //                           ),
            //                         );
            //                       }),
            //                 ),
            //               ),
            //             );
            //           }),
            //       builder: (context, double value, Widget child) {
            //         return Opacity(
            //           opacity: value,
            //           child: Padding(
            //             padding: EdgeInsets.only(top: value * 20),
            //             child: child,
            //           ),
            //         );
            //       },
            //     )),

            // Center(
      //     child: RaptorButton(
      //   onSubmit: () => raptorDialogView(
      //       context: context,
      //       dialogText: Text(
      //         "please Wait",
      //         style: TextStyle(fontSize: 20, color: Colors.blue),
      //       )),
      //   buttonText: Text("Demo"),
      // )
      //     child: RaptorLoading(
      //   loadCount: 3,
      //   shrinkWrap: true,
      //   listDetail: data,
      //   itemBuilder: (context, index) {
      //     return ListTile(
      //         trailing: Icon(Icons.time_to_leave),
      //         title: Text((index + 1).toString()));
      //   },
      // )
      // ),