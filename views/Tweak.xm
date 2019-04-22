@interface CCUIModuleCollectionViewController : UIViewController {
	
	NSDictionary *_moduleContainerViewByIdentifier;
}

- (void)viewWillAppear:(BOOL)arg1;

@end

@interface CCUIContentModuleContainerView : UIView
@end

%hook CCUIModuleCollectionViewController
	- (void)viewWillAppear:(BOOL)arg1 {
		%orig;
		
		NSDictionary *moduleDictionary = MSHookIvar<NSDictionary *>(self, "_moduleContainerViewByIdentifier");
		for (NSString *key in moduleDictionary) {
			id val = moduleDictionary[key];
			
			if ([val isMemberOfClass:[%c(CCUIContentModuleContainerView) class]]) {
				[val setBackgroundColor:[UIColor blueColor]];
			}
		}
	}
%end