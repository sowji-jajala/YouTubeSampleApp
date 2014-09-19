//
//  TestViewController.h
//
//  Copyright iOSDeveloperTips.com All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KeychainItemWrapper.h"
@interface LoginViewController : UIViewController <UITextFieldDelegate>
{
	UITextField	*username;
    UITextField *password;
    UIButton	*loginButton;
    KeychainItemWrapper *keychain;
    UIImageView *splashImageView ;
}

@end


