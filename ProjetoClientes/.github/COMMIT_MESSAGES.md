# Padrão de Mensagens de Commit - ProjetoClientes

Este documento define o padrão de mensagens de commit para o projeto **ProjetoClientes** (Delphi + Firebird). Seguir esse padrão ajuda a manter o histórico do Git organizado, claro e fácil de entender.

---

## Estrutura da mensagem de commit


---

## CAMADAS (entre colchetes)

- `[Apresentacao]` — formulários, interfaces, arquivos `.pas` e `.dfm`
- `[Dados]` — Data Modules, conexão com banco Firebird
- `[DAO]` — acesso a dados, consultas, CRUD
- `[Negocios]` — regras de negócio e controladores
- `[Utils]` — utilitários e constantes gerais
- `[Build]` — arquivos de projeto, scripts, configurações
- `[Docs]` — documentação e comentários
- `[SQL]` — ajustes no Banco de dados 

---

## Tipos comuns

- `Add` — adicionar funcionalidade, componente, método, etc.
- `Fix` — corrigir bugs
- `Update` — atualizar código ou funcionalidades existentes
- `Remove` — remover código ou funcionalidades
- `Refactor` — reorganizar código sem alterar comportamento
- `Test` — adicionar ou corrigir testes
- `Style` — ajustes de formatação e comentários

---

## Exemplos práticos

**Escreva a mensagem seguindo o padrão**  
- Comece com o `[CAMADA] Tipo: descrição curta` na primeira linha.  
- Deixe uma linha em branco.  
- Escreva uma descrição detalhada se precisar, com pontos ou listas.  
- Salve e feche o editor para concluir o commit.

**Exemplo prático de uso no terminal**  
```bash
git add .
git commit

[Apresentacao] Add: Formulário de cadastro de clientes implementado

Criado uFrmClientes.pas e uFrmClientes.dfm com validação básica dos campos principais.

## Dicas extras

Mantenha a linha de título (primeira linha) com no máximo 72 caracteres para facilitar leitura.

Seja claro e objetivo.

Evite mensagens genéricas como "update" ou "fix" sem contexto.

Use o corpo do commit para explicar o "porquê" das mudanças, não só o "quê".