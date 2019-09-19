void main(){
  double a = 10.1;
//  是否是非数字
  print(a.isNaN);
  
  int b = 2;
//  是否是偶数
  print(b.isEven);
//  是否是奇数
  print(b.isOdd);

  double c = 12.5;
//  不小于c 的最大整数
  print(c.ceil());
//  四舍五入
  print(c.round());
//  向下取整
  print(c.floor());
}