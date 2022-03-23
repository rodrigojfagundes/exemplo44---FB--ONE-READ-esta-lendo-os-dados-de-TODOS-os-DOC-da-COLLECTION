//fazendo a importacao dos outros arquivos/classes para funcionar
import 'addusuario.dart';
import 'lerusuario2.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main()
//de forma assincrona estamos iniciando o FIREBASE
async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //
      //aqui estamos dizendo qual vai ser a CLASSE q vai "iniciar" o APP
      //
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
      //home: AddUser('rodrigo', 'appbox', 28),
      //
      //para fazer essa classe eu peguei o q tava: https://firebase.flutter.dev/docs/firestore/usage/
      //modifiquei o REAL-TIME CHANGES com o ONE TIME READ...
      //e gracas a Deus deu certo
      //assim faz uma UNICA LEITURA (NAO FICA ATUALIZANDO) e pega todos valores
      //pretendidos q estao em TODOS DOC da COLLECTION
      home: GetUserNameModificadoPorRODRIGO(),
    );
  }
}
