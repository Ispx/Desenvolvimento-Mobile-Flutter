import 'package:flutter/cupertino.dart';

import 'ListaDeTransferenciaWidgetState.dart';
import 'Transferencia.dart';

class ListaDeTransferenciaWidget extends StatefulWidget {
  final List<Transferencia> listaTransferencias = new List();
  @override
  State<StatefulWidget> createState() {
    return ListaDeTransferenciaWidgetState();
  }
}
