"""
WSGI config for main_project project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/3.0/howto/deployment/wsgi/
"""

import os
import sys

sys.path.append('/var/www/winn/py_django_itrac')
sys.path.append('/var/www/winn/py_django_itrac/main_project')
sys.path.append('/var/www/winn/venv/lib/python3.8/site-packages')
sys.path.append('/var/www/winn/venv/lib/python3.8')
#sys.path.remove('/usr/lib/python36.zip')
#sys.path.remove('/usr/lib/python3.6')
#sys.path.remove('/usr/lib/python3.6/lib-dynload')


from django.core.wsgi import get_wsgi_application


os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'main_project.settings')

application = get_wsgi_application()
