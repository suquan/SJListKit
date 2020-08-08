//
//  SJServiceCenter.m
//  SJListkit
//
//  Created by suzhengquan on 2020/8/6.
//

#import "SJServiceCenter.h"


@interface SJServiceCenter ()
{
    NSMapTable *_clientCenter;//单个client
    
    NSMapTable *_notifyCenter;// 对应对个client
    
    NSLock *_clientLock;
    
    NSRecursiveLock *_notifyLock;
}
@end

@implementation SJServiceCenter

+ (SJServiceCenter *)defaultCenter
{
    static SJServiceCenter *serviceCenter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        serviceCenter = [[SJServiceCenter alloc]init];
    });
    return serviceCenter;
}


- (instancetype)init
{
    if (self = [super init]) {
        _clientCenter = [NSMapTable mapTableWithKeyOptions:NSPointerFunctionsStrongMemory valueOptions:NSPointerFunctionsWeakMemory];
        _notifyCenter = [NSMapTable mapTableWithKeyOptions:NSPointerFunctionsStrongMemory valueOptions:NSPointerFunctionsStrongMemory];
        _clientLock = [[NSLock alloc]init];
        _notifyLock = [[NSRecursiveLock alloc]init];
    }
    return self;
}

#pragma mark public

- (void)addClient:(id)client Key:(SJServiceCenterKey)key
{
    if (client) {
        if (![client conformsToProtocol:key]) {
            NSLog(@"client does not conform to protocol: %@",NSStringFromProtocol(key));
            return;
        }
        [_clientLock lock];
        
        [_clientCenter setObject:client forKey:NSStringFromProtocol(key)];
        
        [_clientLock unlock];
        
    }
}

- (void)removeClientWithKey:(SJServiceCenterKey)key
{
    NSString *strKey = NSStringFromProtocol(key);
    
    [_clientLock lock];
    
    [_clientCenter removeObjectForKey:strKey];
    
    [_clientLock unlock];
}

- (id )clientWithkey:(SJServiceCenterKey)key
{
    NSString *strKey = NSStringFromProtocol(key);
    
    [_clientLock lock];
    
    id client = [_clientCenter objectForKey:strKey];
    
    [_clientLock unlock];
    
    return client;
}

- (void)addNotifyingClient:(id )client Key:(SJServiceCenterKey)key
{
    if (!client) {
        return;
    }
    
    if (![client conformsToProtocol:key]) {
        NSLog(@"client doesnot conforms to protocol: %@",NSStringFromProtocol(key));
        return;
    }
    
    [_notifyLock lock];
    
    NSHashTable *clients = [self _getNotifyingSetWithKey:key];
    
    
    [clients addObject:client];
    
    
    [_notifyLock unlock];
}

- (NSHashTable *)notifyingClientsWithKey:(SJServiceCenterKey)key
{
    return [self _getNotifyingSetWithKey:key];
}


#pragma mark private

- (NSHashTable *)_getNotifyingSetWithKey:(SJServiceCenterKey)key
{
    NSString *strKey = NSStringFromProtocol(key);
    NSHashTable *clients = nil;
    
    [_notifyLock lock];
    
    clients = [_notifyCenter objectForKey:strKey];
    
    if (!clients) {
        clients = [NSHashTable hashTableWithOptions:NSPointerFunctionsWeakMemory];
        [_notifyCenter setObject:clients forKey:strKey];
    }
    
    [_notifyLock unlock];
    
    return clients;
}

@end
