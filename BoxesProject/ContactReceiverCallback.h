//
//  ContactReceiverCallback.h
//  BoxesProject
//
//  Created by Kirill Olenyov on 9/10/11.
//  Copyright 2011 House. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "b2Contact.h"

@protocol ContactReceiverCallback <NSObject>
@optional
- (void)onNewContact:(b2Contact*) contact;
@end
