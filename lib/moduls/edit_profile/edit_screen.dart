import 'package:flutter/material.dart';
import '../../componts/widgets/form_feild.dart';
import '../../componts/widgets/validate.dart';


class EditScreen extends StatefulWidget {
  const EditScreen({Key? key}) : super(key: key);

  @override
  State<EditScreen> createState() => _EditScreenState();
}
AutovalidateMode autovalidateMode=AutovalidateMode.disabled;
final formKey =GlobalKey<FormState>();
class _EditScreenState extends State<EditScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تعديل الملف الشخصي'),

      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("تعديل البيانات الشخصية",style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 25,fontWeight: FontWeight.bold),),
              SizedBox(height: 15,),
              defualtFormField(

                validate: Validator.name,
                  controller: TextEditingController(),
                  type: TextInputType.text,
                  hintText: 'الاسم',
                  prefix: Icons.person),
              defualtFormField(

                  validate: Validator.email,
                  controller: TextEditingController(),
                  type: TextInputType.emailAddress,
                  hintText: 'الايميل الالكتروني',
                  prefix: Icons.email_outlined),
              defualtFormField(
                  validate: Validator.phone,
                  controller: TextEditingController(),
                  type: TextInputType.phone,
                  hintText: 'رقم التليفون',
                  prefix: Icons.phone),




              ElevatedButton(

                onPressed: () {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (formKey.currentState!.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    formKey.currentState!.save();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                  }
                },
                child: const Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 20.0,vertical: 15),
                  child:  Text('حفظ التغييرات'),
                ),
              ),


            ],


          ),
        ),
      ),
    );
  }
}



// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
