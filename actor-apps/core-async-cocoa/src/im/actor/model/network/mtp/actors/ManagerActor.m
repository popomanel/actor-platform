//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-platform/actor-apps/core/src/main/java/im/actor/model/network/mtp/actors/ManagerActor.java
//


#include "IOSClass.h"
#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "im/actor/model/NetworkProvider.h"
#include "im/actor/model/droidkit/actors/Actor.h"
#include "im/actor/model/droidkit/actors/ActorCreator.h"
#include "im/actor/model/droidkit/actors/ActorRef.h"
#include "im/actor/model/droidkit/actors/ActorSelection.h"
#include "im/actor/model/droidkit/actors/ActorSystem.h"
#include "im/actor/model/droidkit/actors/Environment.h"
#include "im/actor/model/droidkit/actors/Props.h"
#include "im/actor/model/droidkit/bser/DataInput.h"
#include "im/actor/model/droidkit/bser/DataOutput.h"
#include "im/actor/model/log/Log.h"
#include "im/actor/model/network/ActorApi.h"
#include "im/actor/model/network/Connection.h"
#include "im/actor/model/network/ConnectionCallback.h"
#include "im/actor/model/network/ConnectionEndpoint.h"
#include "im/actor/model/network/CreateConnectionCallback.h"
#include "im/actor/model/network/Endpoints.h"
#include "im/actor/model/network/NetworkState.h"
#include "im/actor/model/network/mtp/MTProto.h"
#include "im/actor/model/network/mtp/actors/ManagerActor.h"
#include "im/actor/model/network/mtp/actors/ReceiverActor.h"
#include "im/actor/model/network/mtp/actors/SenderActor.h"
#include "im/actor/model/network/mtp/entity/ProtoMessage.h"
#include "im/actor/model/util/AtomicIntegerCompat.h"
#include "im/actor/model/util/ExponentialBackoff.h"
#include "java/io/IOException.h"

@interface MTManagerActor () {
 @public
  MTMTProto *mtProto_;
  AMEndpoints *endpoints_;
  jlong authId_;
  jlong sessionId_;
  jboolean isEnableLog_;
  jint currentConnectionId_;
  id<AMConnection> currentConnection_;
  AMNetworkStateEnum *networkState_;
  jboolean isCheckingConnections_;
  AMExponentialBackoff *backoff_;
  DKActorRef *receiver_;
  DKActorRef *sender_;
}

- (void)onConnectionCreatedWithInt:(jint)id_
                  withAMConnection:(id<AMConnection>)connection;

- (void)onConnectionCreateFailure;

- (void)onConnectionDieWithInt:(jint)id_;

- (void)onNetworkChangedWithAMNetworkStateEnum:(AMNetworkStateEnum *)state;

- (void)forceNetworkCheck;

- (void)requestCheckConnection;

- (void)requestCheckConnectionWithLong:(jlong)wait;

- (void)checkConnection;

- (void)onInMessageWithByteArray:(IOSByteArray *)data
                         withInt:(jint)offset
                         withInt:(jint)len;

- (void)onOutMessageWithByteArray:(IOSByteArray *)data
                          withInt:(jint)offset
                          withInt:(jint)len;

@end

J2OBJC_FIELD_SETTER(MTManagerActor, mtProto_, MTMTProto *)
J2OBJC_FIELD_SETTER(MTManagerActor, endpoints_, AMEndpoints *)
J2OBJC_FIELD_SETTER(MTManagerActor, currentConnection_, id<AMConnection>)
J2OBJC_FIELD_SETTER(MTManagerActor, networkState_, AMNetworkStateEnum *)
J2OBJC_FIELD_SETTER(MTManagerActor, backoff_, AMExponentialBackoff *)
J2OBJC_FIELD_SETTER(MTManagerActor, receiver_, DKActorRef *)
J2OBJC_FIELD_SETTER(MTManagerActor, sender_, DKActorRef *)

static NSString *MTManagerActor_TAG_ = @"Manager";
J2OBJC_STATIC_FIELD_GETTER(MTManagerActor, TAG_, NSString *)

static AMAtomicIntegerCompat *MTManagerActor_NEXT_CONNECTION_;
J2OBJC_STATIC_FIELD_GETTER(MTManagerActor, NEXT_CONNECTION_, AMAtomicIntegerCompat *)

__attribute__((unused)) static void MTManagerActor_onConnectionCreatedWithInt_withAMConnection_(MTManagerActor *self, jint id_, id<AMConnection> connection);

__attribute__((unused)) static void MTManagerActor_onConnectionCreateFailure(MTManagerActor *self);

__attribute__((unused)) static void MTManagerActor_onConnectionDieWithInt_(MTManagerActor *self, jint id_);

__attribute__((unused)) static void MTManagerActor_onNetworkChangedWithAMNetworkStateEnum_(MTManagerActor *self, AMNetworkStateEnum *state);

