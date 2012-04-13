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

#import "DTTestTableViewController.h"
#import "DTTestTableViewCellNibHook.h"

NSString *const DTTestTableViewControllerCellReuseIdentifier = @"Cell";

@implementation DTTestTableViewController

#pragma mark -
#pragma mark UITableViewDataSource methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [[tableView dequeueReusableCellWithIdentifier:DTTestTableViewControllerCellReuseIdentifier] retain];
	DTTestTableViewCellNibHook *nibHook;
	
    if (cell) {
		nibHook = [[DTTestTableViewCellNibHook alloc] initWithView:cell];
	} else {
		nibHook = [[DTTestTableViewCellNibHook alloc] initWithNibName:@"DTTestTableViewCell" bundle:nil];
		cell = [(UITableViewCell *)nibHook.view retain];
    }
	
	nibHook.label.text = [NSString stringWithFormat:@"Cell number %i", indexPath.row];
	
	if (indexPath.row % 2 == 0)
		[nibHook.indicator startAnimating];
	else 
		[nibHook.indicator stopAnimating];
    
	[nibHook release];
	
    return [cell autorelease];
}

@end

