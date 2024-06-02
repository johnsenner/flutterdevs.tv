class VideoListScreenTests(unittest.TestCase):
    def setUp(self):
        # Setup the desired capabilities and the Appium driver
        self.desired_caps = {
            'platformName': 'Android',  # or 'iOS'
            'platformVersion': '10',
            'deviceName': 'Android Emulator',
            'automationName': 'Flutter',
            'app': 'path/to/your/app.apk',  # or app bundle for iOS
        }
        self.driver = webdriver.Remote('http://localhost:4723/wd/hub', self.desired_caps)
    
    def test_video_list_screen(self):
        # Wait for the video list screen to load
        video_list_screen = self.driver.find_element_by_accessibility_id("Video List")
        self.assertIsNotNone(video_list_screen, "Video list screen not loaded")

        # Scroll the list and check for a specific title
        self.driver.execute_script('flutter:scroll', {'direction': 'down', 'element': video_list_screen})

        # Assuming titles are accessible by their text
        titles = self.driver.find_elements_by_class_name('flutter text')
        expected_titles = [
            'Intro to Flutter', 'Flutter Widgets', 'Life Cycle of a Widget', 
            'BlocProvider and RepositoryProvider'
        ]
        for title in titles:
            self.assertIn(title.text, expected_titles, "Unexpected title")

        # Tap on the first item to navigate to the next screen
        first_item = self.driver.find_element_by_accessibility_id('Intro to Flutter')
        first_item.click()

        # Check if the next screen is loaded
        next_screen = self.driver.find_element_by_accessibility_id("Video Player Route")
        self.assertIsNotNone(next_screen, "Next screen not loaded")

    def tearDown(self):
        # end the session
        self.driver.quit()

if __name__ == '__main__':
    unittest.main()
