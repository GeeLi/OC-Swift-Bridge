# OC-Swift-Bridge

OC、Swift 混编的测试Demo


##注意的点

在OC中调Swift时需导入Xcode自动生成的隐藏头文件： 工程名－Swift.h
这个名字可以在Build Setting - Product Module Name 中修改

在Swift中调OC时需在第一次创建OC类时Xcode为你自动创建的 工程名-Bridging-Header 里导入要调用的OC类头文件
