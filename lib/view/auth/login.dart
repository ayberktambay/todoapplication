import 'package:flutter/material.dart';
class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

  List<dynamic> themes = [
    {"icon": Icon(Icons.light_mode),"id": 0,"name": "Light Theme"},
    {"icon": Icon(Icons.dark_mode),"id": 1,"name": "Dark Theme"},
    {"icon": Icon(Icons.phone_iphone),"id": 2,"name": "System Theme"},
  ];
class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  dynamic selectedTheme = themes[0];
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var dW = MediaQuery.of(context).size.width;
   // var dH = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           DropdownButton(
             value: selectedTheme,
             underline: SizedBox(),
             items: themes.map((e) {
             return DropdownMenuItem(
               value: e,
               child: Row(
                 children: [
                   e['icon'],
                   SizedBox(width: 5,),
                   Text(e['name'], style: theme.textTheme.bodyLarge,),
                 ],
               ),
             );
           }).toList(), onChanged: (value) {
             setState(() { selectedTheme = value;  });
           },),
           Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: theme.cardColor,
            ),
            width: dW * 0.9,
            padding: const EdgeInsets.all(8),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
           ),
           SizedBox(height:24),
            Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: theme.cardColor,
            ),
            width: dW * 0.9,
            padding: const EdgeInsets.all(8),
            child: TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
           ),
            SizedBox(height:24),
            Container(
            width: dW * 0.9,
            padding: const EdgeInsets.all(8),
            child: TextButton(onPressed: (){
              // Handle login action here
              Navigator.pushNamed(context, '/home');
            }, child: Text("Login", style: theme.textTheme.bodyLarge?.copyWith(color: Colors.white),), 
            ),
           )
           
          ],
        ),
      ),
    );
  }
}