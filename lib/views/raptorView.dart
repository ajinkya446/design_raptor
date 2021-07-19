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
  final String title;
  final VoidCallback onSubmit;
  final String? fontFamily;
  RaptorButton(
      {this.height,
      this.width,
      this.icon,
      this.color,
      required this.title,
      required this.onSubmit,
      this.fontFamily});
  @override
  _RapptorButtonState createState() => _RapptorButtonState();
}

class _RapptorButtonState extends State<RaptorButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onSubmit,
      child: Container(
        height: widget.height ?? 50,
        width: widget.width ?? 120,
        decoration: BoxDecoration(
            color: widget.color ?? Colors.blue,
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.icon ?? Icon(Icons.add),
            SizedBox(
              width: 20,
            ),
            Text(
              widget.title,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  fontFamily: widget.fontFamily ?? ''),
            )
          ],
        ),
      ),
    );
  }
}

Future<bool> onWillPop() async {
  return false;
}

///
/// Raptor Dialog Box helps to display loading dialog with an indicator and message
///
/// User can't go back while dialog box is displaying on screen.
raptorDialogView(
    {required BuildContext context,
    required String message,
    String? fontFamily}) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (ctx) {
        return WillPopScope(
            child: Container(
                height: double.maxFinite,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: SimpleDialog(
                    backgroundColor: Colors.grey.withOpacity(0.5),
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            message,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                fontFamily: fontFamily ?? ''),
                          )
                        ],
                      )
                    ])),
            onWillPop: onWillPop);
      });
}

