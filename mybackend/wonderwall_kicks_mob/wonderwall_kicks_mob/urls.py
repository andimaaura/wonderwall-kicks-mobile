from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),

    # semua auth route HARUS lewat /auth/
    path('auth/', include('authentication.urls')),
]
