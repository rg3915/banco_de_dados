# -*- coding: utf-8 -*-
from django.db import models

CONTATO_TRATAMENTO = (
    ('a', 'Arq.'),
    ('aa', 'Arqa.'),
    ('d', 'Dona'),
    ('dr', 'Dr.'),
    ('dra', 'Dra.'),
    ('e', 'Eng.'),
    ('p', 'Prof.'),
    ('pa', 'Profa.'),
    ('sr', 'Sr.'),
    ('sra', 'Sra.'),
    ('srta', 'Srta.'),
)

TIPO_CONTATO = (
    ('e', 'empresa'),
    ('p', 'pessoa'),
    ('c', 'colaborador'),
    ('f', u'funcionário'),
)


class Contato(models.Model):
    confidencial = models.BooleanField(default=True)
    tratamento = models.CharField(
        max_length=4, choices=CONTATO_TRATAMENTO, blank=True)
    nome = models.CharField(max_length=50)
    sobrenome = models.CharField(max_length=50, blank=True)
    nome_fantasia = models.CharField(max_length=50, blank=True)
    razao_social = models.CharField(max_length=50, blank=True)
    tipo_contato = models.CharField(max_length=1, choices=TIPO_CONTATO)
    cargo = models.CharField(max_length=50, blank=True)
    email = models.EmailField()
    cnpj = models.CharField(max_length=13, blank=True)
    ie = models.CharField(max_length=15, blank=True)
    cpf = models.CharField(max_length=11, blank=True)
    rg = models.CharField(max_length=10, blank=True)
    criado_em = models.DateTimeField(auto_now_add=True, auto_now=False)
    modificado_em = models.DateTimeField(auto_now_add=False, auto_now=True)
    relationships = models.ManyToManyField(
        'self', through='Relacionamento', symmetrical=False, related_name='related_to+')

    class Meta:
        ordering = ['criado_em']
        verbose_name = (u'Contato')
        verbose_name_plural = (u'Contatos')

    def __unicode__(self):
        return self.nome + " " + self.sobrenome


class Relacionamento(models.Model):
    contato = models.ForeignKey('Contato', related_name='contato_de')
    relaciona_com = models.ForeignKey('Contato', related_name='relaciona_com')

    class Meta:
        verbose_name = (u'Relacionamento')
        verbose_name_plural = (u'Relacionamentos')

    def __unicode__(self):
        return u'%s -> %s' % (self.contato.nome, self.relaciona_com.nome)

    def add_relationship(self, person, status, symm=True):
        relationship, created = Relacionamento.objects.get_or_create(
            contato=self,
            relaciona_com=person,
            status=status)
        if symm:
            person.add_relationship(self, status, False)
        return relationship

    def remove_relationship(self, person, status, symm=True):
        Relacionamento.objects.filter(
            contato=self,
            relaciona_com=person,
            status=status).delete()
        if symm:
            person.remove_relationship(self, status, False)

    def get_relationship(self, status):
        return self.relationships.filter(
            to_people__contato=self)


class ContatoTag(models.Model):
    contato = models.ForeignKey('Contato')
    tag = models.ForeignKey('Tag')


class Tag(models.Model):
    tag = models.CharField(max_length=100)

    class Meta:
        verbose_name = (u'tag')
        verbose_name_plural = (u'tags')

    def __unicode__(self):
        return self.tag

TIPO_ENDERECO = (
    ('i', 'indefinido'),
    ('c', 'comercial'),
    ('r', 'residencial'),
    ('o', 'outros'),
)


class Endereco(models.Model):
    contato = models.ForeignKey('Contato')
    tipo_endereco = models.CharField(max_length=1, choices=TIPO_ENDERECO)
    logradouro = models.CharField(max_length=200)
    complemento = models.CharField(max_length=100, blank=True)
    bairro = models.CharField(max_length=100, blank=True)
    cidade = models.CharField(max_length=100, blank=True)
    uf = models.CharField(max_length=100, blank=True)
    pais = models.CharField(max_length=100, blank=True)
    cep = models.CharField(max_length=50, blank=True)

    class Meta:
        verbose_name = (u'endereço')
        verbose_name_plural = (u'endereços')

    def __unicode__(self):
        return self.logradouro

TIPO_FONE = (
    ('pri', 'principal'),
    ('com', 'comercial'),
    ('res', 'residencial'),
    ('cel', 'celular'),
    ('cl', 'Claro'),
    ('oi', 'Oi'),
    ('t', 'Tim'),
    ('v', 'Vivo'),
    ('n', 'Nextel'),
    ('fax', 'fax'),
    ('o', 'outros'),
)


class Fone(models.Model):
    contato = models.ForeignKey('Contato')
    fone = models.CharField(max_length=50)
    tipo_fone = models.CharField(max_length=3, choices=TIPO_FONE)
