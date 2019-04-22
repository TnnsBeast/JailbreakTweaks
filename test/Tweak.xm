@interface SBLockScreenViewControllerBase : UIViewController
@end
%hook SBLockScreenViewControllerBase
- (void)viewDidLoad {
	%orig;
	
	//our own code
	UIView *redRectangle = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1000, 1000)];
	[redRectangle setBackgroundColor: [UIColor blueColor]];
	[self.view addSubview:redRectangle]; 
}	
%end