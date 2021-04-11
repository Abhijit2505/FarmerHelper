from django.db import models
from django.utils import timezone
from django.contrib.auth.models import User
from django.db.models.signals import post_save
from django.dispatch import receiver

# Create your models here.
class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    # user_id = models.AutoField(primary_key=True, unique=True)
    first_name = models.CharField(max_length=100, blank=True)
    last_name = models.CharField(max_length=100, blank=True)
    email = models.EmailField(max_length=150)
    phone = models.CharField(max_length=200, unique=True)
    bio = models.TextField()

    def __str__(self):
        return self.user.username

    class Meta:
        verbose_name = "user list"

@receiver(post_save, sender=User)
def update_profile_signal(sender, instance, created, **kwargs):
    if created:
        Profile.objects.create(user=instance)
    instance.profile.save()

# class user(models.Model):
#     user_id = models.AutoField(primary_key=True, unique=True)
#     email = models.EmailField(unique=True)
#     name = models.CharField(max_length=200)
#     phone = models.CharField(max_length=200, unique=True)
#     password = models.CharField(max_length=200,)
#     deleted = models.BooleanField()

#     def __str__(self):
#         return self.name

#     class Meta:
#         verbose_name = "user list"


class address(models.Model):
    address_id = models.AutoField(primary_key=True, unique=True)
    user_id = models.ForeignKey(Profile, on_delete=models.CASCADE)
    full_name = models.CharField(max_length=200)
    address1 = models.TextField(max_length=1000)
    address2 = models.TextField(max_length=1000)
    pincode = models.CharField(max_length=20)
    city = models.CharField(max_length=200)
    phone = models.CharField(max_length=50, unique=True)
    alt_address1 = models.TextField(blank=True)
    alt_address2 = models.TextField(blank=True)

    def __str__(self):
        return self.full_name

    class Meta:
        verbose_name = "user addres"


class user_payment(models.Model):
    payment_detail_id = models.AutoField(primary_key=True, unique=True)
    user_id = models.ForeignKey(Profile, on_delete=models.CASCADE)
    full_name = models.CharField(max_length=200)
    card_number = models.CharField(max_length=200)
    cvv_number = models.IntegerField()
    valid_from = models.DateTimeField()
    valid_upto = models.DateTimeField()

    def __str__(self):
        return self.full_name

    class Meta:
        verbose_name = "user payment detail"


class discount(models.Model):
    DISCOUNT_TYPES = (
        (1, 'big mart sell'),
        (2, 'festive offer'),
        (3, 'vegetable mania'),
        (4, 'pulses play'),
        (5, 'the farmer day'),
    )

    discount_id = models.AutoField(primary_key=True, unique=True)
    name = models.CharField(max_length=200, unique=True)
    discount_amount = models.FloatField()
    quantity = models.IntegerField()
    created_date = models.DateTimeField(default=timezone.now())
    valid_date = models.DateTimeField()
    discount_type = models.IntegerField(choices=DISCOUNT_TYPES)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = "Product Discount"


class orders(models.Model):
    ORDER_STATUS = (
        (1, 'Paid'),
        (2, 'Unpaid'),
        (3, 'Delivered'),
        (4, 'Returned')
    )

    DELIVERY_METHOD = (
        (1, 'Cash On delivery'),
        (2, 'Online Paid')
    )

    order_id = models.AutoField(primary_key=True, unique=True)
    user_id = models.ForeignKey(Profile, on_delete=models.CASCADE)
    address_id = models.ForeignKey(address, on_delete=models.CASCADE)
    discount_id = models.ForeignKey(discount, on_delete=models.CASCADE)
    payment_detail_id = models.ForeignKey(
        user_payment, on_delete=models.CASCADE)
    created_date = models.DateTimeField()
    modified_date = models.DateTimeField(default=timezone.now())
    status = models.IntegerField(choices=ORDER_STATUS)
    amount = models.FloatField()
    delivery_mdethod = models.IntegerField(
        choices=DELIVERY_METHOD, verbose_name="payment_method")

    def __str__(self):
        return "User Orders"

    class Meta:
        verbose_name = "User Order"


class category(models.Model):
    category_id = models.AutoField(primary_key=True, unique=True)
    name = models.CharField(max_length=200)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = "Product Category"


class tag(models.Model):
    PRODUCT_TAGS = (
        (1, 'Vegetables'),
        (2, 'Fruits'),
        (3, 'Pulses'),
        (4, 'Grains'),
        (5, 'Mushroom'),
        (6, 'Others'),
        (6, 'Fish'),
        (7, 'Dairy Products'),
        (8, 'Cotton'),
        (9, 'Sugarcane'),
        (10, 'Jute'),
        (11, 'Spices'),
        (12, 'Poultry'),
        (13, 'Tea'),
        (14, 'Coffee'),
        (15, 'Keshar'),
        (16, 'Flower'),
        (17, 'Seeds'),
        (18, 'Nuts'),
        (19, 'Honey'),
        (20, 'Rubber'),
        (21, 'Forest Products')
    )

    tag_id = models.AutoField(primary_key=True, unique=True)
    tag = models.IntegerField(choices=PRODUCT_TAGS)

    def __str__(self):
        return self.PRODUCT_TAGS[self.tag-1][self.tag]

    class Meta:
        verbose_name = "Product Tags"


