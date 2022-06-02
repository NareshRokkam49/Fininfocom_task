import 'package:flutter/material.dart';
import 'package:newtask/newclass.dart';
import 'package:newtask/style.dart';

class ValidationTask extends StatefulWidget {
  const ValidationTask({Key? key}) : super(key: key);

  @override
  State<ValidationTask> createState() => _ValidationTaskState();
}

class _ValidationTaskState extends State<ValidationTask> {
  var _formkey = GlobalKey<FormState>();
  TextEditingController _email = TextEditingController();
  TextEditingController _number = TextEditingController();
  List<String> data = [];
  List<Validationinfo> name = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Validation Task"),
        centerTitle: true,
      ),
      body: Form(
        key: _formkey,
        child: Container(
          child: Column(
            children: [
              emailwidget(),
              phonenumberwidget(),
              buttonwidget(),
              listdatawidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget emailwidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Email",
            labelStyle: colorstyle),
        validator: (value) {
          if (value!.isEmpty) {
            return "Please enter email";
          } else if (!checkemailvalidation(value)) {
            return "Please enter valid email";
          } else {
            final emailItem =
                this.name.where((element) => element.email == value);
            if (emailItem.length != 0) {
              return "This email already exits";
            }
            return null;
          }
        },
        controller: _email,
      ),
    );
  }

  Widget phonenumberwidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Phone Number",
            prefixText: "+91",
            prefixStyle: colorstyle,
            labelStyle: colorstyle),
        validator: (value) {
          if (value!.isEmpty) {
            return "Please Enter Phone Number";
          } else if (!checkphonenovalidation(value)) {
            return "Please enter valid phone number";
          } else if (value.length != 10) {
            return 'Please Enter 10 digits Number ';
          } else {
            final phoneItems =
                this.name.where((element) => element.phonenumber == value);
            if (phoneItems.length != 0) {
              return "This phone number already exits";
            }
            return null;
          }
        },
        controller: _number,
      ),
    );
  }

  Widget buttonwidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          onPressed: () {
            final _validate = _formkey.currentState!.validate();
            if (!_validate) {
              return;
            }
            _formkey.currentState!.save();
            setState(() {
              name.add(Validationinfo(_email.text, _number.text));

              _email.text = "";
              _number.text = "";
            });
          },
          child: Text("Submit", style: submitstyle)),
    );
  }

  Widget listdatawidget() {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
          itemCount: name.length,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    name[index].email,
                    style: colorstyle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    name[index].phonenumber,
                    style: colorstyle,
                  ),
                ),
              ],
            );
          }),
    ));
  }
}