__attribute__((unused)) static void MTManagerActor_forceNetworkCheck(MTManagerActor *self);

__attribute__((unused)) static void MTManagerActor_requestCheckConnection(MTManagerActor *self);

__attribute__((unused)) static void MTManagerActor_requestCheckConnectionWithLong_(MTManagerActor *self, jlong wait);

__attribute__((unused)) static void MTManagerActor_checkConnection(MTManagerActor *self);

__attribute__((unused)) static void MTManagerActor_onInMessageWithByteArray_withInt_withInt_(MTManagerActor *self, IOSByteArray *data, jint offset, jint len);

__attribute__((unused)) static void MTManagerActor_onOutMessageWithByteArray_withInt_withInt_(MTManagerActor *self, IOSByteArray *data, jint offset, jint len);

@interface MTManagerActor_OutMessage () {
 @public
  IOSByteArray *message_;
  jint offset_;
  jint len_;
}

@end

J2OBJC_FIELD_SETTER(MTManagerActor_OutMessage, message_, IOSByteArray *)

@interface MTManagerActor_InMessage () {
 @public
  IOSByteArray *data_;
  jint offset_;
  jint len_;
}

@end

J2OBJC_FIELD_SETTER(MTManagerActor_InMessage, data_, IOSByteArray *)

@interface MTManagerActor_NetworkChanged () {
 @public
  AMNetworkStateEnum *state_;
}

@end

J2OBJC_FIELD_SETTER(MTManagerActor_NetworkChanged, state_, AMNetworkStateEnum *)

@interface MTManagerActor_PerformConnectionCheck : NSObject

- (instancetype)init;

@end

J2OBJC_EMPTY_STATIC_INIT(MTManagerActor_PerformConnectionCheck)

__attribute__((unused)) static void MTManagerActor_PerformConnectionCheck_init(MTManagerActor_PerformConnectionCheck *self);

__attribute__((unused)) static MTManagerActor_PerformConnectionCheck *new_MTManagerActor_PerformConnectionCheck_init() NS_RETURNS_RETAINED;

J2OBJC_TYPE_LITERAL_HEADER(MTManagerActor_PerformConnectionCheck)

@interface MTManagerActor_ConnectionDie : NSObject {
 @public
  jint connectionId_;
}

- (instancetype)initWithInt:(jint)connectionId;

- (jint)getConnectionId;

@end

J2OBJC_EMPTY_STATIC_INIT(MTManagerActor_ConnectionDie)

__attribute__((unused)) static void MTManagerActor_ConnectionDie_initWithInt_(MTManagerActor_ConnectionDie *self, jint connectionId);

__attribute__((unused)) static MTManagerActor_ConnectionDie *new_MTManagerActor_ConnectionDie_initWithInt_(jint connectionId) NS_RETURNS_RETAINED;

J2OBJC_TYPE_LITERAL_HEADER(MTManagerActor_ConnectionDie)

@interface MTManagerActor_ConnectionCreateFailure : NSObject

- (instancetype)init;

@end

J2OBJC_EMPTY_STATIC_INIT(MTManagerActor_ConnectionCreateFailure)

__attribute__((unused)) static void MTManagerActor_ConnectionCreateFailure_init(MTManagerActor_ConnectionCreateFailure *self);

__attribute__((unused)) static MTManagerActor_ConnectionCreateFailure *new_MTManagerActor_ConnectionCreateFailure_init() NS_RETURNS_RETAINED;

J2OBJC_TYPE_LITERAL_HEADER(MTManagerActor_ConnectionCreateFailure)

@interface MTManagerActor_ConnectionCreated : NSObject {
 @public
  jint connectionId_;
  id<AMConnection> connection_;
}

- (instancetype)initWithInt:(jint)connectionId
           withAMConnection:(id<AMConnection>)connection;

- (jint)getConnectionId;

- (id<AMConnection>)getConnection;

@end

J2OBJC_EMPTY_STATIC_INIT(MTManagerActor_ConnectionCreated)

J2OBJC_FIELD_SETTER(MTManagerActor_ConnectionCreated, connection_, id<AMConnection>)

__attribute__((unused)) static void MTManagerActor_ConnectionCreated_initWithInt_withAMConnection_(MTManagerActor_ConnectionCreated *self, jint connectionId, id<AMConnection> connection);

__attribute__((unused)) static MTManagerActor_ConnectionCreated *new_MTManagerActor_ConnectionCreated_initWithInt_withAMConnection_(jint connectionId, id<AMConnection> connection) NS_RETURNS_RETAINED;

J2OBJC_TYPE_LITERAL_HEADER(MTManagerActor_ConnectionCreated)

@interface MTManagerActor_$1 : NSObject < DKActorCreator > {
 @public
  MTMTProto *val$mtProto_;
}

