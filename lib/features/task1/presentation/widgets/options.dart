import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/option_model.dart';
import '../bloc/option_cubit/option_cubit.dart';
import 'option_button.dart';

class Options extends StatefulWidget {
  const Options({super.key, required this.optionsList});

  final List<OptionModel> optionsList;
  @override
  State<Options> createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<OptionCubit,String?>(
      builder: (context,state) {
        return Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Wrap(
              runSpacing: 12,
              spacing: 12,
              children: widget.optionsList.map((e) {
                return OptionButton(
                  title: e.text,
                  isActive: state == e.option,
                  option: e.option,
                );
              }).toList(),
            ));
      }
    );
  }
}
