class NotificationModelResponse{
  const NotificationModelResponse({
    required this.notificationList
  });

  final List<Notification> notificationList;

  NotificationModelResponse.fromJson(Map<String, dynamic>? json)
      : notificationList = json?['data'] == null
            ? <Notification>[]
            : (json?['data'] as List<dynamic>)
                .map<Notification>((dynamic e) =>
                    Notification.fromJson(e as Map<String, dynamic>))
                .toList();
}

class Notification {
  const Notification({
    required this.type,
    required this.title,
    required this.content,
    required this.date,
    required this.time,
  });

  final String type;
  final String title;
  final String content;
  final String date;
  final String time;

  Notification.fromJson(Map<String, dynamic>? json)
      : type = (json?['type'] as String?) ?? '',
        title = (json?['title'] as String?) ?? '',
        content = (json?['content'] as String?) ?? '',
        date = (json?['date'] as String?) ?? '',
        time = (json?['time'] as String?) ?? '';
}