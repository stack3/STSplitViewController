STSplitViewController
=====================

Simple SplitViewController.

## Requirements

- iOS 5.0 and later.
- Automatic reference counting. (ARC)

## Features

- Support iPad/iPhone. (Universal)
- Support header view and footer view.
- Customize detail view width each interface orientation individually.
- Customize devider view.
- Simple code and short code. Easy to customize.

## License

MIT License

## Screenshots

![Settings Window](https://raw.github.com/stack3/STSplitViewController/master/Screenshots/ipad01-640.png)

![Settings Window](https://raw.github.com/stack3/STSplitViewController/master/Screenshots/ipad02-640.png)

![Settings Window](https://raw.github.com/stack3/STSplitViewController/master/Screenshots/ipad03-640.png)

![Settings Window](https://raw.github.com/stack3/STSplitViewController/master/Screenshots/ipad04-640.png)

## Samples

### Master and Detail

```objectivec
STSplitViewController *splitViewController = [[STSplitViewController alloc] init];  
splitViewController.dividerWidth = dividerWidth;
UIViewController *masterViewController = [[STMasterViewController alloc] init];
UIViewController *detailViewController = [[STDetailViewController alloc] init];
splitViewController.masterViewController = masterViewController;
splitViewController.detailViewController = detailViewController;
[self presentViewController:splitViewController animated:YES completion:nil];
```

STMasterViewController and STDetailViewController are just sample ViewControllers. You need to prepare own subclass of UIViewController for master and detail.

### Master, Detail, Header and Footer

```objectivec
STSplitViewController *splitViewController = [[STSplitViewController alloc] init];
splitViewController.dividerWidth = dividerWidth;
splitViewController.masterViewController = [[STMasterViewController alloc] init];
splitViewController.detailViewController = [[STDetailViewController alloc] init];
splitViewController.headerViewController = [[STHeaderViewController alloc] init];
splitViewController.headerViewHeight = 80;
splitViewController.footerViewController = [[STFooterViewController alloc] init];
splitViewController.footerViewHeight = 80;

[self presentViewController:splitViewController animated:YES completion:nil];
```

The footer is useful to place iAd banner.

### Notice problem with using NavigationController

This is not recommended. Because second NavigationController's view might be placed at the wrong position.

```objectivec
UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:detailViewController];
splitViewController.detailViewController = navigationController;

// Something you do.

// Set NavigationController again as DetailViewController.
UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:detailViewController2];
splitViewController.detailViewController = navigationController;
```

This is recommended.

```objectivec
UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:detailViewController];
splitViewController.detailViewController = navigationController;

// Something you do.

// Set NavigationController#viewControllers.
UINavigationController *navigationController = (UINavigationController *)splitViewController.detailViewController;
[navigationController setViewControllers:@[detailViewController2]]
```
