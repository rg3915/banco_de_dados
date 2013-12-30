# encoding: utf-8
from django.db import models
from datetime import date

class Cliente(models.Model):
	nome = models.CharField('Nome', max_length=50)

	class Meta:
		verbose_name=u'cliente'
		verbose_name_plural=u'clientes'

	def __unicode__(self):
		return self.nome

class Categoria(models.Model):
	categoria = models.CharField('Categoria', max_length=50)

	class Meta:
		verbose_name=u'categoria'
		verbose_name_plural=u'categorias'

	def __unicode__(self):
		return self.categoria

class Produto(models.Model):
	categoria = models.ForeignKey(Categoria)
	produto = models.CharField('Produto', max_length=50)
	preco = models.DecimalField('Preço', max_digits=8, decimal_places=2)

	class Meta:
		verbose_name=u'produto'
		verbose_name_plural=u'produtos'

	def __unicode__(self):
		return self.produto

class Pedido(models.Model):
	data_pedido = models.DateField('Data do pedido')
	cliente = models.ForeignKey(Cliente)

	def __unicode__(self):
		return self.data_pedido

class DetPedido(models.Model):
	pedido = models.ForeignKey(Pedido)
	produto = models.ForeignKey(Produto)
	quantidade = models.IntegerField()

	def __unicode__(self):
		return self.pedido