- (MTManagerActor *)create;

- (instancetype)initWithMTMTProto:(MTMTProto *)capture$0;

@end

J2OBJC_EMPTY_STATIC_INIT(MTManagerActor_$1)

J2OBJC_FIELD_SETTER(MTManagerActor_$1, val$mtProto_, MTMTProto *)

__attribute__((unused)) static void MTManagerActor_$1_initWithMTMTProto_(MTManagerActor_$1 *self, MTMTProto *capture$0);

__attribute__((unused)) static MTManagerActor_$1 *new_MTManagerActor_$1_initWithMTMTProto_(MTMTProto *capture$0) NS_RETURNS_RETAINED;

J2OBJC_TYPE_LITERAL_HEADER(MTManagerActor_$1)

@interface MTManagerActor_$2 : NSObject < AMConnectionCallback > {
 @public
  MTManagerActor *this$0_;
  jint val$id_;
}

- (void)onConnectionRedirectWithHost:(NSString *)host
                            withPort:(jint)port
                         withTimeout:(jint)timeout;

- (void)onMessageWithData:(IOSByteArray *)data
               withOffset:(jint)offset
               withLength:(jint)len;

- (void)onConnectionDie;

- (instancetype)initWithMTManagerActor:(MTManagerActor *)outer$
                               withInt:(jint)capture$0;

@end

J2OBJC_EMPTY_STATIC_INIT(MTManagerActor_$2)

J2OBJC_FIELD_SETTER(MTManagerActor_$2, this$0_, MTManagerActor *)

__attribute__((unused)) static void MTManagerActor_$2_initWithMTManagerActor_withInt_(MTManagerActor_$2 *self, MTManagerActor *outer$, jint capture$0);

__attribute__((unused)) static MTManagerActor_$2 *new_MTManagerActor_$2_initWithMTManagerActor_withInt_(MTManagerActor *outer$, jint capture$0) NS_RETURNS_RETAINED;

J2OBJC_TYPE_LITERAL_HEADER(MTManagerActor_$2)

@interface MTManagerActor_$3 : NSObject < AMCreateConnectionCallback > {
 @public
  MTManagerActor *this$0_;
  jint val$id_;
}

- (void)onConnectionCreatedWithConnection:(id<AMConnection>)connection;

- (void)onConnectionCreateError;

- (instancetype)initWithMTManagerActor:(MTManagerActor *)outer$
                               withInt:(jint)capture$0;

@end

J2OBJC_EMPTY_STATIC_INIT(MTManagerActor_$3)

J2OBJC_FIELD_SETTER(MTManagerActor_$3, this$0_, MTManagerActor *)

__attribute__((unused)) static void MTManagerActor_$3_initWithMTManagerActor_withInt_(MTManagerActor_$3 *self, MTManagerActor *outer$, jint capture$0);

__attribute__((unused)) static MTManagerActor_$3 *new_MTManagerActor_$3_initWithMTManagerActor_withInt_(MTManagerActor *outer$, jint capture$0) NS_RETURNS_RETAINED;

J2OBJC_TYPE_LITERAL_HEADER(MTManagerActor_$3)

J2OBJC_INITIALIZED_DEFN(MTManagerActor)

@implementation MTManagerActor

+ (DKActorRef *)managerWithMTMTProto:(MTMTProto *)mtProto {
  return MTManagerActor_managerWithMTMTProto_(mtProto);
}

- (instancetype)initWithMTMTProto:(MTMTProto *)mtProto {
  MTManagerActor_initWithMTMTProto_(self, mtProto);
  return self;
}

- (void)preStart {
  receiver_ = MTReceiverActor_receiverWithMTMTProto_(mtProto_);
  sender_ = MTSenderActor_senderActorWithMTMTProto_(mtProto_);
  MTManagerActor_checkConnection(self);
}

- (void)postStop {
  self->receiver_ = nil;
  self->sender_ = nil;
  currentConnectionId_ = -1;
  if (currentConnection_ != nil) {
    [currentConnection_ close];
    currentConnection_ = nil;
  }
}

