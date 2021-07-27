# design_raptor

It is powerfull, easy for flutter/dart project to design screens. It Support lazy loading, new button, and awesome dialog box help user to display message while performing operation. While performing any task user can't go back.

## Getting Started

# Add Dependency:
    dependecies: 
        design_raptor: 0.0.2+1

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
          title: Text("Demo"),
        )

This is for Dialog box design:

    ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (_) => RaptorDialog(
                        size: MediaQuery.of(context).size,
                        dialogText:
                            Text("Demo app", style: TextStyle(fontSize: 20))),
                  );
                },
                child: Text("Start Animation"))


Animated Icon button:

    RaptorTouchAnimation(
                onPressed: () => print("Hii"),
                animatedColor: Colors.red,
                defaultColor: Colors.grey,
                icon: Icons.topic,
                startAnimationSize: 30,
                stopAnimationSize: 50,
              )
