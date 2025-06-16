import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:litera_app/core/theme/app_pallete.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isUsernameValid = false;
  bool _isEmailValid = false;
  bool _isPasswordValid = false;

  void _validateInputs() {
    setState(() {
      _isUsernameValid = _usernameController.text.isNotEmpty;
      _isEmailValid = _emailController.text.contains('@') && 
                      _emailController.text.contains('.com');
      _isPasswordValid = _passwordController.text.length >= 8;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Daftar Akun',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Pallete.textColor,
                ),
              ),
              const SizedBox(height: 20),
              // StepProgressIndicator(),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                        ),
                        suffixIcon: _isUsernameValid 
                          ? Icon(Icons.check, color: Colors.green)
                          : null,
                      ),
                      onChanged: (value) => _validateInputs(),
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                        ),
                        suffixIcon: _isEmailValid 
                          ? Icon(Icons.check, color: Colors.green)
                          : null,
                      ),
                      onChanged: (value) => _validateInputs(),
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                        ),
                        suffixIcon: _isPasswordValid 
                          ? Icon(Icons.check, color: Colors.green)
                          : null,
                      ),
                      onChanged: (value) => _validateInputs(),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Lakukan proses pendaftaran di sini
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF6B2D3A),
                        minimumSize: Size(double.infinity, 50),
                      ),
                      child: const Text(
                        'Lanjut',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
              // const SizedBox(height: 15),
              // Row(
              //   children: [
              //     Expanded(
              //       child: Divider(
              //         color: Colors.grey,
              //         thickness: 1,
              //       ),
              //     ),
              //     Padding(
              //       padding: const EdgeInsets.symmetric(horizontal: 10),
              //       child: Text(
              //         'Atau',
              //         style: TextStyle(color: Colors.grey),
              //       ),
              //     ),
              //     Expanded(
              //       child: Divider(
              //         color: Colors.grey,
              //         thickness: 1,
              //       ),
              //     ),
              //   ],
              // ),
              const SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(text: 'Sudah punya akun? '),
                    TextSpan(
                      text: 'Log In',
                      style: TextStyle(
                        color: Colors.red,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pop(context);
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class StepProgressIndicator extends StatelessWidget {
//   const StepProgressIndicator({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Container(
//           width: 40,
//           alignment: Alignment.center,
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             color: Colors.red,
//           ),
//           child: Text(
//             '1',
//             style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//           ),
//         ),
//         Container(
//           height: 2,
//           width: 80,
//           color: Colors.red,
//         ),
//         Container(
//           width: 40,
//           alignment: Alignment.center,
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             color: Colors.grey,
//           ),
//           child: Text(
//             '2',
//             style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
//           ),
//         ),
//       ],
//     );
//   }
// }