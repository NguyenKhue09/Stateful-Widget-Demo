import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  final int counter = 0;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late int _counter;
  final _formKey = GlobalKey<FormState>();
  final _passwordFocus = FocusNode();
  final _btnLoginFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    _counter = widget.counter;
  }

  void _submitForm() async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) return;
    _formKey.currentState!.save();
  }

  void _incrementCounter() {
    setState(() {
      _counter += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Stateful Widget Demo"),
          centerTitle: true,
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              const Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 64.0),
                  child: Text(
                    "REGISTER",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, top: 64.0, right: 16.0, bottom: 8.0),
                child: TextFormField(
                  initialValue: "",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    // fontWeight: FontWeight.bold,
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    labelStyle: TextStyle(color: Colors.black, fontSize: 14),
                    hintText: "Type your user name",
                    fillColor: Colors.black87,
                    focusColor: Colors.black87,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.black),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.black),
                    ),
                  ),
                  cursorColor: Colors.black,
                  textInputAction: TextInputAction.next,
                  maxLines: 1,
                  keyboardType: TextInputType.text,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context)
                        .requestFocus(_passwordFocus); // next TextField
                  },
                  validator: (value) {
                    if (value!.isEmpty) return 'Vui lòng điền tên.';
                    return null; // Correct input
                  },
                  onSaved: (value) {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, top: 32.0, right: 16.0, bottom: 32.0),
                child: TextFormField(
                  initialValue: "",
                  obscureText: true,
                  focusNode: _passwordFocus,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    // fontWeight: FontWeight.bold,
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.black, fontSize: 14),
                    hintText: "Type your password",
                    fillColor: Colors.black87,
                    focusColor: Colors.black87,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.black),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.black),
                    ),
                  ),
                  cursorColor: Colors.black,
                  textInputAction: TextInputAction.next,
                  maxLines: 1,
                  keyboardType: TextInputType.visiblePassword,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context)
                        .requestFocus(_btnLoginFocus); // next TextField
                  },
                  validator: (value) {
                    if (value!.isEmpty) return 'Vui lòng nhập mật khẩu';
                    return null; // Correct input
                  },
                  onSaved: (value) {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  focusNode: _btnLoginFocus,
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30.0),
                        ),
                      ),
                    ),
                    elevation: MaterialStateProperty.all(0.0),
                    splashFactory: NoSplash.splashFactory,
                  ),
                  onPressed: () {
                    _submitForm();
                  },
                  child: Ink(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF67D4E0), Color(0xFFE137EE)],
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      alignment: Alignment.center,
                      child: const Text(
                        'REGISTER',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class IProfile {
  final String username;
  final String password;
  final int age;


  IProfile({
    required this.username,
    required this.password,
    required this.age
  });
}
