import schedule  
  
def job():  
    print("A Simple Python Scheduler.")  
  
# run the function job() every 2 seconds  
schedule.every(2).seconds.do(job)  
  
while True:  
    schedule.run_pending()  