- (void)onReceiveWithId:(id)message {
  if ([message isKindOfClass:[MTManagerActor_ConnectionCreated class]]) {
    MTManagerActor_ConnectionCreated *c = (MTManagerActor_ConnectionCreated *) check_class_cast(message, [MTManagerActor_ConnectionCreated class]);
    MTManagerActor_onConnectionCreatedWithInt_withAMConnection_(self, ((MTManagerActor_ConnectionCreated *) nil_chk(c))->connectionId_, c->connection_);
  }
  else if ([message isKindOfClass:[MTManagerActor_ConnectionCreateFailure class]]) {
    MTManagerActor_onConnectionCreateFailure(self);
  }
  else if ([message isKindOfClass:[MTManagerActor_ConnectionDie class]]) {
    MTManagerActor_onConnectionDieWithInt_(self, ((MTManagerActor_ConnectionDie *) nil_chk(((MTManagerActor_ConnectionDie *) check_class_cast(message, [MTManagerActor_ConnectionDie class]))))->connectionId_);
  }
  else if ([message isKindOfClass:[MTManagerActor_PerformConnectionCheck class]]) {
    MTManagerActor_checkConnection(self);
  }
  else if ([message isKindOfClass:[MTManagerActor_NetworkChanged class]]) {
    MTManagerActor_onNetworkChangedWithAMNetworkStateEnum_(self, ((MTManagerActor_NetworkChanged *) nil_chk(((MTManagerActor_NetworkChanged *) check_class_cast(message, [MTManagerActor_NetworkChanged class]))))->state_);
  }
  else if ([message isKindOfClass:[MTManagerActor_ForceNetworkCheck class]]) {
    MTManagerActor_forceNetworkCheck(self);
  }
  else if ([message isKindOfClass:[MTManagerActor_OutMessage class]]) {
    MTManagerActor_OutMessage *m = (MTManagerActor_OutMessage *) check_class_cast(message, [MTManagerActor_OutMessage class]);
    MTManagerActor_onOutMessageWithByteArray_withInt_withInt_(self, ((MTManagerActor_OutMessage *) nil_chk(m))->message_, m->offset_, m->len_);
  }
  else if ([message isKindOfClass:[MTManagerActor_InMessage class]]) {
    MTManagerActor_InMessage *m = (MTManagerActor_InMessage *) check_class_cast(message, [MTManagerActor_InMessage class]);
    MTManagerActor_onInMessageWithByteArray_withInt_withInt_(self, ((MTManagerActor_InMessage *) nil_chk(m))->data_, m->offset_, m->len_);
  }
  else {
    [self dropWithId:message];
  }
}

- (void)onConnectionCreatedWithInt:(jint)id_
                  withAMConnection:(id<AMConnection>)connection {
  MTManagerActor_onConnectionCreatedWithInt_withAMConnection_(self, id_, connection);
}

- (void)onConnectionCreateFailure {
  MTManagerActor_onConnectionCreateFailure(self);
}

- (void)onConnectionDieWithInt:(jint)id_ {
  MTManagerActor_onConnectionDieWithInt_(self, id_);
}

- (void)onNetworkChangedWithAMNetworkStateEnum:(AMNetworkStateEnum *)state {
  MTManagerActor_onNetworkChangedWithAMNetworkStateEnum_(self, state);
}

- (void)forceNetworkCheck {
  MTManagerActor_forceNetworkCheck(self);
}

- (void)requestCheckConnection {
  MTManagerActor_requestCheckConnection(self);
}

- (void)requestCheckConnectionWithLong:(jlong)wait {
  MTManagerActor_requestCheckConnectionWithLong_(self, wait);
}

- (void)checkConnection {
  MTManagerActor_checkConnection(self);
}

- (void)onInMessageWithByteArray:(IOSByteArray *)data
                         withInt:(jint)offset
                         withInt:(jint)len {
  MTManagerActor_onInMessageWithByteArray_withInt_withInt_(self, data, offset, len);
}

- (void)onOutMessageWithByteArray:(IOSByteArray *)data
                          withInt:(jint)offset
                          withInt:(jint)len {
  MTManagerActor_onOutMessageWithByteArray_withInt_withInt_(self, data, offset, len);
}

+ (void)initialize {
  if (self == [MTManagerActor class]) {
    MTManagerActor_NEXT_CONNECTION_ = DKEnvironment_createAtomicIntWithInt_(1);
    J2OBJC_SET_INITIALIZED(MTManagerActor)
  }
}

@end

DKActorRef *MTManagerActor_managerWithMTMTProto_(MTMTProto *mtProto) {
  MTManagerActor_initialize();
  return [((DKActorSystem *) nil_chk(DKActorSystem_system())) actorOfWithDKActorSelection:new_DKActorSelection_initWithDKProps_withNSString_(DKProps_createWithIOSClass_withDKActorCreator_(MTManagerActor_class_(), new_MTManagerActor_$1_initWithMTMTProto_(mtProto)), JreStrcat("$$", [((MTMTProto *) nil_chk(mtProto)) getActorPath], @"/manager"))];
}

void MTManagerActor_initWithMTMTProto_(MTManagerActor *self, MTMTProto *mtProto) {
  (void) DKActor_init(self);
  self->networkState_ = AMNetworkStateEnum_get_UNKNOWN();
  self->isCheckingConnections_ = NO;
  self->mtProto_ = mtProto;
  self->endpoints_ = [((MTMTProto *) nil_chk(mtProto)) getEndpoints];
  self->authId_ = [mtProto getAuthId];
  self->sessionId_ = [mtProto getSessionId];
  self->isEnableLog_ = [mtProto isEnableLog];
  self->backoff_ = new_AMExponentialBackoff_initWithInt_withInt_withInt_([mtProto getMinDelay], [mtProto getMaxDelay], [mtProto getMaxFailureCount]);
}

