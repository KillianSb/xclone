import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});
  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final textControllerIdentifiant = TextEditingController();
  final textControllerMdp = TextEditingController();
  bool remeberMe = false;
  final _fromKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("Connexion a Twitter")),
        body: SafeArea(
          child: Column(
            children: [
              Form(
                  key: _fromKey,
                  child: Column(
                      children: [
                        TextFormField(
                            controller: textControllerIdentifiant,
                            keyboardType: TextInputType.name,
                            decoration:  const InputDecoration(
                                labelText: 'Identifiant',
                                hintText: "Entrez votre Identifiant"),
                            /*autovalidateMode: AutovalidateMode.onUserInteraction,*/
                            validator: (valueIdentifiant){
                              if (valueIdentifiant == null || valueIdentifiant.isEmpty == true){
                                return "Merci de compléter votre Identifiant !";
                              }
                              if (!RegExp(r"([a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,})").hasMatch(valueIdentifiant)){
                                return "Veuillez entrer un Identifiant valide !";
                              }
                              return null;
                            }
                        ),
                        TextFormField(
                            controller: textControllerMdp,
                            obscureText: true,
                            keyboardType: TextInputType.text,
                            decoration:  const InputDecoration(
                                labelText: 'Mots de passe',
                                hintText: "Entrez votre Mots de passe"),
                            /*autovalidateMode: AutovalidateMode.onUserInteraction,*/
                            validator: (valueMdp){
                              if (valueMdp == null || valueMdp.isEmpty == true){
                                return "Merci de compléter votre Mots de passe !";
                              }
                              if (!RegExp(r"^((?=\S*?[A-Z])(?=\S*?[a-z])(?=\S*?[0-9]).{6,})\S").hasMatch(valueMdp)){
                                return "Veuillez entrer un Mots de passe valide !";
                              }
                              return null;
                            }
                        ),
                        Row(
                          children: [
                            Switch(
                                value: remeberMe,
                                onChanged: (isEnabled) {
                                  setState(() {
                                    remeberMe = isEnabled;
                                  });
                                }),
                            const Text("Memoriser mes informations"),
                          ],
                        ),
                        ElevatedButton(
                            onPressed: () {
                              if (_fromKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("Connecté !")
                                  ),
                                );
                                context.go('/home', extra: textControllerIdentifiant.text);
                              }else{
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text("Identifiant ou Mots de passe incorrect !")
                                    )
                                );
                              }
                            },
                            child: const Text("Connexion")
                        )
                      ]
                  )
              ),
            ],
          ),
        )
    );
  }
}