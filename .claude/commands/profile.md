# /profile — Varios perfiles en el mismo repo

Un perfil es **una persona aprendiendo una habilidad**. Tiene su propio nivel, su propio progreso
y su propio currículo.

Sirve para dos casos: la misma persona entrenando varias habilidades, y varias personas usando el
mismo repo.

```
/profile                    lista los perfiles y dice cual esta activo
/profile new                crea uno
/profile use <nombre>       cambia el activo
/profile archive <nombre>   lo aparta sin borrarlo
```

---

## Dónde vive cada cosa

```
private/
  active                    una linea: el nombre del perfil activo
  <perfil>/profile.md       datos reales de esa persona y esa habilidad
progress/
  <perfil>/tracker.json     su nivel, sus items, su historial
ejercicios/
  <perfil>/                 ejercicios generados para su nivel
knowledge/
  <habilidad>/              fichas del dominio
```

**`knowledge/<habilidad>/` se agrupa por habilidad, no por perfil.** Las fichas describen la materia, no a la
persona: si dos perfiles entrenan inglés, comparten el material y `/harvest` no se corre dos
veces. El currículo sí es de cada uno, porque se genera contra un nivel concreto.

Todo lo de `private/` y `progress/` está ignorado por git.

---

## `/profile` — listar

Leer `private/active` y escanear `private/*/profile.md`. Imprimir:

```
## Perfiles

* ana-ingles     ingles        L2   14 sesiones   ultima: hace 2 dias   <- activo
  ana-reactiva   programacion  L1    3 sesiones   ultima: hace 3 semanas
  sara-ingles          ingles        --    sin medir

Cambiar:  /profile use <nombre>
```

El nivel y las sesiones salen del tracker de cada uno. Si no tiene, "sin medir".

Si no hay ninguno, decirlo y mandar a `/setup`.

---

## `/profile new` — crear

Es `/setup` con una pregunta previa. No dupliques el procedimiento: **pregunta el nombre y delega
en `.claude/commands/setup.md`.**

El nombre lo propone el agente a partir de persona y habilidad —`ana-ingles`,
`sara-guitarra`— y lo confirma. Minúsculas, sin espacios, sin acentos: es un nombre de carpeta.

Si ya existe uno con ese nombre, **no lo sobrescribas.** Ofrece otro nombre o `/profile use`.

Al terminar, dejarlo activo y decirlo.

### Si es otra persona

Preguntarlo explícitamente, porque cambia lo que hay que recoger:

- **Otra habilidad, misma persona:** se reutiliza el contexto del perfil actual —cómo aprende,
  qué le desmotiva, sus restricciones— y solo se pregunta lo de la habilidad nueva. Proponerlo,
  no asumirlo.
- **Otra persona:** no se hereda nada. Sus restricciones y su material de práctica son suyos.
  Y decirle que sus datos van a `private/`, igual que los del otro.

---

## `/profile use <nombre>` — cambiar

1. Comprobar que existe `private/<nombre>/profile.md`. Si no, listar los que hay y parar.
2. Escribir el nombre en `private/active`.
3. Confirmar con el contexto de vuelta:

```
Activo: ana-reactiva  (programacion reactiva, L1)

Ultima sesion hace 3 semanas. Tienes 4 repasos vencidos.
Lo que quedo pendiente: "operadores de combinacion, nunca producidos solos".
```

Ese recordatorio es lo que hace que retomar un perfil dormido no se sienta como empezar de cero.

**No tocar nada más.** Cambiar de perfil no modifica trackers ni currículos.

---

## `/profile archive <nombre>` — apartar

Mueve `private/<nombre>/` y `progress/<nombre>/` a `<...>/archived/<nombre>/`.

**No borra nada.** Para borrar está `/reset`, que pide confirmación literal.

Sirve para cuando una habilidad se abandona o se termina y estorba en la lista. Se puede recuperar
moviéndolo de vuelta.

Si se archiva el activo, dejar `private/active` vacío y mandar a `/profile use`.

---

## Reglas

**Un perfil, una habilidad.** Si la misma persona entrena dos cosas, son dos perfiles. Mezclarlas
en uno rompe el tracker: los estados y los repasos son por habilidad.

**Todo comando opera sobre el activo.** `/learn`, `/assess`, `/plan`, `/review`, `/drill`, `/log`
leen `private/active` al empezar. Si está vacío, paran y mandan aquí.

**Avisar de la dispersión.** Si hay más de dos perfiles con sesiones en la última semana, decirlo
una vez:

> Tienes tres perfiles activos a la vez. El progreso sale de la frecuencia; repartido en tres,
> lo normal es no avanzar en ninguno. Tú decides, pero que conste.

Una vez, no en cada sesión.

**Nunca mezclar datos entre perfiles.** El material de práctica de una persona no aparece en los
ejercicios de otra. Es un fallo de privacidad, no solo de relevancia.
