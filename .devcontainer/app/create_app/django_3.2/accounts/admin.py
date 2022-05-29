from django.contrib import admin
from django.contrib.auth.admin import UserAdmin

from .forms import CustomUserChangeForm, CustomUserCreationForm
from .models import CustomUser


# Register your models here.
class CustomUserAdmin(UserAdmin):
    add_form = CustomUserCreationForm
    form = CustomUserChangeForm
    model = CustomUser
    list_display = [
        "email",
        "username",
        "is_staff",
    ]
    fieldsets = UserAdmin.fieldsets # + ((None, {"fields": ("<additional_field>",)}),)
    add_fieldsets = UserAdmin.add_fieldsets # + ((None, {"fields": ("<additional_field>",)}),)


admin.site.register(CustomUser, CustomUserAdmin)