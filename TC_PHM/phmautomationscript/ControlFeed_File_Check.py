import pandas as pd

def file_lengthy(fname):
        with open(fname) as f:
                for i, l in enumerate(f):
                        pass
        return i + 1
filename1='C:/Users/bjagtap/Desktop/PHM Walkthru/Feeds/2020-03-31_EDH_2020_MYZH_ACTIVITY.csv'
filename2='C:/Users/bjagtap/Desktop/PHM Walkthru/Feeds/2020-03-31_EDH_2020_MYZH_HCP_DETAILS.csv'
#filename3='C:/Users/bjagtap/Desktop/PHM Walkthru/Feeds/2020-03-31_EDH_2020_MYZH_CONTROL.csv'

ControlFile = pd.read_csv(r'C:/Users/bjagtap/Desktop/PHM Walkthru/Feeds/2020-03-31_EDH_2020_MYZH_CONTROL.csv')
df1=pd.DataFrame(ControlFile,columns= ['FILE_NAME', 'RECORD_COUNT'])


print (df1)

Activity=file_lengthy(filename1)
print("Activity Feed Record Count is",Activity)

Details=file_lengthy(filename2)
print("Details Feed Record Count is",Details)

print(Activity)

df1.iloc[0,1]

df1.iloc[0,1]==Activity

print(Details)

df1.iloc[1,1]

df1.iloc[1,1]==Details

Activityfilename=filename1.split('/')[-1] 

DetailsFilename=filename2.split('/')[-1] 


print(Activityfilename)

print(DetailsFilename)

df1.iloc[0,0]

df1.iloc[0,0]==Activityfilename

df1.iloc[1,0]

df1.iloc[1,0]==DetailsFilename

if df1.iloc[0,1]==Activity or df1.iloc[1,1]==Details:
    print("Activity & Details feed file Counts are matched with ControlFile")
else:
          print("Counts are not matched with controlfile")
		  

if df1.iloc[0,0]==Activityfilename or df1.iloc[1,0]==DetailsFilename:
    print("Activity & Details feed filenames are matched with Control file")
else:
    print("Feed file names are not matched with Control File")



