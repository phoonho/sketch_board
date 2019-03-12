#import "SketchBoardPlugin.h"
#import "WHStoryMaker/StoryMakerEditor/StoryMakeImageEditorViewController.h"

@interface SketchBoardPlugin()<EditViewControllerDelegate>
@end

@implementation SketchBoardPlugin{
    FlutterResult _result;
    NSDictionary *_arguments;
    UIViewController *_viewController;
}

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"sketch_board"
            binaryMessenger:[registrar messenger]];
  UIViewController *viewController = [UIApplication sharedApplication].delegate.window.rootViewController;
//  SketchBoardPlugin* instance = [[SketchBoardPlugin alloc] init];
    SketchBoardPlugin* instance = [[SketchBoardPlugin alloc] initWithViewController:viewController];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (instancetype)initWithViewController:(UIViewController *)viewController {
    self = [super init];
    if (self) {
        _viewController = viewController;
    }
    return self;
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  }
  else if([@"SketchBoard" isEqualToString:call.method]){

      _result = result;
      _arguments = call.arguments;
      NSString *sourcePath = call.arguments[@"source_path"];
      NSLog(@"sourcePath:%@",sourcePath);


//      StoryMakeImageEditorViewController *viewController = [StoryMakeImageEditorViewController alloc];
//      [_viewController presentViewController:viewController animated:YES
//                                  completion:nil];
  }
  
  else {
    result(FlutterMethodNotImplemented);
  }
}


#pragma Delegate
- (void)cropViewController:(StoryMakeImageEditorViewController *)editorViewController{

}


@end
