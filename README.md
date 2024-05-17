# Tabnews api dart.

Obtendo uma lista de conteúdos:

Todos os métodos oferecidos pelo pacote possuem duas variantes:

Uma comum que retornará uma tupla no formato: `(T? content, bool status, ResponseError? error)` (o tipo `ResponseError` também se trata de uma tupla, falemos dele mais a frente).

A outra variante, sempre nomeada com o nome da comum seguido por "OrThrow", retornará apenas um `T? content`, em caso de falha na requisição, retorno de erros da API etc., uma exceção será lançada, podendo ser tratada com um `try {} catch(e) {}`.

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

Caso o `status` seja verdadeiro, nossa requisição não sofreu nenhum erro, mesmo assim, o conteúdo pode ser nulo, já que a API pode retornar vazio em determinados casos.

Em caso de erro na resposta da API, o `status` será falso e a mensagem e a ação retornadas ficarão disponíveis no `error`. Em alguns casos, ambas podem estar vazias.

Vejamos, agora, um caso do uso da variante "OrThrow":

```dart
try {
  final contents = await api.getContentsOrThrow();
  (content ?? []).forEach(print)
} catch (error) {
  print(error);
}
```
