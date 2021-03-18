# WN_LOCK
   一款用于flutter 的N宫格锁屏，但是可以有更多的玩法。是你，那么又会有怎样的发现呢？<br>


## 最新版本

```sh
dependencies:
  wn_lock: ^version
```

### 演示
![](https://github.com/weniner/wn_lock/blob/main/img/example1.jpg)
![](https://github.com/weniner/wn_lock/blob/main/img/example2.jpg)
![](https://github.com/weniner/wn_lock/blob/main/img/example3.jpg)

### 例子

##### 使用示例：
```
@override
  void initState() {
    super.initState();
    // controller 初始化
    _lockController = LockController();
    // 建议将listener抽出并在dispose时remove
    _lockController.addListener(_lockListener);

  }
```
```
  @override
  void dispose() {
    super.dispose();
    _lockController.removeListener(_lockListener);
  }
```
```
void _lockListener() {
    // 这里的value 的listener将会获取每次用户划过child widget的index
    // 返回值是index的数组
    print('${_lockController.value.offsets}');
}
```
```
WNLockWidget(
    lineColor: Colors.amber,
    lineWidth: 2,
    // attr: HeartAttr(color: Colors.green, width: 2),
    // attr: CircleAttr(radius: 5, color: Colors.green, width: 2),
    attr: SquareAttr(length: 5, color: Colors.amber, width: 2),
    controller: _lockController,
    width: 300,
    height: 400,
    row: 5,
    column: 5,
)
```

### 参数

| 属性 | 类型 | 描述 | 默认| 必填 |
| ------ | ----------- | ---------- | ----------- | ---- |
| onPanEnd| ValueChanged<List<int>> | 当手指离开时结果回调 | | false |
| controller | LockController | lock Controller | | true |
| row | int| 默认的行数 | 3 | false  |
| column | int | 默认的列数 | 3 | false |,
| attr | Attr | 绘制属性 | CircleAttr(radius: 10.0) | false |,
| touchInChildScale | double | 可触碰体积占child比例 | 1 | false |,
| width | double | widget 宽 | 100 | false |,
| height | double | widget 高 | 100 | false |
| padding | EdgeInsets | widget 内边距 |  | false |
| margin | EdgeInsets | widget 外边距 | | false |
| lineWidth | double | 连线度宽 | 2 | false|
| lineColor | Color | 连线颜色 | Colors.lightBlueAccent | false|
| *eachInParentScale(未来版本会实现) | double | child根据row平分column所占空间比 | 0.5 | false|