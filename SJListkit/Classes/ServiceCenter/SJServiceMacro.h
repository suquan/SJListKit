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
id __client__ = [[SJServiceCenter defaultCenter] clientWithkey:@protocol(protocolName)];\
if ([__client__ respondsToSelector:selector]) {\
[__client__ func];\
}\
}

#define SJSERVICE_NOTIFY_CLIENTS(protocolName, selector, func)\
{\
NSHashTable *__clientsHash__ = [[SJServiceCenter defaultCenter] notifyingClientsWithKey:@protocol(protocolName)];\
NSArray *__clients__ = __clientsHash__.allObjects;\
for (id client in __clients__) {\
if ([client respondsToSelector:selector]) {\
[client func];\
}\
}\
}


#endif /* SJServiceMacro_h */
