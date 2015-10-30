//
//  BestPayAbentView.h
//  OAProject
//
//  Created by 尹鹏 on 10/29/15.
//  Copyright © 2015 Josh.Shron. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BestPayAbentView : UIView
@property (weak, nonatomic) IBOutlet UITextField *accountNOTF;
@property (weak, nonatomic) IBOutlet UITextField *accountNOTF2;
- (IBAction)verify:(UIButton *)sender;

@end
