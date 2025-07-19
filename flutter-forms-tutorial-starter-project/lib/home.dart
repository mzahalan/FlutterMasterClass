import 'package:flutter/material.dart';
import 'package:flutter_forms_files/models/todo.dart';
import 'package:flutter_forms_files/todo_list.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _formGlobalKey = GlobalKey<FormState>();
  static const _defaultPriority = Priority.low;
  
  String _title = '';
  String _description = '';
  Priority _selectedPriority = _defaultPriority;

  final List<Todo> todos = [
    const Todo(
      title: 'Buy milk', 
      description: 'There is no milk left in the fridge!',
      priority: Priority.high
    ),
    const Todo(
      title: 'Make the bed', 
      description: 'Keep things tidy please..',
      priority: Priority.low
    ),
    const Todo(
      title: 'Pay bills', 
      description: 'The gas bill needs paying ASAP.',
      priority: Priority.urgent
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
        centerTitle: true,
        backgroundColor: Colors.grey[200],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(child: TodoList(todos: todos)),
        
            // form stuff below here
            Form(
              key: _formGlobalKey,
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [

                //todo  title
                TextFormField(
                  maxLength: 20,
                  decoration: const InputDecoration(label: Text('Todo Title')),
                  validator: (value) {
                    if(value == null || value.isEmpty) {
                      return 'You must enter a value for the title.';
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    _title = newValue!;
                  },
                ),

                //todo description
                TextFormField(
                  maxLength: 40,
                  decoration: const InputDecoration(label: Text('Todo Description')),
                  validator: (value) {
                    if(value == null || value.length < 5) {
                      return 'Descirption must be at least 5 characters long';
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    _description = newValue!;
                  },
                ),
                
                //todo priority
                DropdownButtonFormField(
                  value: _selectedPriority,
                  decoration: const InputDecoration(label: Text('Priority')),
                  items: Priority.values.map((p) => DropdownMenuItem(
                    value: p,
                    child: Text(p.title))).toList(), 
                  onChanged:(value) {
                    setState(() {
                      _selectedPriority = value!;
                    });
                  },
                ),
                
                //todo submit
                const SizedBox(height: 20),
                FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.grey[800], 
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))
                  ),
                  onPressed: () {
                    if(_formGlobalKey.currentState!.validate()) {
                      _formGlobalKey.currentState!.save();
                      setState(() {
                        todos.add(Todo(title: _title, description: _description, priority: _selectedPriority));                        
                      });
                      _formGlobalKey.currentState!.reset();
                      setState(() {
                        _selectedPriority = _defaultPriority;
                      });
                    }
                  }, 
                  child: const Text('Add'))
              ],
            ),
          ),
            
          ],
        ),
      ),
    );
  }
}