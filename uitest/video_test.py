import unittest
from appium import webdriver
from time import sleep

class AppiumFlutterTVTests(unittest.TestCase):

    def setUp(self):
        desired_caps = {
            'platformName': 'Android',  # or 'iOS' for Apple TV
            'platformVersion': '9.0',   # Update with your platform version
            'deviceName': 'Android TV', # or 'Apple TV' for Apple TV
            'appPackage': '<your_package_name>', # Update with your app package name
            'appActivity': '<your_main_activity>', # Update with your app main activity
            'automationName': 'Flutter'
        }
        self.driver = webdriver.Remote('http://localhost:4723/wd/hub', desired_caps)

    def tearDown(self):
        self.driver.quit()

    def test_video_list_navigation(self):
        # Wait for the app to load
        sleep(5)

        # Locate the video list item and click on it
        video_list_item = self.driver.find_element_by_xpath("//android.widget.ListView/android.widget.LinearLayout[1]")
        video_list_item.click()

        # Wait for the player screen to load
        sleep(5)

        # Verify if the player screen is displayed
        player_screen = self.driver.find_element_by_id("<your_player_screen_id>") # Update with your player screen ID
        self.assertTrue(player_screen.is_displayed())


if __name__ == '__main__':
    suite = unittest.TestLoader().loadTestsFromTestCase(AppiumFlutterTVTests)
    unittest.TextTestRunner(verbosity=2).run(suite)
