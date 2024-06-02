import 'dart:io';

import 'package:webdriver/sync_io.dart';
import 'package:test/test.dart';

void main() async {
  final osSpecificOps = Platform.environment['APPIUM_OS'] == 'android'
      ? {
          'platformName': 'Android',
          'deviceName': 'Pixel 2',
          'app': '${__dirname()}/../apps/app-free-debug.apk',
        }
      : Platform.environment['APPIUM_OS'] == 'ios'
          ? {
              'platformName': 'iOS',
              'platformVersion': '12.2',
              'deviceName': 'iPhone X',
              'noReset': true,
              'app': '${__dirname()}/../apps/Runner.zip',
            }
          : {};

  final caps = {
    // ...osSpecificOps,
    'automationName': 'Flutter',
    'retryBackoffTime': 500,
  };

  final driver = await createDriver(
    uri: Uri.parse('http://localhost:4723/wd/hub'),
    desired: caps,
  );

  final counterTextFinder = By.name('counter');
  final buttonFinder = By.name('counter');

  if (Platform.environment['APPIUM_OS'] == 'android') {
    await driver.switchTo.frame('NATIVE_APP');
    await (await driver.findElement(const By.id('~fab'))).click();
    await driver.switchTo.frame('FLUTTER');
  } else {
    print(
        'Switching context to `NATIVE_APP` is currently only applicable to Android demo app.');
  }

  expect(await (await driver.findElement(counterTextFinder)).text, '0');

  await (await driver.findElement(buttonFinder)).click();
  await driver.touchAction([
    TouchAction.tap(element: await driver.findElement(buttonFinder)),
  ]);

  expect(await (await driver.findElement(counterTextFinder)).text, '2');

  await driver.quit();
}

String __dirname() => Platform.script.path.replaceAll(RegExp(r'[^/]*$'), '');
