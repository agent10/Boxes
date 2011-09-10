//
//  ContactReceiver.cpp
//  BoxesProject
//
//  Created by Kirill Olenyov on 9/10/11.
//  Copyright 2011 House. All rights reserved.
//

#include "ContactReceiver.h"
#include <iostream>

ContactReceiver::ContactReceiver(id<ContactReceiverCallback> callback)
{
    this->delegate = callback;
}

ContactReceiver::~ContactReceiver()
{
    
}

void ContactReceiver::BeginContact(b2Contact* contact)
{
    [delegate onNewContact:contact];
}