/*
Copyright (c) 2010 Daniel Tull.
Copyright (c) 2012 Lolay, Inc.
 
Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
 
* Redistributions of source code must retain the above copyright notice, this
list of conditions and the following disclaimer.
 
* Redistributions in binary form must reproduce the above copyright notice,
this list of conditions and the following disclaimer in the documentation
and/or other materials provided with the distribution.
 
* Neither the name of the author nor the names of its contributors may be used
to endorse or promote products derived from this software without specific
prior written permission.
 
THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

#import "DTNibHookAppDelegate.h"
#import "DTTestNibHook.h"
#import "DTTestTableViewController.h"

@implementation DTNibHookAppDelegate

@synthesize window;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
	
	// This test shows two different instances of the Test Nib Hook. 
	// The first instance creates its view from the nib and assigns all the tags for its properties.
	// The second takes the created view and links its properties to the subviews using the tags.
	
	DTTestNibHook *hook = [[DTTestNibHook alloc] initWithNibName:@"DTTestNibHook" bundle:nil];
	[hook logProperties];
	UIView *view = [hook.view retain];
	[hook release];
	
	DTTestNibHook *hook2 = [[DTTestNibHook alloc] initWithView:view];
	[hook2 logProperties];
	[hook2 release];
	
	
	
	
	DTTestTableViewController *vc = [[DTTestTableViewController alloc] init];
	vc.title = @"DTNibHook";
	navController = [[UINavigationController alloc] initWithRootViewController:vc];
	[vc release];
	
	[window addSubview:navController.view];
    [window makeKeyAndVisible];
	
	return YES;
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
