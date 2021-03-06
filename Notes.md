 # MATLAB

- [MATLAB](#matlab)
  - [1.3 变量及其操作](#13-变量及其操作)
  - [1.4 MATLAB矩阵的表示](#14-matlab矩阵的表示)
  - [1.5 矩阵元素的引用](#15-矩阵元素的引用)
  - [1.6 MATLAB基本运算](#16-matlab基本运算)
    - [算数运算](#算数运算)
    - [关系运算](#关系运算)
    - [逻辑运算](#逻辑运算)
  - [1.7 字符串处理](#17-字符串处理)
    - [字符串的操作](#字符串的操作)
    - [字符串的比较](#字符串的比较)
    - [字符串的查找与替换](#字符串的查找与替换)
  - [2.1 特殊矩阵](#21-特殊矩阵)

## 1.3 变量及其操作

变量本质上讲的是内存单元的一个抽象，在MATLAB中，变量名是以字母开头，后接字母、数字或下划线的字符序列，最多63个字符。

变量名区分字母的大小写。标准函数名以及命令名一般用小写字母。

赋值语句两种格式：

* 变量 = 表达式
* 表达式 （赋值给MATLAB的预定义变量ans，变量结果会在命令行窗口中显示出来）

语句后加“；”则仅仅进行赋值操作，而不显示运算后变量的结果。

pi i 均为MATLAB中预先定义的变量，分别表示圆周率和虚数单位。
数学函数，sqrt开根号函数，exp为e的指数函数，cosd为角度cos函数，abs为绝对值函数。

预定义变量是系统本身定义的变量。

1. ans是默认赋值变量。
2. i和j代表虚数单位
3. pi代表圆周率
4. NaN代表非数，可用于作图是扣点。

在定义变量名称时要尽量避免对它们重新赋值。

变量的管理

1. 内存变量的删除与修改
	who命令和whos命令，可用于显示MATLAB中已经驻留的变量名清单。
2. 内存变量文件
	用于保存MATLAB工作区变量的文件叫做内存变量文件，其扩展名为.mat，也叫做MAT文件。是一种标准的二进制文件。
	* save命令：创建内存变量文件。
	* load命令：装入内存变量文件。

## 1.4 MATLAB矩阵的表示

矩阵的建立

1. 直接输入法
将矩阵的元素用**中括号**括起来，按矩阵行的顺序输入各元素，同一行的各元素之间用**逗号或空格**分割，不同行的元素之间用**分号**分割。
2. 利用已建好的矩阵建立更大的矩阵：一个大矩阵可以由已经建立好的小矩阵拼接而成。
3. 可以用实部矩阵喝虚部矩阵构成复数矩阵。
4. 冒号表达式
格式：
e1:e2:e3 : 初始值：步长：终止值
e2可省略，步长默认为1.
5. linspace函数：linspace(a,b,n) 第一个元素，最后一个元素，元素总数。当n省略时，自动产生100个元素。

结构矩阵和单元矩阵

1. 结构矩阵
   1. 格式：结构矩阵元素.成员名=表达式
2. 单元矩阵
   1. 建立单元矩阵和一般矩阵相似，直接输入就可以了，知识单元矩阵元素用**大括号**括起来。

## 1.5 矩阵元素的引用

1. 通过下标来饮用矩阵的元素
   1. A（3，2）即 A矩阵第三行第二列的元素。
2. 通过序号来饮用
   1. 在MATLAB中，矩阵元素按列存储，即首先存储矩阵的第一列元素，然后存储第二列元素，……，一直到矩阵的最后一列。
   2. 矩阵元素的序号就是矩阵元素在内存中的排列顺序。
   3. 矩阵元素的序号与下标可以利用sub2ind和ind2sub函数实现相互转换。
      1. D=sub2ind(size(A),[1,1],[2,3]) 是指 第一行第二列和第二行第三列。
   sub2ind函数：将矩阵中指定元素的行、列下标转换成存储的序号。
   ind2sub函数：将矩阵元素的序号转换成对应的下标。
   1. 子矩阵是指由矩阵中一部分元素构成的矩阵。
   A(i,:)
   A(:,j)
   A(i:i+m,k:k+m)
   A(i:i+m,:)
   A(2:3,1:2:5) 2-3行 1，2，5列元素
   end运算符：表示某一维的末尾元素下标。

如何删除矩阵元素

1. 利用空矩阵删除矩阵的元素
   1. x=[]
2. 改变矩阵的形状
   1. reshape(A,m,n):在矩阵总元素保持不变的前提下，将矩阵A重新排列成mxn的二维矩阵。 注意：只改变行数和列数，但是不改变原矩阵元素个数及其存储顺序。
   2. A(:):将矩阵A的每一列元素堆叠起来，成为一个列向量。
   3. 如果创建失败，矩阵为空，大小为1，0。如果=[],则矩阵为空，大小为0，0。

## 1.6 MATLAB基本运算

基本运算包括：1. 算数运算 2. 关系运算 3. 逻辑运算
MATLAB下的运算都是针对矩阵而言的，既有对矩阵的运算，也有对矩阵元素的运算。

### 算数运算

分为：基本算数运算和点运算。
基本算数运算符：+ - * / \ ^ 包括右除和左除。

* MATLAB的算术运算是在矩阵意义下进行的。
* 单个数据的算术运算只是矩阵运算的一种特例。

加减运算：

* 若两矩阵同形，则运算时两矩阵的相应元素相加减。
* 若两矩阵不同型，则报错。
* 一个标量也可以和矩阵进行加减运算，这时将标量后劲儿矩阵的每一个元素进行加减运算。

乘法运算：

* 矩阵A和B进行乘法运算，要求A的列数和B的行数相等，此时则称A、B矩阵是可乘的，或称A和B两矩阵维数和大小相容。

点运算：

* 点运算符：.* , ./ , .\ , .^
* 两矩阵进行点运算是指它们的对应元素进行相关运算，要求两矩阵同型。

### 关系运算

* 关系运算符：< <= > >= == ~=(不等于)
* 当两个比较量为标量时，直接比较两数的大小。若关系成立，关系表达式结果为1，否则为0。
* 当参与比较的量是两个同型的矩阵时，比较是对两矩阵相同位置的元素按标量关系运算规则逐个进行，最终的关系运算的结果是一个与原矩阵同型的矩阵，他的元素由0或1组成。
* 当参与比较的量是一个标量一个矩阵时，比较是对标量和矩阵每一个元素按标量关系运算规则逐个进行，最终的关系运算的结果是一个与原矩阵同型的矩阵，他的元素由0或1组成。

### 逻辑运算

逻辑运算符：& ｜ ～ 与 或 非

优先级问题：算数运算的优先级最高，逻辑运算优先级最低，但逻辑非运算是单目运算，它的优先级比双目运算要高。

## 1.7 字符串处理

两种基本的数据类型：1. 数值型数据 2. 字符型数据（字符串数据）
在MATLAB中，字符串是由单引号括起来的字符序列。MATLAB将一个字符串当作一个行向量。每个元素对应一个字符。
字符串中有单引号，则该单引号字符要用两个单引号来表示。

还可以建立多行字符串，形成字符串矩阵。使用空格使它们的列数相同。

### 字符串的操作

字符串的执行 格式 eval(s) 将参数字符串的内容作为MATLAB的命令来执行。
字符串和数值之间的转换 1. abs和double函数都可以用来获取字符串矩阵所对应的ACSII码数值矩阵。 2. char函数可以把ASCII码矩阵转换成字符串矩阵。

### 字符串的比较

字符串的比较有两种方法：利用关系运算符或字符串比较函数。

* 关系运算符比较：两个字符串里每个字符依次按ASCII值大小逐个比较，得到一个数值向量。

* 字符串比较函数用于判断字符串是否相等，有四种比较方法，函数如下：
  * strcmp(s1,s2):用于比较字符串是否相等，相等返回1。
  * strncmp(s1,s2,n):比较两字符串前n个字符是否相等。
  * strcmpi(s1,s2):忽略字母大小写，比较。
  * strncmpi(s1,s2,n):忽略字母大小写，比较前n个字符。

### 字符串的查找与替换

* findstr(s1,s2):返回短字符串在长字符串中的开始位置。不区分s1、s2.
* strrep(s1,s2,s3):将字符串s1中所有子字符串s2替换为字符串s3。

## 2.1 特殊矩阵

分为两类：1. 通用性的特殊矩阵 2. 用于专门学科的特殊矩阵

通用的特殊矩阵：

* zeros(): 产生全0矩阵
* ones(): 产生全1矩阵
* eye(): 产生对角线为1的矩阵。当矩阵是方阵时，得到一个单位矩阵
* rand(): 产生（0，1）区间均匀分布的随机矩阵
* randn(): 产生均值为0，方差为1的标准正态分布随机矩阵

调用格式：

* zero(m): 产生m*m零矩阵
* zeros(m,n):产生m*n零矩阵
* zeros(size(A)): 产生与矩阵A同样大小的零矩阵

用于专门学科的特殊矩阵

（1）魔方矩阵 - Magic Square
M=magic(3)
（2）范德蒙矩阵
对于向量v = [v1,v2,...,vn]，范德蒙矩阵的一般形式
>> vander(1:5)

ans =

     1     1     1     1     1
    16     8     4     2     1
    81    27     9     3     1
   256    64    16     4     1
   625   125    25     5     1

范德蒙矩阵常用在各种通信系统的纠错编码中，例如，常用的Reed-Solomon编码即以范德蒙矩阵为基础。
（3）希尔伯特矩阵
n阶希尔伯特矩阵的一般形式为：H(i,j)=1/(i+j-1)
hilb(n)
>>  format rat
>> H = hilb(4)

H =

       1              1/2            1/3            1/4     
       1/2            1/3            1/4            1/5     
       1/3            1/4            1/5            1/6     
       1/4            1/5            1/6            1/7 

希尔伯特矩阵是著名的病态矩阵，即任何一个元素发生较小的变动，整个矩阵的值和逆矩阵都会发生较大的变化。病态程度和矩阵的阶数相关。
（4）伴随矩阵
设多项式P(x)为a_nX^n+a_(n-1)X^(n-1)+...+a1X+a_0，则多项式的伴随矩阵。p(x)称为A的特征多项式，方程p(x)=0的根称为A的特征值。
compan（p），其中p是一个多项式的系数向量，高次幂系数排在前，低次幂系数排在后。例如生成多项式X3-2X2-5X+6的伴随矩阵。
>> p=[1,-2,-5,6];
>> A=compan(p)

A =

       2              5             -6       
       1              0              0       
       0              1              0
（5）帕斯卡矩阵
根据二项式定理，(x+y)^n展开后的系数随着n的增大组成一个三角形表，这个三角形称为杨辉三角形。
pascal(n)生成一个n阶帕斯卡矩阵。
inv(P）为取P的逆矩阵。

2.1Done