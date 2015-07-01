//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-platform/actor-apps/core/src/main/java/im/actor/model/api/rpc/RequestGetPublicGroups.java
//

#ifndef _APRequestGetPublicGroups_H_
#define _APRequestGetPublicGroups_H_

#include "J2ObjC_header.h"
#include "im/actor/model/network/parser/Request.h"

@class BSBserValues;
@class BSBserWriter;
@class IOSByteArray;

#define APRequestGetPublicGroups_HEADER 201

@interface APRequestGetPublicGroups : APRequest

#pragma mark Public

- (instancetype)init;

+ (APRequestGetPublicGroups *)fromBytesWithByteArray:(IOSByteArray *)data;

- (jint)getHeaderKey;

- (void)parseWithBSBserValues:(BSBserValues *)values;

- (void)serializeWithBSBserWriter:(BSBserWriter *)writer;

- (NSString *)description;

@end

J2OBJC_EMPTY_STATIC_INIT(APRequestGetPublicGroups)

J2OBJC_STATIC_FIELD_GETTER(APRequestGetPublicGroups, HEADER, jint)

FOUNDATION_EXPORT APRequestGetPublicGroups *APRequestGetPublicGroups_fromBytesWithByteArray_(IOSByteArray *data);

FOUNDATION_EXPORT void APRequestGetPublicGroups_init(APRequestGetPublicGroups *self);

FOUNDATION_EXPORT APRequestGetPublicGroups *new_APRequestGetPublicGroups_init() NS_RETURNS_RETAINED;

J2OBJC_TYPE_LITERAL_HEADER(APRequestGetPublicGroups)

typedef APRequestGetPublicGroups ImActorModelApiRpcRequestGetPublicGroups;

#endif // _APRequestGetPublicGroups_H_
