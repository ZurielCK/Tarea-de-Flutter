// lib/presentation/screens/auto_update_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/auto_cubit.dart';
import '../../data/models/auto_model.dart';

class AutoUpdateScreen extends StatelessWidget {
  final AutoModel auto;
  AutoUpdateScreen({required this.auto});

  @override
  Widget build(BuildContext context) {
    final _marcaController = TextEditingController(text: auto.marca);
    final _modeloController = TextEditingController(text: auto.modelo);
    final _velocidadMaximaController = TextEditingController(text: auto.velocidadMaxima.toString());
    final _tipoController = TextEditingController(text: auto.tipo);

    return Scaffold(
      appBar: AppBar(title: Text('Actualizar Auto')),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Form(
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _marcaController,
                decoration: InputDecoration(labelText: 'Marca'),
              ),
              TextFormField(
                controller: _modeloController,
                decoration: InputDecoration(labelText: 'Modelo'),
              ),
              TextFormField(
                controller: _velocidadMaximaController,
                decoration: InputDecoration(labelText: 'Velocidad Máxima'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: _tipoController,
                decoration: InputDecoration(labelText: 'Tipo'),
              ),
              ElevatedButton(
                onPressed: () {
                  AutoModel updatedAuto = AutoModel(
                    id: auto.id,
                    marca: _marcaController.text,
                    modelo: _modeloController.text,
                    velocidadMaxima: int.parse(_velocidadMaximaController.text),
                    tipo: _tipoController.text,
                  );
                  context.read<AutoCubit>().updateAuto(updatedAuto);
                  Navigator.of(context).pop();
                },
                child: Text('Guardar Cambios'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
