import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/register/register_cubit.dart';

import '../widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nuevo usuario"),
      ),
      body: BlocProvider(
          create: (context) => RegisterCubit(), child: const _RegisterView()),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlutterLogo(
                size: 100,
              ),
              _RegisterForm(),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm({Key? key}) : super(key: key);

  //final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>();
    final username = registerCubit.state.username;
    final password = registerCubit.state.password;
    final email = registerCubit.state.email;

    return Form(
        // key: _formKey, -> por el manejo de fromz , ya no es encesario esto
        child: Column(
      children: [
        CustomTextFormField(
            label: "Nombre de usuario",
            onChange: registerCubit.usernameChanged,
            errorMessage: username.errorMessage,
            /*validator: (value) {
              if (value == null || value.isEmpty) return "Campo requerido";
              if (value.trim().isEmpty) return "Campo requerido";
              if (value.length < 6) return "Mas de 6 letras";
              return null;
            }*/
            
            ),
        const SizedBox(
          height: 10,
        ),
        CustomTextFormField(
          label: "Correo Electrónico",
          onChange: registerCubit.emailChanged,
          errorMessage: email.errorMessage,
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextFormField(
          label: "Contraseña ",
          onChange: registerCubit.passwordChanged,
          obscureText: true,
          errorMessage: password.errorMessage,
        ),
        FilledButton.tonalIcon(
          onPressed: () {
            //final isValid = _formKey.currentState!.validate();
            //if (!isValid) return;
            registerCubit.onSubmit();
          },
          icon: const Icon(Icons.save),
          label: const Text("Crear usuario"),
        ),
      ],
    ));
  }
}
