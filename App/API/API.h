/**
    API
    网络基础及接口封装
 
    接口地址请到 APIInterface.h 定义；
    模块设置也在 APIInterface.h 中。
 
    尽量不要直接使用 AFHTTPClient 或更低级的 request 对象
    多用封装好的业务方法
    如果有像UserID这种东西，让API来管理，不要在外面获取再传进来
 */

#import "AFNetworking+API.h"
#import "DataStack.h"

#import "APIUserPlugin.h"
#import "APIAutoSyncPlugin.h"
#import "APIAppUpdatePlugin.h"

@interface API : AFHTTPClient
<APIAutoSyncPluginDelegate>

+ (instancetype)sharedInstance;

#pragma mark - 状态与通用流程
// 请求执行通用的更新流程
- (void)requestUpdate;
@property (readonly, nonatomic, getter = isUpdating) BOOL updating;

#pragma mark - 具体业务



#pragma mark - 自动更新
@property (strong, nonatomic) APIAutoSyncPlugin *autoSyncPlugin;
@property (readonly, assign, nonatomic) BOOL canPerformSync;

@property (strong, nonatomic) APIUserPlugin *user;
@property (strong, nonatomic) APIAppUpdatePlugin *appUpdatePlugin;

#pragma mark -
// 显示错误的统一方法，默认使用 UIAlertView
// 重写已使用其他提示方式
- (void)alertError:(NSError *)error title:(NSString *)title;

@end

// 暴漏给外部的常量
extern NSString *const APIURLDeployBase;
extern NSUInteger APIConfigFetchPageSize;

