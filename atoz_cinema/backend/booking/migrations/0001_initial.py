# Generated by Django 5.0.2 on 2024-03-20 11:00

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Cast',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
                ('image_url', models.URLField()),
            ],
        ),
        migrations.CreateModel(
            name='Review',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
                ('review', models.TextField()),
                ('rating', models.DecimalField(decimal_places=1, max_digits=3)),
            ],
        ),
        migrations.CreateModel(
            name='Movie',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=255)),
                ('image_url', models.URLField()),
                ('imdb_link', models.URLField()),
                ('rating', models.DecimalField(decimal_places=1, max_digits=3)),
                ('description', models.TextField()),
                ('director', models.CharField(blank=True, max_length=100, null=True)),
                ('release', models.CharField(blank=True, max_length=100, null=True)),
                ('genres', models.JSONField()),
                ('cast', models.ManyToManyField(to='booking.cast')),
                ('reviews', models.ManyToManyField(to='booking.review')),
            ],
        ),
    ]