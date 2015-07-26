//
//  PlacesDetailViewController.h
//  projectMustang-ios
//
//  Created by selin acar on 2015-07-18.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlacesDetailViewController : UIViewController

//COPIED AND PASTED FOR NOW, OBVI IT WILL CHANGE WHEN I GET A WIRE FRAME!!! **********


@property (nonatomic) UILabel       *eventName;
@property (nonatomic) UILabel       *hostName;
@property (nonatomic) UILabel       *photoSource;
@property (nonatomic) UITextView    *eventDeets;
@property (nonatomic) UIImageView   *photoImage;
@property (nonatomic) NSDictionary  *viewsDictionary;
@property (nonatomic) NSDictionary  *metrics;

-(void) setupViews;
-(void) setupHorizontalSpacing;
-(void) setupSizeConstraints;
-(void) setupPOSConstraints;

@end
