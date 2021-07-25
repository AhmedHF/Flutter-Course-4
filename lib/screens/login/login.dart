import 'package:course_4_tasks/screens/forgetPassword/forgetPassword.dart';
import 'package:course_4_tasks/screens/register/register.dart';
import 'package:flutter/material.dart';
import 'package:course_4_tasks/core/extensions/extensions.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool rememberMe = false;
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Login')),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Scrollbar(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                children: <Widget>[
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
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: _obscureText,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      filled: true,
                      hintText: 'Your Password',
                      labelText: 'Password',
                      prefixIcon: Icon(
                        Icons.lock,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: _toggle,
                      ),
                    ),
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value!.isValidPassword) {
                        return null;
                      } else {
                        return 'Password must contain an uppercase, lowercase, \nnumeric digit and special character';
                      }
                    },
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: rememberMe,
                        onChanged: (value) {
                          setState(() {
                            rememberMe = value!;
                          });
                        },
                      ),
                      Text(
                        'Remember me',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 10,
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
                            title: const Text('Login'),
                            content: const Text(
                                ' Are you sure you want to sing in?'),
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
                                        content:
                                            Text(' your successfully login')),
                                  );
                                  // Navigator.pop(context, 'OK');
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
                      child: const Text('Login',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ForgetPasswordScreen(),
                          ));
                    },
                    child: const Text('Forget Password',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have an account?',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => RegisterScreen(),
                              ));
                        },
                        child: Text('Register Now',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.redAccent)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
