//
//  ViewController.m
//  ASTestProject
//
//  Created by Andy LaVoy on 1/11/15.
//  Copyright (c) 2015 Andy LaVoy. All rights reserved.
//

#import "ViewController.h"
#import "ButtonNode.h"

static CGFloat const kPadding = 20;

@interface ViewController ()

@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.scrollView.alwaysBounceVertical = YES;
    [self.view addSubview:self.scrollView];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        ButtonNode *buttonNode = [ButtonNode buttonWithTitle:@"Watch Video"];        
        [buttonNode measure:CGSizeMake(self.view.bounds.size.width - (2 * kPadding), CGFLOAT_MAX)];
        
        buttonNode.frame = (CGRect) {
            .origin = CGPointMake(kPadding, 200),
            .size = buttonNode.calculatedSize,
        };
        
        [buttonNode addTarget:self action:@selector(buttonPressed:) forControlEvents:ASControlNodeEventTouchUpInside];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.scrollView addSubview:buttonNode.view];
        });
    });
}

- (void)buttonPressed:(id)sender {
    NSLog(@"button pressed");
}

@end
