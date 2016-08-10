//
//  WelcomeTourPageViewController.swift
//
//
//  Created by QUINTON WALL on 6/27/16.
//  Copyright © 2016 QUINTON WALL. All rights reserved.
//
import UIKit


class WelcomeTourPageViewController: UIPageViewController, UIPageViewControllerDataSource {
    
    var arrPageTitle: NSArray = NSArray()
    var arrPagePhoto: NSArray = NSArray()
    
    
    override func viewWillAppear(animated: Bool) {
        
           }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        arrPageTitle = ["At KLM, we believe in the traditional values of aviation.", "Nothing is more important than an enjoyable experience when traveling.", "We invite you to reKLine. You're with family.", "Buckle your seats. Let's travel together"];
        arrPagePhoto = ["welcome-tour1.png", "welcome-tour2.png", "welcome-tour4.png", "welcome-tour3.png"];
        self.dataSource = self
        
        
        self.setViewControllers([getViewControllerAtIndex(0)] as [UIViewController], direction: UIPageViewControllerNavigationDirection.Forward, animated: false, completion: nil)
    }
    
      
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController?
    {
        let pageContent: WelcomeContentViewController = viewController as! WelcomeContentViewController
        var index = pageContent.pageIndex
        if ((index == 0) || (index == NSNotFound))
        {
            return nil
        }
        index -= 1;
        return getViewControllerAtIndex(index)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController?
    {
        let pageContent: WelcomeContentViewController = viewController as! WelcomeContentViewController
        var index = pageContent.pageIndex
        if (index == NSNotFound)
        {
            return nil;
        }
        index += 1;
        if (index == arrPageTitle.count)
        {
            return nil;
        }
        return getViewControllerAtIndex(index)
    }
    
    func getViewControllerAtIndex(index: NSInteger) -> WelcomeContentViewController
    {
        // Create a new view controller and pass suitable data.
        let pageContentViewController = self.storyboard?.instantiateViewControllerWithIdentifier("WelcomeContent") as! WelcomeContentViewController
        pageContentViewController.strTitle = "\(arrPageTitle[index])"
        pageContentViewController.strPhotoName = "\(arrPagePhoto[index])"
        pageContentViewController.pageIndex = index
        
        //if we are at the last page of the tour show the get started button.
        if(index == arrPageTitle.count-1) {
            pageContentViewController.hideGetStartedButton = false
        } else {
            pageContentViewController.hideGetStartedButton = true
        }
        return pageContentViewController
    }
    
}
