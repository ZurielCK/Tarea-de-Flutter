// auto_create_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/auto_cubit.dart';
import '../../../data/models/auto_model.dart';

class AutoCreateScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _marcaController = TextEditingController();
  final _modeloController = TextEditingController();
  final _velocidadMaximaController = TextEditingController();
  final _tipoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Crear Nuevo Auto')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _marcaController,
                decoration: InputDecoration(labelText: 'Marca'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa la marca';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _modeloController,
                decoration: InputDecoration(labelText: 'Modelo'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa el modelo';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _velocidadMaximaController,
                decoration: InputDecoration(labelText: 'Velocidad Máxima (km/h)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa la velocidad máxima';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _tipoController,
                decoration: InputDecoration(labelText: 'Tipo'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa el tipo';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final newAuto = AutoModel(
                      id: 0, // ID no se necesita al crear
                      marca: _marcaController.text,
                      modelo: _modeloController.text,
                      velocidadMaxima: int.parse(_velocidadMaximaController.text),
                      tipo: _tipoController.text,
                    );
                    context.read<AutoCubit>().createAuto(newAuto);
                    Navigator.of(context).pop();
                  }
                },
                child: Text('Crear Auto'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
