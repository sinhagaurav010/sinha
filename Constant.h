//
//  Constant.h
//  CircularView
//
//  Created by gaurav sinha on 24/02/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#define NUM 6
#define SIZEWID 209
#define SIZEHT 454
#define offSet 0
#define AnimationTime 3

struct queue 
{
	int num;
	UIView *viewShow;
	struct queue *link;
}*objQue;