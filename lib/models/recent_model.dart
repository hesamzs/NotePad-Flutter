class RecentModel {
  final String title;
  final int time;
  final int groupid;

  RecentModel({
    required this.title,
    required this.time,
    required this.groupid,
  });
}

List<RecentModel> recentcomponent = [
  RecentModel(title: "( Read Book ) Added", time: 2, groupid: 0,),
  RecentModel(title: "( Read Book ) Added", time: 12, groupid: 2,),
  RecentModel(title: "( Read Book ) Added", time: 16, groupid: 3,),
  RecentModel(title: "( Read Book ) Added", time: 1, groupid: 1,),
];
