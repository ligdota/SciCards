import pandas as pd
import sqlite3
import uuid
import json



df =pd.read_excel("flashcards done.xlsx", engine="openpyxl")

conn = sqlite3.connect("flashcards.db")
cur = conn.cursor()

cur.execute(""" 
CREATE TABLE IF NOT EXISTS Flashcards (
    id TEXT PRIMARY KEY,
    subject TEXT,
    topic TEXT,
    format TEXT,
    question TEXT,
    answer TEXT,
    wrong_answers TEXT -- JSON array of wrong options
)
""")



for _, row in df.iterrows():
    wrongs = [w for w in [
        row.get('Incorrect1'),
        row.get('Incorrect2'),
        row.get('Incorrect3')
    ] if pd.notna(w)]


    cur.execute("""
        INSERT INTO Flashcards
        (id, Subject, Topic, Format, Question, Answer, wrong_answers)
        VALUES (?, ?, ?, ?, ?, ?, ?)
    """, (
        str(uuid.uuid4()),
        row['Subject'],
        row['Topic'],
        row['Format'],
        row['Question'],
        row['Answer'],
        json.dumps(wrongs)
    ))

conn.commit()
conn.close()
