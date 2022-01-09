import 'package:flutter/material.dart';
import 'package:what_they_think/constants/background_color.dart';
import 'package:what_they_think/constants/texts.dart';

class Post extends StatefulWidget {
  const Post({Key? key}) : super(key: key);

  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  final _formKey = GlobalKey<FormState>();
  List<TextEditingController> textFieldControllers = [];
  int numberOfTextFields = 0;

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    /*void pushToFormPage(FormData formData) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HomePage(
                    formData: formData,
                  )));
    }*/

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: backGroundGradient()),
        child: ListView(children: [
          const SizedBox(
            height: 15,
          ),
          textPost("Title: ", 3, 50),
          const SizedBox(height: 50),
          textPost("Description", 8, 300),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Options",
                style: myStyle.copyWith(fontSize: 18),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "At Least 2 Options If You Want to "
                  "Add Option Use Add Button",
                  style: myStyle.copyWith(fontSize: 13),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: options(1),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: options(2),
              ),
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: numberOfTextFields,
                itemBuilder: (BuildContext context, int index) {
                  return TextFormField(
                    validator: (var value) {},
                    controller: textFieldControllers[index],
                    autofocus: false,
                    textAlign: TextAlign.center,
                    style: myStyle.copyWith(fontSize: 16),
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "Option $numberOfTextFields",
                      filled: true,
                      isDense: false,
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.cyan,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                  );
                },
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                ElevatedButton.icon(
                  onPressed: () {
                    addNewTextField();
                    // Respond to button press
                  },
                  icon: const Icon(Icons.add, size: 18),
                  label: const Text("ADD OPTION"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.cyan,
                    textStyle: myStyle,
                  ),
                ),
                const SizedBox(width: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    deleteTextField();
                    // Respond to button press
                  },
                  icon: const Icon(Icons.delete, size: 18),
                  label: const Text("Delete OPTION"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.cyan,
                    textStyle: myStyle,
                  ),
                ),
              ]),
            ],
          )
        ]),
      ),
    );
  }

  textPost(String text, int lines, int textLength) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 80,
          height: 15,
          child: Text(
            text,
            style: myStyle,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: TextFormField(
            autofocus: false,
            textAlignVertical: TextAlignVertical.bottom,
            style: myStyle.copyWith(fontSize: 16),
            maxLength: textLength,
            maxLines: lines,
            decoration: const InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 1),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                  borderRadius: BorderRadius.all(Radius.circular(3))),
            ),
          ),
        ),
      ],
    );
  }

  options(int txt) {
    return TextFormField(
      autofocus: false,
      textAlign: TextAlign.center,
      style: myStyle.copyWith(fontSize: 16),
      maxLines: 1,
      decoration: InputDecoration(
        hintText: "Option $txt",
        filled: true,
        isDense: false,
        border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.cyan,
              width: 2,
            ),
            borderRadius: BorderRadius.all(Radius.circular(20))),
      ),
    );
  }

  void addNewTextField() {
    textFieldControllers.add(TextEditingController());
    numberOfTextFields++;
    setState(() {});
  }

  void deleteTextField() {
    textFieldControllers.add(TextEditingController());
    numberOfTextFields--;
    setState(() {});
  }

  @override
  void dispose() {
    for (var textFieldController in textFieldControllers) {
      textFieldController.dispose();
    }
    super.dispose();
  }
}