MTManagerActor *new_MTManagerActor_initWithMTMTProto_(MTMTProto *mtProto) {
  MTManagerActor *self = [MTManagerActor alloc];
  MTManagerActor_initWithMTMTProto_(self, mtProto);
  return self;
}

void MTManagerActor_onConnectionCreatedWithInt_withAMConnection_(MTManagerActor *self, jint id_, id<AMConnection> connection) {
  if ([((id<AMConnection>) nil_chk(connection)) isClosed]) {
    if (self->isEnableLog_) {
      AMLog_wWithNSString_withNSString_(MTManagerActor_TAG_, JreStrcat("$I$", @"Unable to register connection #", id_, @": already closed"));
    }
    return;
  }
  if (self->currentConnectionId_ == id_) {
    if (self->isEnableLog_) {
      AMLog_wWithNSString_withNSString_(MTManagerActor_TAG_, JreStrcat("$I$", @"Unable to register connection #", id_, @": already have connection"));
    }
    return;
  }
  AMLog_dWithNSString_withNSString_(MTManagerActor_TAG_, JreStrcat("$I$", @"Connection #", id_, @" created"));
  if (self->currentConnection_ != nil) {
    [self->currentConnection_ close];
    self->currentConnectionId_ = 0;
  }
  self->currentConnectionId_ = id_;
  self->currentConnection_ = connection;
  [((AMExponentialBackoff *) nil_chk(self->backoff_)) onSuccess];
  self->isCheckingConnections_ = NO;
  MTManagerActor_requestCheckConnection(self);
  [((DKActorRef *) nil_chk(self->sender_)) sendWithId:new_MTSenderActor_ConnectionCreated_init()];
}

void MTManagerActor_onConnectionCreateFailure(MTManagerActor *self) {
  AMLog_wWithNSString_withNSString_(MTManagerActor_TAG_, @"Connection create failure");
  [((AMExponentialBackoff *) nil_chk(self->backoff_)) onFailure];
  self->isCheckingConnections_ = NO;
  MTManagerActor_requestCheckConnectionWithLong_(self, [self->backoff_ exponentialWait]);
}

void MTManagerActor_onConnectionDieWithInt_(MTManagerActor *self, jint id_) {
  AMLog_wWithNSString_withNSString_(MTManagerActor_TAG_, JreStrcat("$I$", @"Connection #", id_, @" dies"));
  if (self->currentConnectionId_ == id_) {
    self->currentConnectionId_ = 0;
    self->currentConnection_ = nil;
    MTManagerActor_requestCheckConnection(self);
  }
}

void MTManagerActor_onNetworkChangedWithAMNetworkStateEnum_(MTManagerActor *self, AMNetworkStateEnum *state) {
  AMLog_wWithNSString_withNSString_(MTManagerActor_TAG_, JreStrcat("$@", @"Network configuration changed: ", state));
  self->networkState_ = state;
  [((AMExponentialBackoff *) nil_chk(self->backoff_)) reset];
  MTManagerActor_checkConnection(self);
}

void MTManagerActor_forceNetworkCheck(MTManagerActor *self) {
  if (self->currentConnection_ != nil) {
    [self->currentConnection_ checkConnection];
  }
}

void MTManagerActor_requestCheckConnection(MTManagerActor *self) {
  MTManagerActor_requestCheckConnectionWithLong_(self, 0);
}

void MTManagerActor_requestCheckConnectionWithLong_(MTManagerActor *self, jlong wait) {
  if (!self->isCheckingConnections_) {
    if (self->currentConnection_ == nil) {
      if (wait == 0) {
        AMLog_wWithNSString_withNSString_(MTManagerActor_TAG_, @"Requesting connection creating");
      }
      else {
        AMLog_wWithNSString_withNSString_(MTManagerActor_TAG_, JreStrcat("$J$", @"Requesting connection creating in ", wait, @" ms"));
      }
    }
    [((DKActorRef *) nil_chk([self self__])) sendOnceWithId:new_MTManagerActor_PerformConnectionCheck_init() withLong:wait];
  }
}

