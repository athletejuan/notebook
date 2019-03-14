import pyodbc 
cnxn = pyodbc.connect("Driver={SQL Server Native Client 11.0};"
                        "Server=.;"
                        "Database=VideoShop;"
                        "uid=sa;pwd=Pa$$w0rd")
cursor = cnxn.cursor()
cursor.execute('SELECT * FROM vs_customer')

for row in cursor:
    print('row = %r' % (row,))
    print(type(row))
