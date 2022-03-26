import random
import string
import os

def email_random_python():
    alphabet_list = list(string.ascii_lowercase)
    var1 = list(string.digits)
    var2 = ['_', '+']
    domain_name = '@gmail.com'
    count = 5
    global EMAIL_RANDOM_PYTHON
    EMAIL_RANDOM_PYTHON = ''.join(random.choice(alphabet_list) + ''.join(random.choice(var1)) for i in range(count)) + domain_name
    print(EMAIL_RANDOM_PYTHON)
    return EMAIL_RANDOM_PYTHON

email_random_python()

