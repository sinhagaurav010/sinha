//
//  ImagesLoopViewController.m
//  CircularView
//
//  Created by gaurav sinha on 25/02/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ImagesLoopViewController.h"


@implementation ImagesLoopViewController

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/

@synthesize scrollView;


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	
    [super viewDidLoad];
	
	[self addImageWithName:@"image4.jpg" atPosition:0];
	scrollView.pagingEnabled = YES;
	
	// add all of the images to the scroll view
	for (int i = 1; i < 5; i++)
	{
		[self addImageWithName:[NSString stringWithFormat:@"image%i.jpg",i] atPosition:i];
	}
	
	// add the first image (image1) into the last position
	[self addImageWithName:@"image1.jpg" atPosition:5];
	
	scrollView.contentSize = CGSizeMake(1920, 416);    
	[scrollView scrollRectToVisible:CGRectMake(320,0,320,416) animated:NO]; 
	

}


- (void)addImageWithName:(NSString*)imageString atPosition:(int)position 
{
	// add image to scroll view
	UIImage *image = [UIImage imageNamed:imageString];
	UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
	imageView.frame = CGRectMake(position*320, 0, 320, 416);
	[scrollView addSubview:imageView];
	[imageView release];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)sender {    
	NSLog(@"%f",scrollView.contentOffset.x);
	// The key is repositioning without animation      
	if (scrollView.contentOffset.x == 0)
	{         
		// user is scrolling to the left from image 1 to image 4         
		// reposition offset to show image 4 that is on the right in the scroll view         
		[scrollView scrollRectToVisible:CGRectMake(1280,0,320,416) animated:NO];     
	}    
	else if (scrollView.contentOffset.x == 1600) 
	{         
		// user is scrolling to the right from image 4 to image 1        
		// reposition offset to show image 1 that is on the left in the scroll view         
		[scrollView scrollRectToVisible:CGRectMake(320,0,320,416) animated:NO];         
	} 
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
