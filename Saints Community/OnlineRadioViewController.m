//
//  OnlineRadioViewController.m
//  Saints Community
//
//  Created by Kehinde Shittu on 31/10/2015.
//  Copyright © 2015 Kehesjay. All rights reserved.
//

#import "OnlineRadioViewController.h"
#import "Utils.h"

@interface OnlineRadioViewController ()
@end

@implementation OnlineRadioViewController
static NSString * RADIO_URL = @"http://lwm.radiojar.com/";
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [Utils initSidebar:self barButton:self.sidebarButton];
    [Utils loadUIWebView:self.view url:RADIO_URL];
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
