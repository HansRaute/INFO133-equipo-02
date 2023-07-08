import random
from requests_html import HTMLSession
import w3lib.html
import html
import mariadb
import sys
import time

def format_date(date):
    return(date.split("T")[0])

session = HTMLSession()

USER_AGENT_LIST = [
]
headers = {'user-agent':random.choice(USER_AGENT_LIST) }

xpath_title="//div//h1"
xpath_date="//meta[@property='article:published_time']//@content"
xpath_text="//div[@class='abody-basic']//p"
xpath_news_url = "//div[@class='news-item']//a//@href" 
try:
    conn = mariadb.connect(
        user="your_username",
        password="your_password",
        host="localhost",
        port=3306,
        database="Proyecto_A"
    )
except mariadb.Error as e:
    print(f"Error connecting to MariaDB Platform: {e}")
    sys.exit(1)

cur = conn.cursor()
cur.execute("SELECT URL_Categoria, ID_Prensa FROM MedioDePrensa")

url_and_prensa_ids = cur.fetchall() 

for url, prensa_id in url_and_prensa_ids:
    response = session.get(url, headers=headers)
    news_urls = response.html.xpath(xpath_news_url)

    for news_url in news_urls:
        response = session.get(news_url, headers=headers)
        title = response.html.xpath(xpath_title)[0].text
        date = format_date(response.html.xpath(xpath_date)[0])
        list_p = response.html.xpath(xpath_text)
        text = " ".join([p.text.strip() for p in list_p])

        text = w3lib.html.remove_tags(text)
        text = w3lib.html.replace_escape_chars(text)
        text = html.unescape(text)

        query = f"INSERT INTO Noticia (XPATH_Titulo, XPATH_Contenido, XPATH_url, XPATH_Fecha, FK_Medio_de_prensa) VALUES (?, ?, ?, ?, ?)"
        cur.execute(query, (title, text, news_url, date, prensa_id))
        conn.commit()
        time.sleep(1)

conn.close()

