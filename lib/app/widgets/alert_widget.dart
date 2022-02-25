import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

class Alert extends StatelessWidget {
  const Alert.info({
    Key? key,
    required this.message,
    this.onClose,
    this.onTap,
  })  : color = Colors.blue,
        iconData = Mdi.informationOutline,
        super(key: key);

  const Alert.success({
    Key? key,
    required this.message,
    this.onClose,
    this.onTap,
  })  : color = Colors.green,
        iconData = Mdi.checkCircleOutline,
        super(key: key);

  const Alert.error({
    Key? key,
    required this.message,
    this.onClose,
    this.onTap,
  })  : color = Colors.red,
        iconData = Mdi.alertRemoveOutline,
        super(key: key);

  const Alert.warning({
    Key? key,
    required this.message,
    this.onClose,
    this.onTap,
  })  : color = Colors.amber,
        iconData = Mdi.alertOutline,
        super(key: key);

  final String message;
  final MaterialColor color;
  final IconData iconData;
  final VoidCallback? onClose, onTap;

  @override
  Widget build(BuildContext context) {
    if (message.isEmpty) return SizedBox.square(dimension: 0);

    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey.shade900,
      ),
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          backgroundColor: color.shade900,
          child: Icon(
            iconData,
            color: color.shade100,
          ),
        ),
        title: Text(
          message,
          style: TextStyle(color: color.shade600),
        ),
        trailing: onClose != null
            ? IconButton(onPressed: onClose, icon: Icon(Mdi.close))
            : null,
      ),
    );
  }
}
