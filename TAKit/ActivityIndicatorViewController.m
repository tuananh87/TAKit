//
//  UIActivityIndicatorViewController.m
//  TIMO_PROJECT
//
//  Created by Tuan Anh on 6/2/15.
//  Copyright (c) 2015 MMSOFT. All rights reserved.
//

#import "ActivityIndicatorViewController.h"

@interface ActivityIndicatorViewController ()

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *ai;

@end

@implementation ActivityIndicatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.ai.center = self.view.center;
    [self.ai setAlpha:0];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.ai setAlpha:1];
        [self.view setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.3f]];
        [self.ai startAnimating];
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
