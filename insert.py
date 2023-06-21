import mysql.connector

def insert_media():
    db = mysql.connector.connect(
        host="localhost",
        user="your_username",
        password="your_password",
        database="your_database"
    )

    cursor = db.cursor()
    print("Indica la información del nuevo medio que quieres añadir con el formato siguiente: nombre, ciudad, region, pais, continente, año de creación")
    data = input().split(', ')

    add_media = ("INSERT INTO MedioDePrensa "
                 "(Nombre, Ciudad, Region, Pais, Continente, AñoDeFundacion) "
                 "VALUES (%s, %s, %s, %s, %s, %s)")

    cursor.execute(add_media, (data[0], data[1], data[2], data[3], data[4], int(data[5])))

    db.commit()
    cursor.close()
    db.close()

if __name__ == "__main__":
    insert_media()
