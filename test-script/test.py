import random
import unittest
# import xmlrunner
import os
import urllib
import subprocess

class TestScript(unittest.TestCase):

    def setUp(self):
        # Create the source and target directory for file sorting
        os.makedirs("/opt/ap/log")
        os.makedirs("/data/ap/cubedata")
        os.makedirs("/data/ap/inbox")
        
        os.makedirs("/var/tmp/amt")
        
        # 
        filename = "MX_20141130" + '.txt'
        open(os.path.join("/data/ap/inbox", filename), 'a').close()

        # wget  
        urllib.urlretrieve('http://python.org/images/python-logo.gif', '/var/tmp/amt/python-logo.gif')
        
        
        
    def test_filesorting_test(self):
        # run the sc to install sc-tool in test
        
        # run sc to test
        subprocess.call(['sh', '/var/tmp/tests/test-script/bash_script.sh'])
        
        # self.assertEqual(self.seq, list(range(10)))

        # self.assertRaises(TypeError, random.shuffle, (1,2,3))

        self.assertTrue(os.path.isfile("/data/ap/inbox/MX_20141130.txt"))
        self.assertTrue(os.path.isfile("/data/ap/cubedata/EUROPE/20141201/mx/python-logo.gif"))


if __name__ == '__main__':
    unittest.main()
        # testRunner=xmlrunner.XMLTestRunner(output='test-reports'),
        # these make sure that some options that are not applicable
        # remain hidden from the help menu.
        # failfast=False, buffer=False, catchbreak=False)
