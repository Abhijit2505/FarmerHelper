# Generated by Django 3.1 on 2020-10-28 03:03

import datetime
from django.db import migrations, models
import django.db.models.deletion
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('myapp', '0006_auto_20201027_2114'),
    ]

    operations = [
        migrations.AlterField(
            model_name='discount',
            name='created_date',
            field=models.DateTimeField(default=datetime.datetime(2020, 10, 28, 3, 3, 39, 396362, tzinfo=utc)),
        ),
        migrations.AlterField(
            model_name='orders',
            name='modified_date',
            field=models.DateTimeField(default=datetime.datetime(2020, 10, 28, 3, 3, 39, 396362, tzinfo=utc)),
        ),
        migrations.AlterField(
            model_name='user_cart',
            name='time_added',
            field=models.DateTimeField(default=datetime.datetime(2020, 10, 28, 3, 3, 39, 412401, tzinfo=utc)),
        ),
        migrations.CreateModel(
            name='seller_product',
            fields=[
                ('seller_product_id', models.AutoField(primary_key=True, serialize=False, unique=True)),
                ('number_prod', models.IntegerField(verbose_name='Number of Products')),
                ('product_name', models.CharField(max_length=200)),
                ('date_added', models.DateTimeField(default=datetime.datetime(2020, 10, 28, 3, 3, 39, 404405, tzinfo=utc))),
                ('selling_date', models.DateTimeField(default=datetime.datetime(2020, 10, 28, 3, 3, 39, 404405, tzinfo=utc))),
                ('product_tag', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='myapp.tag')),
                ('seller_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='myapp.seller')),
            ],
            options={
                'verbose_name': 'Seller Product Details',
            },
        ),
    ]
