import mysql.connector

def read_media():
    db = mysql.connector.connect(
        host="localhost",
        user="your_username",
        password="your_password",
        database="your_database"
    )

    cursor = db.cursor()
    cursor.execute("SELECT * FROM MedioDePrensa")
    
    for row in cursor.fetchall():
        print(row)

    cursor.close()
    db.close()

if __name__ == "__main__":
    read_media()
