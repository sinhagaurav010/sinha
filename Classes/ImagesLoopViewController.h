//
//  ImagesLoopViewController.h
//  CircularView
//
//  Created by gaurav sinha on 25/02/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ImagesLoopViewController : UIViewController {
	IBOutlet UIScrollView *scrollView;

}
@property (nonatomic, retain) UIScrollView *scrollView;

- (void)addImageWithName:(NSString*)imageString atPosition:(int)position;
@end
