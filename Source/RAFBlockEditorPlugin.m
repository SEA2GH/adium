/* 
 * Adium is the legal property of its developers, whose names are listed in the copyright file included
 * with this source distribution.
 * 
 * This program is free software; you can redistribute it and/or modify it under the terms of the GNU
 * General Public License as published by the Free Software Foundation; either version 2 of the License,
 * or (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even
 * the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General
 * Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License along with this program; if not,
 * write to the Free Software Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 */

#import "RAFBlockEditorPlugin.h"
#import <AIUtilities/AIMenuAdditions.h>
#import <AIUtilities/AIStringAdditions.h>

@implementation RAFBlockEditorPlugin

- (void)installPlugin
{
	//Install the Block menu items
	blockEditorMenuItem = [[NSMenuItem alloc] initWithTitle:[AILocalizedString(@"Privacy Settings", nil) stringByAppendingEllipsis]
													  target:self
													  action:@selector(showEditor:)
											   keyEquivalent:@"p"];
	[blockEditorMenuItem setKeyEquivalentModifierMask:(NSAlternateKeyMask | NSCommandKeyMask)];
	[adium.menuController addMenuItem:blockEditorMenuItem toLocation:LOC_Adium_Preferences];
	
	//Install our preference view
	preferences = (RAFBlockEditorWindowController *)[RAFBlockEditorWindowController preferencePaneForPlugin:self];
}

- (IBAction)showEditor:(id)sender
{
	[RAFBlockEditorWindowController showWindow];
}
@end
