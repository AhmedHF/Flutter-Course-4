import 'package:flutter/material.dart';
import 'package:course_4_tasks/core/extensions/extensions.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  bool agreedToTerms = false;
  bool _obscureText = true;
  bool _obscureTextConfirm = true;
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmpassword = TextEditingController();

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _toggleConfirm() {
    setState(() {
      _obscureTextConfirm = !_obscureTextConfirm;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Scrollbar(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                children: <Widget>[
                  // Add TextFormFields and ElevatedButton here.
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      border: const OutlineInputBorder(),
                      filled: true,
                      hintText: 'Your Name',
                      labelText: 'Name',
                      prefixIcon: Icon(Icons.person),
                    ),
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value!.isValidName) {
                        return null;
                      } else {
                        return 'Please enter a valid name ( First and Last )';
                      }
                    },
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      border: const OutlineInputBorder(),
                      filled: true,
                      hintText: 'Your Phone number',
                      labelText: 'Phone',
                      prefixIcon: Icon(
                        Icons.phone,
                      ),
                    ),
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value!.isValidPhone) {
                        return null;
                      } else {
                        return 'Please enter a valid phone';
                      }
                    },
                  ),
                  const SizedBox(
                    height: 24,
                  ),
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
                    height: 24,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: _obscureText,
                    controller: password,
                    textInputAction: TextInputAction.next,
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
                    height: 24,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: _obscureTextConfirm,
                    controller: confirmpassword,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      filled: true,
                      hintText: 'Your Password',
                      labelText: 'Confirm Password',
                      prefixIcon: Icon(
                        Icons.lock,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureTextConfirm
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: _toggleConfirm,
                      ),
                    ),
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value!.isValidPassword) {
                        if (password.text != confirmpassword.text) {
                          return "Password does not match";
                        }
                        return null;
                      } else {
                        return 'Password must contain an uppercase, lowercase, \nnumeric digit and special character';
                      }
                    },
                  ),

                  const SizedBox(
                    height: 24,
                  ),
                  // A custom form field that requires the user to check a
                  // checkbox.
                  FormField<bool>(
                    initialValue: false,
                    validator: (value) {
                      if (value == false) {
                        return 'You must agree to the terms of service.';
                      }
                      return null;
                    },
                    builder: (formFieldState) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: agreedToTerms,
                                onChanged: (value) {
                                  // When the value of the checkbox changes,
                                  // update the FormFieldState so the form is
                                  // re-validated.
                                  formFieldState.didChange(value);
                                  setState(() {
                                    agreedToTerms = value!;
                                  });
                                },
                              ),
                              Text(
                                'I agree to the terms of service.',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                            ],
                          ),
                          if (!formFieldState.isValid)
                            Text(
                              formFieldState.errorText ?? "",
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(
                                      color: Theme.of(context).errorColor),
                            ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(
                    height: 24,
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
                            title: const Text('Register'),
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
                                            Text('your successfully Register')),
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
                      child: const Text('Register',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
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
