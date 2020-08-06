//
//  SJServiceMacro.h
//  SJListkit
//
//  Created by suzhengquan on 2020/8/6.
//

#ifndef SJServiceMacro_h
#define SJServiceMacro_h

#import "SJServiceCenter.h"


#define ADD_SERVICE_CLIENT(protocolName, object) [[SJServiceCenter defaultCenter] addClient:object Key:@protocol(protocolName)]

#define ADD_NOTIFYING_CLIENT(protocolName, object) [[SJServiceCenter defaultCenter] addNotifyingClient:object Key:protocolName]


#define SJSERVICE_CALL_CLIENT(protocolName, selector, func)\
{\
SJClient *__client__ = [[SJServiceCenter defaultCenter] clientWithkey:@protocol(protocolName)];\
id obj = __client__.object;\
if ([obj respondsToSelector:selector]) {\
[obj func];\
}\
}

#define SJSERVICE_NOTIFY_CLIENTS(protocolName, selector, func)\
{\
NSHashTable *__clientsHash__ = [[SJServiceCenter defaultCenter] notifyingClientsWithKey:@protocol(protocolName)];\
NSArray *__clients__ = __clientsHash__.allObjects;\
for (SJClient *client in __clients__) {\
id obj = client.object;\
if ([obj respondsToSelector:@selector()]) {\
[obj func];\
}\
}\
}


#endif /* SJServiceMacro_h */