void MTManagerActor_checkConnection(MTManagerActor *self) {
  if (self->isCheckingConnections_) {
    return;
  }
  if (self->currentConnection_ == nil) {
    if (self->networkState_ == AMNetworkStateEnum_get_NO_CONNECTION()) {
      AMLog_dWithNSString_withNSString_(MTManagerActor_TAG_, @"Not trying to create connection: Not network available");
      return;
    }
    AMLog_dWithNSString_withNSString_(MTManagerActor_TAG_, @"Trying to create connection...");
    self->isCheckingConnections_ = YES;
    jint id_ = [((AMAtomicIntegerCompat *) nil_chk(MTManagerActor_NEXT_CONNECTION_)) getAndIncrement];
    [((id<AMNetworkProvider>) nil_chk([((MTMTProto *) nil_chk(self->mtProto_)) getNetworkProvider])) createConnectionWithId:id_ withMTVersion:AMActorApi_MTPROTO_VERSION withApiMajor:AMActorApi_API_MAJOR_VERSION withApiMinor:AMActorApi_API_MINOR_VERSION withEndpoint:[((AMEndpoints *) nil_chk(self->endpoints_)) fetchEndpoint] withCallback:new_MTManagerActor_$2_initWithMTManagerActor_withInt_(self, id_) withCreateCallback:new_MTManagerActor_$3_initWithMTManagerActor_withInt_(self, id_)];
  }
}

void MTManagerActor_onInMessageWithByteArray_withInt_withInt_(MTManagerActor *self, IOSByteArray *data, jint offset, jint len) {
  BSDataInput *bis = new_BSDataInput_initWithByteArray_withInt_withInt_(data, offset, len);
  @try {
    jlong authId = [bis readLong];
    jlong sessionId = [bis readLong];
    if (authId != self->authId_ || sessionId != self->sessionId_) {
      @throw new_JavaIoIOException_initWithNSString_(@"Incorrect header");
    }
    jlong messageId = [bis readLong];
    IOSByteArray *payload = [bis readProtoBytes];
    [((DKActorRef *) nil_chk(self->receiver_)) sendWithId:new_MTProtoMessage_initWithLong_withByteArray_(messageId, payload)];
  }
  @catch (JavaIoIOException *e) {
    AMLog_wWithNSString_withNSString_(MTManagerActor_TAG_, @"Closing connection: incorrect package");
    [((JavaIoIOException *) nil_chk(e)) printStackTrace];
    if (self->currentConnection_ != nil) {
      [self->currentConnection_ close];
      self->currentConnection_ = nil;
      self->currentConnectionId_ = 0;
    }
    MTManagerActor_checkConnection(self);
  }
}

