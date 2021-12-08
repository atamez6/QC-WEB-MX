import random
import string
	
def email_random_python():
	alphabet_list = list(string.ascii_lowercase)
	var1 = list(string.digits)
	var2 = ['_','+']
	domain_name ='@gmail.com'
	count = 5
	email_random=''.join(random.choice(alphabet_list)+''.join(random.choice(var1))for i in range (count)) + domain_name
	return email_random