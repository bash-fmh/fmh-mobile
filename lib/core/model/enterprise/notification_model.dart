class NotificationModelResponse{
  const NotificationModelResponse({
    required this.data
  });

  final List<NotificationDetail> data;

  NotificationModelResponse.fromJson(Map<String, dynamic>? json)
      : data = json?['data'] == null
            ? <NotificationDetail>[]
            : (json?['data'] as List<dynamic>)
                .map<NotificationDetail>((dynamic e) =>
                    NotificationDetail.fromJson(e as Map<String, dynamic>))
                .toList();
}

class NotificationDetail {
  const NotificationDetail({
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

  NotificationDetail.fromJson(Map<String, dynamic>? json)
      : type = (json?['type'] as String?) ?? '',
        title = (json?['title'] as String?) ?? '',
        content = (json?['content'] as String?) ?? '',
        date = (json?['date'] as String?) ?? '',
        time = (json?['time'] as String?) ?? '';
}