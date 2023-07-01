import mysql.connector

def insert_media():
    db = mysql.connector.connect(
        host="localhost",
        user="your_username",
        password="your_password",
        database="your_database"
    )

    cursor = db.cursor()
    print("Indica la información del medio que quieres añadir con el  siguiente formato: nombre, ciudad, región, país, continente, año de creación")
    media_data = input().split(', ')

    add_media = ("INSERT INTO MedioDePrensa "
                 "(Nombre, Ciudad, Region, Pais, Continente, AnioDeFundacion) "
                 "VALUES (%s, %s, %s, %s, %s, %s)")
    cursor.execute(add_media, (media_data[0], media_data[1], media_data[2], media_data[3], media_data[4], int(media_data[5])))
    media_id = cursor.lastrowid

  
    print("Indica la información del fundador con el siguiente formato: nombre, fecha de nacimiento")
    founder_data = input().split(', ')
    add_founder = ("INSERT INTO Fundadores "
                   "(Nombre, FechaDeNacimiento, FK_MedioDePrensa) "
                   "VALUES (%s, %s, %s)")
    cursor.execute(add_founder, (founder_data[0], founder_data[1], media_id))
    
    print("Indica la información de la ubicación con el siguiente formato: región, país, ciudad, continente")
    location_data = input().split(', ')
    add_location = ("INSERT INTO Ubicacion "
                    "(Region, Pais, Ciudad, Continente, FK_MedioDePrensa) "
                    "VALUES (%s, %s, %s, %s, %s)")
    cursor.execute(add_location, (location_data[0], location_data[1], location_data[2], location_data[3], media_id))

    print("Indica la información de la red social con el siguiente formato: nombre, número de seguidores, plataforma")
    social_data = input().split(', ')
    add_social = ("INSERT INTO RedesSociales "
                  "(Nombre, NumSeguidores, Plataforma, FK_MedioDePrensa) "
                  "VALUES (%s, %s, %s, %s)")
    cursor.execute(add_social, (social_data[0], social_data[1], social_data[2], media_id))

    db.commit()
    cursor.close()
    db.close()

if __name__ == "__main__":
    insert_media()