class product_detail(models.Model):
    product_detail_id = models.AutoField(primary_key=True, unique=True)
    tag_id = models.ForeignKey(tag, on_delete=models.CASCADE)
    # image1 = models.ImageField(verbose_name="Product Image 1")
    # image2 = models.ImageField(verbose_name="Product Image 2")
    # image3 = models.ImageField(verbose_name="Product Image 3")
    # video = models.FileField()
    price = models.FloatField()

    def __str__(self):
        return "Product Details"

    class Meta:
        verbose_name = "Product Detail"


class seller_type(models.Model):
    SELLER_TYPE = (
        (1, "Farmer"),
        (2, "Vegetable Seller"),
        (3, "Regional Retailer")
    )

    seller_type_id = models.AutoField(primary_key=True, unique=True)
    seller_type = models.IntegerField(choices=SELLER_TYPE)

    def __str__(self):
        return str(self.seller_type_id)

    class Meta:
        verbose_name = "Seller Type"


class seller_address(models.Model):
    seller_address_id = models.AutoField(primary_key=True, unique=True)
    seller_type_id = models.ForeignKey(seller_type, on_delete=models.CASCADE)
    full_name = models.CharField(max_length=200)
    address1 = models.TextField(max_length=1000)
    address2 = models.TextField(max_length=1000)
    pincode = models.CharField(max_length=20)
    city = models.CharField(max_length=200)
    phone = models.CharField(max_length=50, unique=True)
    alt_address1 = models.TextField(blank=True)
    alt_address2 = models.TextField(blank=True)

    def __str__(self):
        return self.full_name

    class Meta:
        verbose_name = "Seller addres"


class seller_detail(models.Model):
    seller_detail_id = models.AutoField(primary_key=True, unique=True)
    seller_address_id = models.ForeignKey(
        seller_address, on_delete=models.CASCADE)
    name = models.CharField(max_length=200)
    email = models.EmailField()
    mobile = models.CharField(max_length=100)
    password = models.CharField(max_length=50)
    deleted = models.BooleanField()

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = "Seller Details"


class seller(models.Model):
    SELLER_CATEGORY = (
        (1, "First Time Seller"),
        (2, "Regular Seller")
    )

    seller_id = models.AutoField(primary_key=True, unique=True)
    seller_detail_id = models.ForeignKey(
        seller_detail, on_delete=models.CASCADE)
    category = models.IntegerField(choices=SELLER_CATEGORY)

    def __str__(self):
        return str(self.seller_id)

    class Meta:
        verbose_name = "Seller Category"


class seller_product(models.Model):
    seller_product_id = models.AutoField(primary_key=True, unique=True)
    seller_id = models.ForeignKey(seller, on_delete=models.CASCADE)
    number_prod = models.IntegerField(verbose_name="Number of Products")
    product_name = models.CharField(max_length=200)
    product_tag = models.ForeignKey(tag,on_delete=models.CASCADE)
    date_added = models.DateTimeField(default=timezone.now())
    selling_date = models.DateTimeField(default=timezone.now())

    def __str__(self):
        return self.product_name

    class Meta:
        verbose_name = "Seller Product Details"



class product(models.Model):
    product_id = models.AutoField(primary_key=True, unique=True)
    seller_id = models.ForeignKey(seller, on_delete=models.CASCADE)
    category_id = models.ForeignKey(category, on_delete=models.CASCADE)
    product_detail_id = models.ForeignKey(
        product_detail, on_delete=models.CASCADE)
    name = models.CharField(max_length=200)
    description = models.TextField()

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = "Product"


class order_items(models.Model):
    order_item_id = models.AutoField(primary_key=True, unique=True)
    order_id = models.ForeignKey(orders, on_delete=models.CASCADE)
    product_id = models.ForeignKey(product, on_delete=models.CASCADE)
    quantity = models.IntegerField()

    def __str__(self):
        return "Ordered Items"

    class Meta:
        verbose_name = "Ordered Item"


class seller_payment_detail(models.Model):
    seller_payment_id = models.AutoField(primary_key=True, unique=True)
    seller_id = models.ForeignKey(seller, on_delete=models.CASCADE)
    full_name = models.CharField(max_length=200)
    card_number = models.CharField(max_length=200)
    cvv_number = models.IntegerField()
    valid_from = models.DateTimeField()
    valid_upto = models.DateTimeField()

    def __str__(self):
        return self.full_name

    class Meta:
        verbose_name = "Seller Payment Detail"


class user_cart(models.Model):
    cart_item_id = models.AutoField(primary_key=True, unique=True)
    order_id = models.ForeignKey(orders, on_delete=models.CASCADE)
    prodcut_id = models.ForeignKey(product, on_delete=models.CASCADE)
    quantity = models.IntegerField()
    save_for_later = models.BooleanField()
    time_added = models.DateTimeField(default=timezone.now())

    def __str__(self):
        return "The User Cart"

    class Meta:
        verbose_name = "User Cart"
