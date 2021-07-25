import 'package:flutter/material.dart';
import 'package:course_4_tasks/core/extensions/extensions.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Forget Password')),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Scrollbar(
              child: SingleChildScrollView(
                  padding: EdgeInsets.all(16),
                  child: Column(children: <Widget>[
                    Image(image: AssetImage('assets/images/dsc.jpeg')),
                    const SizedBox(
                      height: 20,
                    ),
                    // Add TextFormFields and ElevatedButton here.
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        border: const OutlineInputBorder(),
                        filled: true,
                        hintText: 'Your email address',
                        labelText: 'Email',
                        prefixIcon: Icon(
                          Icons.email,
                        ),
                      ),
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value!.isValidEmail) {
                          return null;
                        } else {
                          return 'Please enter a valid email';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(1000, 50),
                      ),
                      onPressed: () {
                        // Validate returns true if the form is valid, or false otherwise.
                        if (_formKey.currentState!.validate()) {
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('Forget Password'),
                              content: const Text(
                                  ' Are you sure you want to send code to your email?'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, 'Cancel'),
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'Successfully sent code to your email')),
                                    );
                                    Navigator.pop(context, 'OK');
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: const Text('Submit',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ]))),
        ),
      ),
    );
  }
}
