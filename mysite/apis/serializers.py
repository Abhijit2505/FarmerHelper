from rest_framework import serializers
from myapp import models


class SellerTypeSerializer(serializers.ModelSerializer):
    class Meta:
        fields = ('seller_type_id', 'seller_type')
        model = models.seller_type


class SellerAddressSerializer(serializers.ModelSerializer):
    class Meta:
        fields = ('seller_address_id', 'seller_type_id', 'full_name', 'address1', 'address2',
                  'pincode', 'city', 'phone', 'alt_address1', 'alt_address2')
        model = models.seller_address


class SellerDetailSerializer(serializers.ModelSerializer):
    class Meta:
        fields = ('seller_detail_id', 'seller_address_id', 'name',
                  'email', 'mobile', 'password', 'deleted')
        model = models.seller_detail


class SellerSerializer(serializers.ModelSerializer):
    class Meta:
        fields = ('seller_id', 'seller_detail_id', 'category')
        model = models.seller


class SellerPaymentSerializer(serializers.ModelSerializer):
    class Meta:
        fields = ('seller_payment_id', 'seller_id', 'full_name',
                  'card_number', 'cvv_number', 'valid_from', 'valid_upto')
        model = models.seller_payment_detail


class SellerProductSerializer(serializers.ModelSerializer):
    class Meta:
        fields = ('seller_product_id', 'seller_id', 'number_prod',
                  'product_name', 'product_tag', 'date_added', 'selling_date')
        model = models.seller_product
        
