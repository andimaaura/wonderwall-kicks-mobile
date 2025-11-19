from django.urls import path
from .views import login, register, proxy_image, create_product_flutter, logout, show_json

urlpatterns = [
    path('login/', login, name='login'),
    path('register/', register, name='register'),
    path('logout/', logout, name='logout'),

    path('create-product/', create_product_flutter, name='create_product_flutter'),
    path('proxy-image/', proxy_image, name='proxy_image'),
    path('json/', show_json, name="show_json"),

]
