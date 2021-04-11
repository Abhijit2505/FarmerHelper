from django.shortcuts import render

# Create your views here.
from myapp import models
from .serializers import *
from rest_framework import generics

class ListSellerType(generics.ListCreateAPIView):
    queryset = models.seller_type.objects.all()
    serializer_class = SellerTypeSerializer

class DetailSellerType(generics.RetrieveUpdateDestroyAPIView):
    queryset = models.seller_type.objects.all()
    serializer_class = SellerTypeSerializer

class ListSellerAddress(generics.ListCreateAPIView):
    queryset = models.seller_address.objects.all()
    serializer_class = SellerAddressSerializer

class DetailSellerAddress(generics.RetrieveUpdateDestroyAPIView):
    queryset = models.seller_address.objects.all()
    serializer_class = SellerAddressSerializer

class ListSellerDetail(generics.ListCreateAPIView):
    queryset = models.seller_detail.objects.all()
    serializer_class = SellerDetailSerializer

class DetailSellerDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = models.seller_detail.objects.all()
    serializer_class = SellerDetailSerializer

class ListSeller(generics.ListCreateAPIView):
    queryset = models.seller.objects.all()
    serializer_class = SellerSerializer

class DetailSeller(generics.RetrieveUpdateDestroyAPIView):
    queryset = models.seller.objects.all()
    serializer_class = SellerSerializer

class ListSellerPaymentDetail(generics.ListCreateAPIView):
    queryset = models.seller_payment_detail.objects.all()
    serializer_class = SellerPaymentSerializer

class DetailSellerPaymentDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = models.seller_payment_detail.objects.all()
    serializer_class = SellerPaymentSerializer

class ListSellerProduct(generics.ListCreateAPIView):
    queryset = models.seller_product.objects.all()
    serializer_class = SellerProductSerializer

class DetailSellerProduct(generics.RetrieveUpdateDestroyAPIView):
    queryset = models.seller_product.objects.all()
    serializer_class = SellerProductSerializer



















