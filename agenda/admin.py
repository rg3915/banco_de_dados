# -*- coding: utf-8 -*-
from django.contrib import admin
from agenda.models import *


class RelacionamentoInline(admin.StackedInline):
    model = Relacionamento
    fk_name = 'contato'


class FoneInline(admin.TabularInline):
    model = Fone


class EnderecoInline(admin.TabularInline):
    model = Endereco


class ContatoTagInline(admin.TabularInline):
    model = ContatoTag
    fk_name = 'contato'


class ContatoAdmin(admin.ModelAdmin):
    inlines = [RelacionamentoInline, FoneInline,
               EnderecoInline, ContatoTagInline]


admin.site.register(Contato, ContatoAdmin)
admin.site.register(Endereco)
admin.site.register(Relacionamento)
admin.site.register(Tag)
