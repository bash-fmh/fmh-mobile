class MTDTopModelResponse {
  const MTDTopModelResponse(
      {required this.mtdDiscard, required this.mtdVariance});

  final List<MTDGeneral> mtdDiscard;
  final List<MTDGeneral> mtdVariance;

  MTDTopModelResponse.fromJson(Map<String, dynamic>? json)
      : mtdVariance = json?['mtdVariance'] == null
            ? <MTDGeneral>[]
            : (json?['mtdVariance'] as List<dynamic>)
                .map<MTDGeneral>((dynamic e) =>
                    MTDGeneral.fromJson(e as Map<String, dynamic>))
                .toList(),
        mtdDiscard = json?['mtdDiscard'] == null
            ? <MTDGeneral>[]
            : (json?['mtdDiscard'] as List<dynamic>)
                .map<MTDGeneral>((dynamic e) =>
                    MTDGeneral.fromJson(e as Map<String, dynamic>))
                .toList();
}

class MTDGeneral {
  const MTDGeneral({required this.name, required this.value});

  final String name;
  final double value;

  MTDGeneral.fromJson(Map<String, dynamic>? json)
      : name = (json?['name'] as String?) ?? '',
        value = double.tryParse((json?['value'] as String?) ?? '0') ?? 0;
}
