# private/

Tus datos. **Todo el contenido está ignorado por git**, salvo este README.

---

## Estructura

```
private/
  active                      una linea: el nombre del perfil activo
  <perfil>/profile.md         datos reales de esa persona y esa habilidad
  <perfil>/recordings/        grabaciones, si usas analisis de voz
  archived/<perfil>/          perfiles apartados con /profile archive
```

Un **perfil** es una persona aprendiendo una habilidad. La misma persona entrenando dos cosas son
dos perfiles, porque el nivel, el progreso y los repasos son por habilidad.

Se gestionan con `/profile`. Los crea `/setup`.

---

## Qué va en un `profile.md`

La plantilla está en [`config/profile.example.md`](../config/profile.example.md):

- Quién es y de dónde viene **en esta habilidad**
- Qué habilidad y **para qué exactamente**
- Nivel de partida, con fuente, fecha y qué midió
- Restricciones reales: cuánto duran los huecos, dónde ocurren, qué no puedes hacer ahí
- Material de práctica: casos y proyectos que conoces de verdad
- Cómo se verifica que lo hiciste bien
- Intentos anteriores y por qué los dejaste

---

## Por qué está separado

El repositorio es público. Un perfil de aprendizaje completo dice en qué eres flojo, dónde
trabajas y qué te estás jugando. Un repositorio público es para siempre.

Nada de esto aparece en ningún fichero versionado, ni siquiera resumido. `CLAUDE.md` solo apunta
aquí.

---

## Rellénalo con la verdad

El nivel que pongas determina lo que el agente te sirve durante meses.

Poner el que te gustaría tener produce ejercicios demasiado difíciles, frustración y abandono en
dos semanas. Poner uno más bajo del real produce aburrimiento, que es igual de letal.

Si no lo sabes, **déjalo en blanco** y corre `/assess`. Es exactamente para eso.

Y si tienes un certificado: apunta **qué midió**. Uno que evalúa solo conocimiento teórico puntúa
alto y no dice nada sobre tu ejecución. Confundirlos es la forma más común de llevarse un golpe.

---

## Antes de publicar cualquier fork

```bash
git check-ignore -v private/active progress/
```

Si eso no devuelve nada, **para**: tus datos están a punto de subirse. Ver
[SECURITY.md](../SECURITY.md).
