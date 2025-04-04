import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Registrar usuário
  Future<User?> registerUser(String email, String password) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print('Erro ao registrar usuário: $e');
      return null;
    }
  }

  // Fazer login
  Future<User?> loginUser(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print('Erro ao fazer login: $e');
      return null;
    }
  }

  // Salvar dados no Firestore
  Future<void> saveData(
      String collection, String docId, Map<String, dynamic> data) async {
    try {
      await _firestore.collection(collection).doc(docId).set(data);
      print('Dados salvos com sucesso!');
    } catch (e) {
      print('Erro ao salvar dados: $e');
    }
  }

  // Recuperar dados do Firestore
  Future<DocumentSnapshot?> getData(String collection, String docId) async {
    try {
      DocumentSnapshot doc =
          await _firestore.collection(collection).doc(docId).get();
      return doc;
    } catch (e) {
      print('Erro ao recuperar dados: $e');
      return null;
    }
  }
}
