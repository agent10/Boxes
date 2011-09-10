//
//  ContactReceiver.h
//  BoxesProject
//
//  Created by Kirill Olenyov on 9/10/11.
//  Copyright 2011 House. All rights reserved.
//

#ifndef BoxesProject_ContactReceiver_h
#define BoxesProject_ContactReceiver_h

#include "Box2D.h"
#import "ContactReceiverCallback.h"

class ContactReceiver : public b2ContactListener
{
public:
    ContactReceiver(id<ContactReceiverCallback> callback);
    ~ContactReceiver();
    
    virtual void BeginContact(b2Contact* contact);
    
protected:
    id<ContactReceiverCallback> delegate;
};

#endif
