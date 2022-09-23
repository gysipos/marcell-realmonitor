part of 'notification_card.dart';

class _HeaderModel {
  final String title;
  final String subTitle;

  factory _HeaderModel.from(entity.Notification notification) {
    final types = notification.estateTypes.map((e) => e.title).join(' / ');
    return _HeaderModel._(
      title: notification.name,
      subTitle: '${notification.assignmentType.title} $types',
    );
  }

  const _HeaderModel._({
    required this.title,
    required this.subTitle,
  });
}

class _InfoModel {
  final String location;
  final String? price;
  final String? floorSize;

  factory _InfoModel.from(entity.Notification notif) {
    String? printBounds(int? left, int? right) {
      if (left != null && right != null) {
        return '$left - $right';
      } else if (left != null) {
        return '$left+';
      } else if (right != null) {
        return '< $right';
      } else {
        return null;
      }
    }

    final price = printBounds(
        notif.minPrice.divideByMillion, notif.maxPrice.divideByMillion);
    final floor = printBounds(notif.minFloorArea, notif.maxFloorArea);
    return _InfoModel._(
      location: '${notif.city.name}, ${notif.city.county.name}',
      price: price != null ? '$price mFt' : null,
      floorSize: floor != null ? '$floor m\u00B2' : null,
    );
  }

  const _InfoModel._({
    required this.location,
    required this.price,
    required this.floorSize,
  });
}
