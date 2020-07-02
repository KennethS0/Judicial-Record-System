import rsa, os, sys, inspect
import datetime

dir = os.path.dirname(os.path.dirname(os.path.abspath(inspect.getfile(inspect.currentframe()))))
sys.path.insert(0, dir)

import Application.Controller.LoginController.LoginController as lc

if __name__ == '__main__':
    lc = lc.LogInController()