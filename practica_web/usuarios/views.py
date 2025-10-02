from django.shortcuts import render
from django.http import HttpResponse
from django.db import connection

def home(request):
    with connection.cursor() as cursor:
        cursor.execute("SELECT nombre, email FROM usuarios")
        rows = cursor.fetchall()
    html = "<h1>Usuarios</h1><ul>"
    for nombre, email in rows:
        html += f"<li>{nombre} - {email}</li>"
    html += "</ul>"
    return HttpResponse(html)
