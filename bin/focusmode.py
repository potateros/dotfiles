# import time
# from datetime import datetime as dt

# nowy = dt.now().year
# nowm = dt.now().month
# nowd = dt.now().day
hosts_path = r"/etc/hosts"
redirect = "127.0.0.1"
websites = [
    "www.facebook.com",
    "facebook.com",
    "www.twitter.com"
    "twitter.com",
]

while True:
    if (dt(nowy, nowm, nowd, 23, 58)) < (dt.now()) < (dt(nowy, nowm, nowd, 23, 59)):
        print("true")
        with open(hosts_path, 'r+') as file:
            content = file.read()
            for site in websites:
                if site in content:
                    pass
                else:
                    file.write("\n" + redirect + " " + site)

    else:
        print("false")
        with open(hosts_path, 'r+') as file:
            content = file.readlines()
            file.seek(0)
            for line in content:
                if not any(site in line for site in websites):
                    file.write(line)
            file.truncate()

    #Checks every 5 minutes
    time.sleep(300)

