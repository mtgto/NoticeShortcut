//
//  TPI_NoticeSupportClass.h
//  NoticeShortcut
//
//  Created by User on 3/5/14.
//  Copyright (c) 2014 mtgto. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TPI_NoticeSupportClass : NSObject <THOPluginProtocol>

- (id)interceptUserInput:(id)input command:(NSString *)command;

@end
