//
//  IPMenuBarAppDelegate.m
//  IPMenuBar
//
//  Created by Ikeuchi on 10/06/19.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "IPMenuBarAppDelegate.h"

#define kWhatIsMyIPURL @"http://softboysxp.com/cgi-bin/get_ip.cgi"
#define kQueryIPInterval 10

@implementation IPMenuBarAppDelegate

@synthesize statusMenu, updateTimer, statusItem;

- (NSString *)getExternalIPAddress {
	return [NSString stringWithContentsOfURL:[NSURL URLWithString:kWhatIsMyIPURL] encoding:NSASCIIStringEncoding error:NULL];
}

- (void)updateIPAddress:(NSTimer *)aTimer {
	self.statusItem.title = [self getExternalIPAddress];
}

- (IBAction)manualUpdate:(id)sender {
	[self.updateTimer fire];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	self.statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
	self.statusItem.title = @"Querying ...";
	self.statusItem.menu = self.statusMenu;
	
	self.updateTimer = [NSTimer scheduledTimerWithTimeInterval:kQueryIPInterval target:self selector:@selector(updateIPAddress:) userInfo:nil repeats:YES];
	[self.updateTimer fire];
}

- (void)applicationWillTerminate:(NSNotification *)notification {
	[self.updateTimer invalidate];
	[self.updateTimer release];
	
	[self.statusItem release];
	[self.statusMenu release];
}

@end
