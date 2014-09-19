//
//  TestViewController.m
//
//  Copyright iOSDeveloperTips.com All rights reserved.
//

#import "LoginViewController.h"
#import "MovieListTableView.h"
@implementation LoginViewController

- (void)buttonPressed:(UIButton *)button
{
	if (button == loginButton)
  {	
 		// Store username to keychain 	
    if ([username text])
    	[keychain setObject:[username text] forKey:(__bridge id)kSecAttrAccount];
      
 		// Store password to keychain
    if ([password text])
    	[keychain setObject:[password text] forKey:(__bridge id)kSecValueData];
	}
    [self presentViewController:[[MovieListTableView alloc]initWithNibName:@"MovieListTableView" bundle:nil] animated:YES completion:^{
        
    }];
    
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField 
{
  [theTextField resignFirstResponder];
  return YES;
}
- (void)loadView
{
  [self setView:[[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]]];
	[[self view] setBackgroundColor:[UIColor whiteColor]];

	// Create instance of keychain wrapper
	keychain = [[KeychainItemWrapper alloc] initWithIdentifier:@"testID" accessGroup:nil];

  username = [[UITextField alloc] initWithFrame:CGRectMake(40, 130, 240, 30)];
  [username setBorderStyle:UITextBorderStyleRoundedRect];
  [username setPlaceholder:@"Username"];
  [username setDelegate:self];
  [username setEnablesReturnKeyAutomatically: TRUE];
  [username setReturnKeyType:UIReturnKeyDone];
	[username setAdjustsFontSizeToFitWidth:YES];  
  [[self view] addSubview:username];  

	// Get username from keychain (if it exists)
	[username setText:[keychain objectForKey:(__bridge id)kSecAttrAccount]];
  NSLog(@"username: %@", [username text]);

  password = [[UITextField alloc] initWithFrame:CGRectMake(40, 175, 240, 30)];
  [password setBorderStyle:UITextBorderStyleRoundedRect];
  [password setPlaceholder:@"Password"];
  [password setSecureTextEntry:YES];
  [password setDelegate:self];
  [password setEnablesReturnKeyAutomatically: TRUE];
  [password setReturnKeyType:UIReturnKeyDone];
	[password setAdjustsFontSizeToFitWidth:YES];  
  [[self view] addSubview:password];  

	// Get password from keychain (if it exists)  
	[password setText:[keychain objectForKey:(__bridge id)kSecValueData]];
  NSLog(@"password: %@", [password text]);
  
  loginButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  [loginButton setFrame:CGRectMake(80, 230, 160, 40)];
	[loginButton setTitle:@"Login" forState:UIControlStateNormal];
  [loginButton addTarget:self action:@selector(buttonPressed:) forControlEvents: UIControlEventTouchUpInside];        
  [[self view] addSubview:loginButton];
  
}
- (void)dealloc 
{

}

@end
