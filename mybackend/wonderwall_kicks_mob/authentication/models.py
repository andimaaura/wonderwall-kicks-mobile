from django.db import models
from django.contrib.auth.models import User

class Product(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, null=True, blank=True)
    name = models.CharField(max_length=255)
    price = models.IntegerField()
    description = models.TextField()
    category = models.CharField(max_length=100)
    thumbnail = models.URLField(max_length=500, blank=True)
    is_featured = models.BooleanField(default=False)
    stock = models.IntegerField(default=0)
    created_at = models.DateTimeField(auto_now_add=True)
    product_views = models.IntegerField(default=0)

    def __str__(self):
        return self.name
