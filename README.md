# TabNews

Autenticação e sessões.

<ul>
  <li>✅ Criar um usuário.</li>
  <li>✅ Logar um usuário.</li>
  <li>✅ Recuperar senha de um usuário.</li>
</ul>

Conteúdos e posts.

<ul>
  <li>✅ Listar os conteúdos.</li>
  <li>✅ Listar os conteúdos de um usuário.</li>
  <li>✅ Obter os dados de um conteúdo.</li>
  <li>✅ Listar os comentários de um conteúdo.</li>
  <li>✅ Obter a thumbnail de um conteúdo.</li>
</ul>

## Uma breve introdução ao pacote

Todos os métodos oferecidos pelo pacote possuem duas variantes:

Uma comum que retornará uma tupla no formato `(T? content, bool status, ResponseError? error)` (o tipo `ResponseError` também se trata de uma tupla, falemos dele mais a frente).

A outra variante, sempre nomeada com o nome da comum seguido por "OrThrow", retornará apenas um `T? content`. Em caso de falha na requisição ou retorno de erros da API, uma exceção será lançada, podendo ser tratada com um `try {} catch(e) {}`.

Vejamos um exemplo de uso simples com o método comum:

```dart
final (contents, status, error) = await api.getContents();

if (status) {
  (contents ?? []).forEach(print);
} else {
  print(error!.message);
  print(error!.action);
}
```

Caso o `status` seja verdadeiro, nossa requisição não sofreu nenhum erro. Mesmo assim, o conteúdo pode ser nulo, já que a API pode retornar vazio em determinados casos.

Em caso de erro na resposta da API, o `status` será falso, com a mensagem de erro retornada disponível no `error`. Em alguns casos, as mensagens de erro podem ser nulas.

Vejamos um caso do uso da variante "OrThrow":

```dart
try {
  final contents = await api.getContentsOrThrow();
  (content ?? []).forEach(print)
} catch (error) {
  print(error);
}
```

Da mesma maneira, o conteúdo retornado pode ser nulo (caso a API retorne vazio, mas sem erros). No entanto, caso ocorra algum erro ao executar esse método, uma exceção será lançada.

## Explorando todas as rotas da API

###
