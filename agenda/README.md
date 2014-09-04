Agenda
======

# Objetivo

Modelar uma agenda de contatos onde um contato possa se relacionar com outras pessoas, semelhante aos relacionamentos do Facebook e Google+.

Além disso o contato pode possuir vários endereços, telefones e tags. As tags servem para melhor identificação de cada contato.

# Itens

**modelagem.png** mostra as tabelas feitas no *Workbench*.

!(modelagem.png)

**agenda_django.png** são as tabelas feitas no *Django*.

!(agenda_django.png)

**agenda_mysql_workbench.sql** é o schema exportado do *Workbench*.

**agenda.sql** é o schema exportado do sqlite3.

**models.py** é a *receita* de como fazer o modelo no *Django*.

**admin.py** mostra em especial o uso do *TabularInline*.

**Todo**: Leia [Como criar um site com formulário e lista em 30 minutos][0] e tente você mesmo recriar o modelo no Django.

[0]: http://pythonclub.com.br/criar-site-com-form-lista-30-min.html