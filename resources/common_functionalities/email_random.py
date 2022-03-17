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

<<<<<<< HEAD
email_random_python()
=======


email_random_python()


>>>>>>> 56a4e31570bfcef936bc4ebd4c8e743f7d83a175
