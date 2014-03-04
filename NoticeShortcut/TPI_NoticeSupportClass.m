//
//  TPI_NoticeSupportClass.m
//  NoticeShortcut
//
//  Created by User on 3/5/14.
//  Copyright (c) 2014 mtgto. All rights reserved.
//

#import "TPI_NoticeSupportClass.h"

@interface TPI_NoticeSupportClass()

@property (strong) IRCWorld *world;

@end

@implementation TPI_NoticeSupportClass

- (void)pluginLoadedIntoMemory:(IRCWorld *)world
{
    self.world = world;
}

- (id)interceptUserInput:(id)input command:(NSString *)command
{
    if ([NSEvent modifierFlags] & NSControlKeyMask && [command isEqualToString:@"PRIVMSG"]) {
        if ([input isKindOfClass:[NSAttributedString class]]) {
            NSMutableAttributedString *newInput = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"/notice %@ ", self.world.selectedChannel.name]];
            [newInput appendAttributedString:input];
            return newInput;
        } else {
            return [NSString stringWithFormat:@"/notice %@ %@", self.world.selectedChannel.name, input];
        }
    }
    return input;
}

@end
