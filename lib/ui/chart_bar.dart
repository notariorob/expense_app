import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final String amount;
  final double ratio;
  const ChartBar(
      {Key? key,
      required this.label,
      required this.amount,
      required this.ratio})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 10,
          height: 100,
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorLight,
                ),
              ),
              FractionallySizedBox(
                widthFactor: 0.6,
                heightFactor: ratio,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorDark,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        FittedBox(
          child: Text(
            '$amount €',
          ),
        )
      ],
    );
  }
}
