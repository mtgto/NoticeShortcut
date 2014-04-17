//
//  TPI_NoticeSupportClass.m
//  NoticeShortcut
//
//  Created by User on 3/5/14.
//  Copyright (c) 2014 mtgto. All rights reserved.
//

#import "TPI_NoticeSupportClass.h"

@implementation TPI_NoticeSupportClass

- (id)interceptUserInput:(id)input command:(NSString *)command
{
    if ([NSEvent modifierFlags] & NSControlKeyMask && [command isEqualToString:@"PRIVMSG"]) {
        NSString *prefix = [NSString stringWithFormat:@"/notice %@ ", self.worldController.selectedChannel.name];
        if ([input isKindOfClass:[NSAttributedString class]]) {
            NSString *string = [input string];
            NSMutableAttributedString *newInput = [[NSMutableAttributedString alloc] initWithAttributedString:input];
            for (NSInteger i=[string length]; i>=0; i--) {
                unichar c = [string characterAtIndex:i-1];
                if (i == 0 || c == NSLineSeparatorCharacter || c == NSNewlineCharacter) {
                    [newInput insertAttributedString:[[NSAttributedString alloc] initWithString:prefix] atIndex:i];
                }
            }
            return newInput;
        } else {
            NSMutableString *newInput = [[NSMutableString alloc] initWithCapacity:[input length]];
            [(NSString *)input enumerateLinesUsingBlock:^(NSString *line, BOOL *stop) {
                [newInput appendString:prefix];
                [newInput appendString:line];
                [newInput appendString:@"\n"];
            }];
            return newInput;
        }
    }
    return input;
}

@end
