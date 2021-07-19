part of design_raptor;

///
///This Helps to provide lazy loading support to load minimum number of items on screen.
///
/// used to get the list of information [listDetail]  need to load on listview builder.
///
///[itemBuilder] used to perform the build functionality to get the spacific widget you want to display on UI
///
///[shrinkWrap] is used to shrink the list
///
///[itemExtent] is used to load list items as per the device size.
///

class RaptorLoading extends StatefulWidget {
  final List listDetail;
  final int loadCount;
  final bool? isShwon;
  final IndexedWidgetBuilder itemBuilder;
  final bool? shrinkWrap;
  final double? itemExtent;
  RaptorLoading(
      {required this.listDetail,
      required this.loadCount,
      this.isShwon,
      required this.itemBuilder,
      this.shrinkWrap,
      this.itemExtent});

  @override
  _RaptorLoadingState createState() => _RaptorLoadingState();
}

class _RaptorLoadingState extends State<RaptorLoading> {
  ScrollController scrollController = ScrollController();
  int maxLength = 10, tempLength = 10;

  ///
  ///Adding the scroll controller listener to listen the position of the list that user scrolls.
  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        getMoreListItems();
      }
    });
    super.initState();
  }

//Getting and adding the items in the list by 10
  getMoreListItems() {
    for (int i = maxLength; i < maxLength + widget.loadCount; i++) {
      if (maxLength != widget.listDetail.length) {
        tempLength = tempLength + 1;
      }
    }
    maxLength = tempLength;
    setState(() {});
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      isAlwaysShown: widget.isShwon,
      child: ListView.builder(
          controller: scrollController,
          itemExtent: widget.itemExtent ?? 80,
          shrinkWrap: widget.shrinkWrap ?? false,
          itemCount: maxLength,
          itemBuilder: widget.itemBuilder),
    );
  }
}
