# 1.简介
   组件化的开发已经成为诸多应用的首要选择，那么在组件化的过程中不可避免组件之间需要通信(即组件之间相互调用)，如何在开发过程中建立一套统一的协议供大家调用？<br/>
   针对该问题，个人认为可以参考服务器和客户端的交互协议，既然客户端和服务器之间通信可以借助于统一的接口文档，客户端的不同组件也可以定义接口，实现组件和组件之间的调用。本项目现在扮演一个中间件的角色，客户端的可以通过该组件添加接口，执行接口，进而在组件化中形成统一的协议。
# 2.用法
   下载该项目，取出HWRouter.h和HWRouter.m，导入自己的项目即可。
    示例代码:
    
   添加A组件的对外接口
   
    [HWRouter addRoute:@"test/opearater" handler:^bool(NSDictionary *params) {
            该接口对应的操作，添加A组件的某些操作
            //获取接口参数
           NSString *param1 = params[@"param1"];
        }];
        
  其他组件中使用A组件中的方法
          
     不需要参数
     [HWRouter route:@"test/opearater" ];
     需要参数
     [HWRouter route:@"test/opearater" param:@{@"param1":@"param1"}];