void MTManagerActor_onOutMessageWithByteArray_withInt_withInt_(MTManagerActor *self, IOSByteArray *data, jint offset, jint len) {
  if (self->currentConnection_ != nil && [self->currentConnection_ isClosed]) {
    self->currentConnection_ = nil;
    self->currentConnectionId_ = 0;
    MTManagerActor_checkConnection(self);
  }
  if (self->currentConnection_ != nil) {
    BSDataOutput *bos = new_BSDataOutput_init();
    [bos writeLongWithLong:self->authId_];
    [bos writeLongWithLong:self->sessionId_];
    [bos writeBytesWithByteArray:data withInt:offset withInt:len];
    IOSByteArray *pkg = [bos toByteArray];
    [self->currentConnection_ postWithData:pkg withOffset:0 withLength:((IOSByteArray *) nil_chk(pkg))->size_];
  }
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(MTManagerActor)

@implementation MTManagerActor_OutMessage

- (instancetype)initWithByteArray:(IOSByteArray *)message
                          withInt:(jint)offset
                          withInt:(jint)len {
  MTManagerActor_OutMessage_initWithByteArray_withInt_withInt_(self, message, offset, len);
  return self;
}

- (jint)getOffset {
  return offset_;
}

- (jint)getLen {
  return len_;
}

- (IOSByteArray *)getMessage {
  return message_;
}

@end

void MTManagerActor_OutMessage_initWithByteArray_withInt_withInt_(MTManagerActor_OutMessage *self, IOSByteArray *message, jint offset, jint len) {
  (void) NSObject_init(self);
  self->message_ = message;
  self->offset_ = offset;
  self->len_ = len;
}

MTManagerActor_OutMessage *new_MTManagerActor_OutMessage_initWithByteArray_withInt_withInt_(IOSByteArray *message, jint offset, jint len) {
  MTManagerActor_OutMessage *self = [MTManagerActor_OutMessage alloc];
  MTManagerActor_OutMessage_initWithByteArray_withInt_withInt_(self, message, offset, len);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(MTManagerActor_OutMessage)

@implementation MTManagerActor_InMessage

- (instancetype)initWithByteArray:(IOSByteArray *)data
                          withInt:(jint)offset
                          withInt:(jint)len {
  MTManagerActor_InMessage_initWithByteArray_withInt_withInt_(self, data, offset, len);
  return self;
}

- (IOSByteArray *)getData {
  return data_;
}

- (jint)getOffset {
  return offset_;
}

- (jint)getLen {
  return len_;
}

@end

void MTManagerActor_InMessage_initWithByteArray_withInt_withInt_(MTManagerActor_InMessage *self, IOSByteArray *data, jint offset, jint len) {
  (void) NSObject_init(self);
  self->data_ = data;
  self->offset_ = offset;
  self->len_ = len;
}

MTManagerActor_InMessage *new_MTManagerActor_InMessage_initWithByteArray_withInt_withInt_(IOSByteArray *data, jint offset, jint len) {
  MTManagerActor_InMessage *self = [MTManagerActor_InMessage alloc];
  MTManagerActor_InMessage_initWithByteArray_withInt_withInt_(self, data, offset, len);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(MTManagerActor_InMessage)

@implementation MTManagerActor_NetworkChanged

- (instancetype)initWithAMNetworkStateEnum:(AMNetworkStateEnum *)state {
  MTManagerActor_NetworkChanged_initWithAMNetworkStateEnum_(self, state);
  return self;
}

@end

void MTManagerActor_NetworkChanged_initWithAMNetworkStateEnum_(MTManagerActor_NetworkChanged *self, AMNetworkStateEnum *state) {
  (void) NSObject_init(self);
  self->state_ = state;
}

MTManagerActor_NetworkChanged *new_MTManagerActor_NetworkChanged_initWithAMNetworkStateEnum_(AMNetworkStateEnum *state) {
  MTManagerActor_NetworkChanged *self = [MTManagerActor_NetworkChanged alloc];
  MTManagerActor_NetworkChanged_initWithAMNetworkStateEnum_(self, state);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(MTManagerActor_NetworkChanged)

@implementation MTManagerActor_ForceNetworkCheck

- (instancetype)init {
  MTManagerActor_ForceNetworkCheck_init(self);
  return self;
}

@end

void MTManagerActor_ForceNetworkCheck_init(MTManagerActor_ForceNetworkCheck *self) {
  (void) NSObject_init(self);
}

MTManagerActor_ForceNetworkCheck *new_MTManagerActor_ForceNetworkCheck_init() {
  MTManagerActor_ForceNetworkCheck *self = [MTManagerActor_ForceNetworkCheck alloc];
  MTManagerActor_ForceNetworkCheck_init(self);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(MTManagerActor_ForceNetworkCheck)

@implementation MTManagerActor_PerformConnectionCheck

- (instancetype)init {
  MTManagerActor_PerformConnectionCheck_init(self);
  return self;
}

@end

void MTManagerActor_PerformConnectionCheck_init(MTManagerActor_PerformConnectionCheck *self) {
  (void) NSObject_init(self);
}

MTManagerActor_PerformConnectionCheck *new_MTManagerActor_PerformConnectionCheck_init() {
  MTManagerActor_PerformConnectionCheck *self = [MTManagerActor_PerformConnectionCheck alloc];
  MTManagerActor_PerformConnectionCheck_init(self);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(MTManagerActor_PerformConnectionCheck)

@implementation MTManagerActor_ConnectionDie

- (instancetype)initWithInt:(jint)connectionId {
  MTManagerActor_ConnectionDie_initWithInt_(self, connectionId);
  return self;
}

- (jint)getConnectionId {
  return connectionId_;
}

@end

void MTManagerActor_ConnectionDie_initWithInt_(MTManagerActor_ConnectionDie *self, jint connectionId) {
  (void) NSObject_init(self);
  self->connectionId_ = connectionId;
}

MTManagerActor_ConnectionDie *new_MTManagerActor_ConnectionDie_initWithInt_(jint connectionId) {
  MTManagerActor_ConnectionDie *self = [MTManagerActor_ConnectionDie alloc];
  MTManagerActor_ConnectionDie_initWithInt_(self, connectionId);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(MTManagerActor_ConnectionDie)

@implementation MTManagerActor_ConnectionCreateFailure

- (instancetype)init {
  MTManagerActor_ConnectionCreateFailure_init(self);
  return self;
}

@end

void MTManagerActor_ConnectionCreateFailure_init(MTManagerActor_ConnectionCreateFailure *self) {
  (void) NSObject_init(self);
}

MTManagerActor_ConnectionCreateFailure *new_MTManagerActor_ConnectionCreateFailure_init() {
  MTManagerActor_ConnectionCreateFailure *self = [MTManagerActor_ConnectionCreateFailure alloc];
  MTManagerActor_ConnectionCreateFailure_init(self);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(MTManagerActor_ConnectionCreateFailure)

@implementation MTManagerActor_ConnectionCreated

- (instancetype)initWithInt:(jint)connectionId
           withAMConnection:(id<AMConnection>)connection {
  MTManagerActor_ConnectionCreated_initWithInt_withAMConnection_(self, connectionId, connection);
  return self;
}

- (jint)getConnectionId {
  return connectionId_;
}

- (id<AMConnection>)getConnection {
  return connection_;
}

@end

void MTManagerActor_ConnectionCreated_initWithInt_withAMConnection_(MTManagerActor_ConnectionCreated *self, jint connectionId, id<AMConnection> connection) {
  (void) NSObject_init(self);
  self->connectionId_ = connectionId;
  self->connection_ = connection;
}

MTManagerActor_ConnectionCreated *new_MTManagerActor_ConnectionCreated_initWithInt_withAMConnection_(jint connectionId, id<AMConnection> connection) {
  MTManagerActor_ConnectionCreated *self = [MTManagerActor_ConnectionCreated alloc];
  MTManagerActor_ConnectionCreated_initWithInt_withAMConnection_(self, connectionId, connection);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(MTManagerActor_ConnectionCreated)

@implementation MTManagerActor_$1

- (MTManagerActor *)create {
  return new_MTManagerActor_initWithMTMTProto_(val$mtProto_);
}

- (instancetype)initWithMTMTProto:(MTMTProto *)capture$0 {
  MTManagerActor_$1_initWithMTMTProto_(self, capture$0);
  return self;
}

@end

void MTManagerActor_$1_initWithMTMTProto_(MTManagerActor_$1 *self, MTMTProto *capture$0) {
  self->val$mtProto_ = capture$0;
  (void) NSObject_init(self);
}

MTManagerActor_$1 *new_MTManagerActor_$1_initWithMTMTProto_(MTMTProto *capture$0) {
  MTManagerActor_$1 *self = [MTManagerActor_$1 alloc];
  MTManagerActor_$1_initWithMTMTProto_(self, capture$0);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(MTManagerActor_$1)

@implementation MTManagerActor_$2

- (void)onConnectionRedirectWithHost:(NSString *)host
                            withPort:(jint)port
                         withTimeout:(jint)timeout {
  [((DKActorRef *) nil_chk([this$0_ self__])) sendWithId:new_MTManagerActor_ConnectionDie_initWithInt_(val$id_)];
}

- (void)onMessageWithData:(IOSByteArray *)data
               withOffset:(jint)offset
               withLength:(jint)len {
  [((DKActorRef *) nil_chk([this$0_ self__])) sendWithId:new_MTManagerActor_InMessage_initWithByteArray_withInt_withInt_(data, offset, len)];
}

- (void)onConnectionDie {
  [((DKActorRef *) nil_chk([this$0_ self__])) sendWithId:new_MTManagerActor_ConnectionDie_initWithInt_(val$id_)];
}

- (instancetype)initWithMTManagerActor:(MTManagerActor *)outer$
                               withInt:(jint)capture$0 {
  MTManagerActor_$2_initWithMTManagerActor_withInt_(self, outer$, capture$0);
  return self;
}

@end

void MTManagerActor_$2_initWithMTManagerActor_withInt_(MTManagerActor_$2 *self, MTManagerActor *outer$, jint capture$0) {
  self->this$0_ = outer$;
  self->val$id_ = capture$0;
  (void) NSObject_init(self);
}

MTManagerActor_$2 *new_MTManagerActor_$2_initWithMTManagerActor_withInt_(MTManagerActor *outer$, jint capture$0) {
  MTManagerActor_$2 *self = [MTManagerActor_$2 alloc];
  MTManagerActor_$2_initWithMTManagerActor_withInt_(self, outer$, capture$0);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(MTManagerActor_$2)

@implementation MTManagerActor_$3

- (void)onConnectionCreatedWithConnection:(id<AMConnection>)connection {
  [((DKActorRef *) nil_chk([this$0_ self__])) sendWithId:new_MTManagerActor_ConnectionCreated_initWithInt_withAMConnection_(val$id_, connection)];
}

- (void)onConnectionCreateError {
  [((DKActorRef *) nil_chk([this$0_ self__])) sendWithId:new_MTManagerActor_ConnectionCreateFailure_init()];
}

- (instancetype)initWithMTManagerActor:(MTManagerActor *)outer$
                               withInt:(jint)capture$0 {
  MTManagerActor_$3_initWithMTManagerActor_withInt_(self, outer$, capture$0);
  return self;
}

@end

void MTManagerActor_$3_initWithMTManagerActor_withInt_(MTManagerActor_$3 *self, MTManagerActor *outer$, jint capture$0) {
  self->this$0_ = outer$;
  self->val$id_ = capture$0;
  (void) NSObject_init(self);
}

MTManagerActor_$3 *new_MTManagerActor_$3_initWithMTManagerActor_withInt_(MTManagerActor *outer$, jint capture$0) {
  MTManagerActor_$3 *self = [MTManagerActor_$3 alloc];
  MTManagerActor_$3_initWithMTManagerActor_withInt_(self, outer$, capture$0);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(MTManagerActor_$3)
