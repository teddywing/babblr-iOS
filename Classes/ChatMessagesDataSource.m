//
//  ChatMessagesDataSource.m
//  NearMe
//
//  Created by TW on 9/29/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "ChatMessagesDataSource.h"


@implementation ChatMessagesDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *CellIdentifier = @"ChatCell";
	 
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
	}
	 
	// Set up the cell...
	NSString *cellValue = @"test";
	cell.textLabel.text = cellValue;
	 
	return cell;
}

@end
