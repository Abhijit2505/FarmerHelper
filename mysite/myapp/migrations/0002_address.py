# Generated by Django 3.1 on 2020-10-27 06:30

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('myapp', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='address',
            fields=[
                ('address_id', models.AutoField(primary_key=True, serialize=False, unique=True)),
                ('full_name', models.CharField(max_length=200)),
                ('address1', models.TextField(max_length=1000)),
                ('address2', models.TextField(max_length=1000)),
                ('pincode', models.CharField(max_length=20)),
                ('city', models.CharField(max_length=200)),
                ('phone', models.CharField(max_length=50, unique=True)),
                ('alt_address1', models.TextField(blank=True)),
                ('alt_address2', models.TextField(blank=True)),
                ('user_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='myapp.user')),
            ],
        ),
    ]
