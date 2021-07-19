# design_raptor

It is powerfull, easy for flutter/dart project to design screens. It Support lazy loading, new button, and awesome dialog box help user to display message while performing operation. While performing any task user can't go back.

## Getting Started

# Add Dependency:
    dependecies: 
        design_raptor: 0.0.1

# Super Simple to use:

This is Lazy Loading support:

    RaptorLoading(
        shrinkWrap: true,
        listDetail: data,
        itemBuilder: (context, index) {
          return ListTile(title: Text('$index'));
        },
      )

This is for button design:

    RaptorButton(
          icon: Icon(Icons.home),
          color: Colors.red,
          onSubmit: () => print("hello"),
          title: "Demo",
        )

This is for Dialog box design:

    raptorDialogView(
              context: context, message: "Please Wait while We perform")
