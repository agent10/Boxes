//
//  AppDelegate.h
//  BoxesProject
//
//  Created by Kirill Olenyov on 9/3/11.
//  Copyright House 2011. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface AppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow			*window;
	RootViewController	*viewController;
}

@property (nonatomic, retain) UIWindow *window;

- (void) win:(BOOL)excellent;

@end
