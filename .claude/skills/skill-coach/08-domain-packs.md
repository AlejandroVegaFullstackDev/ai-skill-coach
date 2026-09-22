# 08 — Paquetes de dominio

El motor (`skill-coach`) no sabe nada de ninguna habilidad. Un paquete de dominio es lo que le
enseña **una**.

Sin paquete, el sistema funciona pero genérico: sabe medir, planificar y recordar, pero no sabe
dónde falla la gente en esa habilidad concreta ni cómo se practica de verdad.

Lo genera `/add-domain`. También se puede escribir a mano.

---

## Qué tiene que aportar

Un paquete vive en `.claude/skills/<habilidad>-coach/SKILL.md` y responde **siete preguntas**.
Si no las responde, es un prompt bonito, no un paquete.

### 1. ¿Cuál es el salto real?

No el temario. **Dónde se atasca la gente.**

El material de estudio de cualquier habilidad cubre todo por igual. La realidad no: hay dos o tres
cosas que separan a quien sabe de quien no, y suelen ser aburridas.

| Habilidad | El temario dice | El salto real es |
|---|---|---|
| Idioma | Vocabulario y tiempos verbales | Sostener el discurso sin congelarse |
| Programación | Sintaxis, frameworks | Depurar algo que no escribiste tú |
| Mecánica | Cómo funciona cada sistema | Llegar a una hipótesis con información incompleta |
| Negociación | Técnicas y tácticas | Aguantar el silencio |
| Hablar en público | Estructura del discurso | Recuperarse de un blanco |

### 2. ¿Qué errores comete alguien que viene de donde viene este aprendiz?

El error más valioso de detectar es el que el aprendiz **no puede oír ni ver en sí mismo**, porque
nada en su entorno se lo devuelve.

- Un hispanohablante mete una vocal antes de las palabras que empiezan por *s-*. Nadie le corrige
  porque se le entiende igual.
- Alguien que aprendió a programar solo escribe funciones de 200 líneas. Le funcionan.
- Un mecánico autodidacta cambia piezas hasta que para el ruido, sin diagnosticar.

Una tabla de estos errores, con la forma correcta y el porqué, es lo más útil que aporta un
paquete. Y es lo que no sale de un libro: sale de saber de dónde viene quien aprende.

### 3. ¿Cómo se practica esto de verdad?

Las condiciones reales de la práctica. Mandan sobre el diseño del currículo:

- ¿Necesita herramientas, un taller, otra persona, silencio?
- ¿Se puede practicar en cinco minutos o hay un coste fijo de montaje?
- ¿Hay una ruta que funcione sin el equipamiento? Si no la hay, hay que decirlo, no fingirla.
- ¿Cómo se sabe que salió bien sin un experto delante?

Esta última es la que decide si el sistema sirve. Una habilidad cuyo resultado no es verificable
por el propio aprendiz necesita grabación, o una persona, o se aprende mal.

### 4. ¿Cuál es el formato de mayor valor?

El equivalente al simulacro de entrevista: la actividad que más se parece a la situación objetivo.

- Idioma para entrevistas → simulacro sin cortar
- Programación → depurar un bug real en código ajeno
- Mecánica → diagnóstico a ciegas, sin decirle qué falla
- Habilidades sociales → juego de rol con un interlocutor difícil
- Negocios → defender una decisión ante preguntas hostiles

Con su protocolo: cuánto dura, si se interrumpe o no, cómo se cierra.

### 5. ¿Hay una escala externa, y qué mide de verdad?

Si existe una certificación reconocida, se declara **y se dice qué mide**. Muchas miden
conocimiento y se leen como si midieran ejecución.

Si no existe, se dice. No pasa nada: L0-L5 con evidencia informa más que un número.

### 6. ¿Cómo se representa esto sin ambigüedad?

La notación que usa la gente que hace esto de verdad, renderizable **en una terminal, en ASCII**.

Un diagrama de acordes, una tablatura, un pinout, un árbol de estructura, un antes/después. Lo
que sea, pero que exista: describir algo espacial en prosa es donde el aprendiz entiende mal sin
enterarse, y no tiene forma de detectarlo porque para eso está aprendiendo.

Si el dominio no tiene notación —negociación, escritura— la representación es el **caso concreto
con contraste**: qué se dijo, qué respuesta cierra el tema y cuál lo abre.

Formatos y reglas en `09-notacion.md`.

### 7. ¿Con qué se verifica?

Lo más barato que convierta esto en comprobable, de los cinco niveles de
`10-kit-de-verificacion.md`: reproducir la notación, foto, fotogramas de vídeo, medición local,
o verificación automática.

Y **qué queda sin verificar**, dicho explícitamente. Siempre queda algo.

Decir "no se puede verificar" y seguir es la salida cómoda. La correcta es proponer el nivel más
barato que sí funcione.

---

## Plantilla

```markdown
---
name: <habilidad>-coach
description: >
  Paquete de dominio: <habilidad>. Aporta <el salto real>, los errores tipicos de
  <perfil de partida>, el protocolo de <formato de mayor valor> y las condiciones
  de practica. Se activa con: <palabras clave>
allowed-tools: Read, Write, Edit, Glob, Grep, WebFetch, WebSearch
---

# <Habilidad> — paquete de dominio

Este fichero no es el motor. El motor es `skill-coach`.

## El objetivo del dominio
[La situacion concreta. Que sube de prioridad y que baja por ella.]

## El salto real
[Donde se atasca la gente. Con ejemplos.]

## Errores tipicos desde <perfil de partida>
| Error | Correcto | Nota |

## Condiciones de practica
[Que hace falta. Si hay ruta sin equipamiento, cual. Como se verifica el resultado.]

## El formato de mayor valor
[Protocolo: duracion, si se interrumpe, como se cierra.]

## Escala externa
[Cual, que mide de verdad, y como mapea a L0-L5. O "ninguna".]

## Notacion
[El formato ASCII de este dominio, con leyenda y un ejemplo renderizado.]

## Kit de verificacion
| Nivel | Que | Estado |
|---|---|---|
| 0 | [reproducir que, antes de ejecutar] | activo |

**No verificable:** [lo que queda fuera, y que haria falta para cubrirlo.]

## Contenido de practica
[De donde sale. Casi siempre: la vida real del aprendiz, de private/<perfil>/profile.md.]
```

---

## Reglas

**Un paquete no reimplementa el motor.** Si define sus propios estados, su propio repaso o su
propio formato de corrección, está mal. Solo aporta lo específico del dominio.

**Los errores típicos se citan.** Si vienen de una fuente, va en `knowledge/<habilidad>/` y se referencia. Si
vienen del razonamiento del agente sobre el idioma o el contexto de origen, se marca como tal.
"Suele pasar" sin respaldo es una suposición con voz de autoridad.

**Un paquete se corrige con el uso.** La tabla de errores típicos del principio es un punto de
partida; los errores reales del aprendiz salen de las sesiones y viven en el tracker. Si después
de 20 sesiones la tabla no ha cambiado, nadie estaba mirando.

---

## Cambiar de habilidad

No se borra nada: cada habilidad es **un perfil**, con su propio tracker. Se gestiona con
`/profile`.

Se pueden mantener varias a la vez. Pero avisar una vez: el progreso real sale de la frecuencia,
y repartirse entre tres habilidades suele significar no avanzar en ninguna.
