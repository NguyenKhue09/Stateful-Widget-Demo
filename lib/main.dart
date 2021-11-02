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
  final int age = 0;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late int _age;
  bool isSubmit = false;
  final _formKey = GlobalKey<FormState>();
  final _passwordFocus = FocusNode();
  final _btnLoginFocus = FocusNode();
  final userNameCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _age = widget.age;
    print("Khởi tạo state");
  }

  @override
  void didUpdateWidget(covariant MyHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("StatefulWidget bị loại bỏ");
  }

  @override
  void dispose() {
    super.dispose();
    print("Đối tượng State bị loại bỏ");
  }

  void _submitForm() async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) return;
    _formKey.currentState!.save();
    await _showMyDialog();
  }

  void _incrementAge() {
    setState(() {
      if(_age < 150) {
        _age += 1;
      }
    });
  }

  void _decrementAge() {
    setState(() {
      if(_age > 0) {
        _age -= 1;
      }
    });
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Register successful'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text("Username: ${userNameCtrl.text}"),
                Text("Password: ${passwordCtrl.text}"),
                Text("Age: $_age"),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK', style: TextStyle(color: Colors.black),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {

    print("Build lại UI");

    return Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
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
                  controller: userNameCtrl,
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
                    if (value!.isEmpty) return 'Please type your user name';
                    return null; // Correct input
                  },
                  onSaved: (value) {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, top: 32.0, right: 16.0, bottom: 32.0),
                child: TextFormField(
                  controller: passwordCtrl,
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
                    if (value!.isEmpty) return 'Please type your password';
                    return null; // Correct input
                  },
                  onSaved: (value) {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0, bottom: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                        "Age: ",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Container(
                        height: 50,
                        width: 100,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          gradient: LinearGradient(
                            colors: [Color(0xFF67D4E0), Color(0xFFE137EE)],
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                                onTap: () {_decrementAge();},
                                child: const Icon(Icons.remove, color: Colors.white)
                            ),
                            Text(
                                "$_age",
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                                ),
                            ),
                            GestureDetector(
                                onTap: () {_incrementAge();},
                                child: const Icon(Icons.add, color: Colors.white)
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
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
                    //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const LoginPage()));
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


