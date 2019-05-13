class StatusEvent {
  String labelId;
  int status;
  int cid;

  // 构造函数里的某个参数用大括号包起来代表可选的意思
  StatusEvent(this.labelId, this.status, {this.cid});
}