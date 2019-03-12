//
//  StoryMakeImageEditorViewController.h
//  GetZSCStoryMaker
//
//  Created by whbalzac on 09/08/2017.
//  Copyright © 2017 makeupopular.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StoryMakeImageEditorViewController : UIViewController

- (instancetype)initWithImage:(UIImage *)image;

@end

@protocol EditViewControllerDelegate <NSObject>
@optional
- (void)cropViewController:(nonnull StoryMakeImageEditorViewController *)editorViewController;
@end
