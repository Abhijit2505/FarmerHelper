from django.urls import path
from .views import *

urlpatterns = [
    path('SellerType/',ListSellerType.as_view()),
    path('SellerType/<int:pk>/',DetailSellerType.as_view()),
    path('SellerAddress/',ListSellerAddress.as_view()),
    path('SellerAddress/<int:pk>/',DetailSellerAddress.as_view()),
    path('SellerDetail/',ListSellerDetail.as_view()),
    path('SellerDetail/<int:pk>/',DetailSellerDetail.as_view()),
    path('Seller/',ListSeller.as_view()),
    path('Seller/<int:pk>/',DetailSeller.as_view()),
    path('SellerProduct/',ListSellerProduct.as_view()),
    path('SellerProduct/<int:pk>/',DetailSellerProduct.as_view()),
    path('SellerPayment/',ListSellerPaymentDetail.as_view()),
    path('SellerPayment/<int:pk>/',DetailSellerPaymentDetail.as_view()),
]