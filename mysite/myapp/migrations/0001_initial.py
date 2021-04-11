# Generated by Django 3.1 on 2020-10-27 06:13

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='user',
            fields=[
                ('user_id', models.AutoField(primary_key=True, serialize=False, unique=True)),
                ('email', models.EmailField(max_length=254, unique=True)),
                ('name', models.CharField(max_length=200)),
                ('phone', models.CharField(max_length=200, unique=True)),
                ('password', models.CharField(max_length=200)),
                ('deleted', models.BooleanField()),
            ],
        ),
    ]