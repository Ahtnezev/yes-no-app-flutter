// todo lo que esta en dominio debe ser codigo de dart, nada de widgets

enum FromWho { me, hers }

class Message {
  final String text;
  final String? imageUrl;
  final FromWho fromWho;

  Message({required this.text, this.imageUrl, required this.fromWho});
}
