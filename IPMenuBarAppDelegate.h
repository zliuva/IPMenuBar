//
//  IPMenuBarAppDelegate.h
//  IPMenuBar
//
//  Created by Ikeuchi on 10/06/19.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface IPMenuBarAppDelegate : NSObject <NSApplicationDelegate> {
	NSStatusItem *statusItem;
	NSTimer *updateTimer;
	NSMenu *statusMenu;
}

- (IBAction)manualUpdate:(id)sender;

@property (nonatomic, retain) IBOutlet NSMenu *statusMenu;

@property (nonatomic, retain) NSTimer *updateTimer;
@property (nonatomic, retain) NSStatusItem *statusItem;

@end
