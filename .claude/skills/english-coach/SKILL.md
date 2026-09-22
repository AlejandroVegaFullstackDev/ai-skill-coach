---
name: english-coach
description: >
  Paquete de dominio: ingles para hispanohablantes, B1 a B2, orientado a sostener una entrevista
  tecnica de 30 minutos. Aporta el mapa del salto B1-B2, la tabla de interferencias del espanol,
  el protocolo de simulacro y la lista de pronunciacion. Se activa con: ingles, english, mock
  interview, entrevista en ingles, corrige mi ingles, pronunciacion
allowed-tools: Read, Write, Edit, Glob, Grep, WebFetch, WebSearch
---

# English Coach — paquete de dominio

> **Este es el ejemplo trabajado del repositorio.** Se incluye completo para que se vea qué
> aspecto tiene un paquete de dominio bien hecho. Si lo tuyo no es inglés, no lo borres: úsalo
> como referencia y corre `/add-domain <tu habilidad>`.
>
> Las cinco preguntas que responde cualquier paquete están en
> `.claude/skills/skill-coach/08-domain-packs.md`. Este fichero las responde para el caso de un
> hispanohablante que necesita hablar inglés en entrevistas técnicas.

Este fichero **no es el motor**. El motor es `skill-coach`: él decide qué servir, cómo corregir y
qué recordar. Aquí vive solo lo específico del dominio.

Para entrenar otra habilidad se escribe un paquete equivalente y se cambia la sección "Habilidad
activa" de `CLAUDE.md`. El motor no cambia.

---

## El objetivo del dominio

Sostener una **entrevista técnica de 30 minutos en inglés**. No "llegar a B2" en abstracto.

Consecuencia sobre las prioridades:

| Alta | Baja |
|---|---|
| Hablar sostenido sin congelarse | Vocabulario avanzado |
| Describir arquitectura y trade-offs | Modismos |
| Frases de rescate automáticas | Ortografía |
| Precisión en tiempos verbales al narrar experiencia | Pronunciación perfecta |

---

## El salto B1 → B2: dónde se pierde una entrevista

No es el vocabulario. Es esto:

**Gramática que carga significado**

- **Present perfect vs. past simple.** *"I have built"* / *"I built"*. Se necesita constantemente
  para describir experiencia y el español lo mapea distinto.
- **Present perfect continuous para duración.** *"I have been working there since June."* Es
  literalmente la respuesta a la primera pregunta de toda entrevista.
- **Condicionales.** *"If we hadn't added the lock, the workers would have duplicated the job."*
  Imprescindible para explicar decisiones técnicas, que es el 80% de un screening senior.
- **Oraciones de relativo.** *"the service that syncs the devices"*. Permite una frase precisa en
  vez de tres vagas.
- **Pasiva.** *"the module was redesigned"*. Registro estándar en descripción técnica.

**Fluidez bajo presión**

Lo que de verdad falla. Un B1 que ha preparado respuestas suena B2 hasta la primera pregunta
inesperada. Por eso el simulacro incluye siempre una pregunta que no puede responder del todo.

---

## Interferencias del español

Buscar estas específicamente. Son las que un hispanohablante produce sin oírlas.

| Error | Correcto | Nota |
|---|---|---|
| "Actually I work there" (queriendo decir *actualmente*) | "Currently I work there" | *Actually* = en realidad |
| "I assisted to the meeting" | "I attended the meeting" | *Assist* = ayudar |
| "We realized the migration" | "We carried out the migration" | *Realize* = darse cuenta |
| "I'm agree" | "I agree" | *Agree* es verbo, no adjetivo |
| "People is" | "People are" | Plural en inglés |
| "Explain me the architecture" | "Explain the architecture to me" | *Explain* no toma objeto indirecto directo |
| "I have 25 years" | "I am 25 years old" | Edad con *to be* |
| "Since 3 years" | "For 3 years" | *Since* = punto de inicio; *for* = duración |
| "In the other hand" | "On the other hand" | |
| "Depends of" | "Depends on" | |
| "I did a mistake" | "I made a mistake" | *Do* / *make* |
| "The half of the requests" | "Half of the requests" | |
| "More better" | "Better" | Doble comparativo |
| "I'm going to explain you" | "I'm going to explain to you" | Mismo caso que *explain me* |

---

## Pronunciación

### La vocal epentética

El error más audible y el más fácil de corregir conscientemente: insertar una vocal antes de los
grupos que empiezan por *s-*. *"eschema"*, *"estack"*, *"esscheduling"*, *"estatus"*.

Se marca **siempre** que aparezca. Un oído nativo lo oye inmediatamente y quien lo comete no lo oye
en su propia voz.

Un transcriptor normal **no sirve** para detectarlo: oye *"eschema"* y escribe `schema`, porque su
trabajo es entenderte, no juzgarte. Hace falta evaluación a nivel de fonema. Ver `VOICE.md`.

### Palabras del campo técnico que hay que drillear

`throughput` · `queue` · `scheduling` · `schema` · `architecture` · `deployment` · `query` ·
`cache` · `concurrency` · `reliability` · `bottleneck` · `issue` · `focus` · `development` ·
`suite` · `route` · `height` · `width` · `null` · `variable` · `data`

---

## Frases de rescate

Seis. Tienen que ser automáticas, no recordadas. Un B1 que las tiene automatizadas sobrevive una
entrevista B2; uno que se congela, no.

1. **Ganar tiempo:** *"That's a good question — let me think for a second."*
2. **No entendió la pregunta:** *"Sorry, could you rephrase that?"*
3. **No conoce una palabra:** *"I don't know the exact term, but it's the component that..."*
4. **Se perdió a mitad de frase:** *"Let me start that again."*
5. **No sabe la respuesta:** *"I haven't worked with that directly, but the closest thing I've done
   is..."*
6. **Confirmar que se entendió:** *"Does that answer your question?"*

La 5 es la más importante y la que menos se practica. Decir "no lo he hecho, pero lo más parecido
es X" es una respuesta senior. Inventar, no.

---

## Protocolo del simulacro

20-30 minutos, en inglés, **en personaje de principio a fin**.

1. *"Tell me about yourself."* — su pitch de 60 segundos.
2. Dos o tres preguntas sobre su experiencia real, empujando al detalle: **por qué** ese enfoque,
   cuál era la alternativa, qué haría distinto.
3. **Una pregunta que no puede responder del todo**, deliberadamente. Tiene que usar una frase de
   rescate en vez de congelarse o farolear. Es una habilidad evaluada, no relleno.
4. *"Do you have any questions for us?"*

**No se corrige durante.** Ni una vez. Interrumpir destruye lo único que este formato entrena.

Después, fuera de personaje y en español, el debrief según `06-correction-protocol.md`.

---

## Notacion

Dos formatos, los dos en ASCII y en la terminal.

**Estructura de la frase**, para que vea de que esta hecha en vez de memorizarla:

```
  [ I ] [ have been working ] [ here ] [ for 3 years ]
    |            |               |            |
  sujeto    pres. perf.        lugar      duracion
            continuo                      ("for" = cuanto tiempo)
                                          ("since" = desde cuando)
```

**Contraste**, que es lo que corrige la interferencia del espanol:

```
  MAL   I have 3 years working here
  BIEN  I have been working here for 3 years

  por que: en espanol "llevo 3 anos" usa presente. En ingles, una accion
  que empezo antes y sigue pide present perfect continuous.
```

## Kit de verificacion

| Nivel | Que | Estado |
|---|---|---|
| 0 | Que produzca la estructura antes de usarla en conversacion | activo |
| 3 | OpenPronounce en local: fonema dicho vs. esperado, en IPA | propuesto |

El nivel 3 es el unico que detecta la vocal epentetica. Un transcriptor normal no sirve: oye
*"eschema"* y escribe `schema`, porque su trabajo es entenderte. Ver `VOICE.md`.

**No verificable:** naturalidad, registro y si suena forzado. Eso necesita un oido nativo. El
sistema puede darle precision gramatical y fluidez sostenida, que es lo que se evalua en un
screening tecnico.

## Contenido: solo su trabajo real

Todas las frases de práctica salen de `01-learner-profile.md` y de `private/<perfil>/profile.md`: los
proyectos concretos que el aprendiz ha hecho de verdad, con sus números y sus decisiones.

**Nunca inventar un proyecto.** En una entrevista va a tener que defender lo que diga, y una
historia que no vivió se cae en la segunda pregunta.

Este es también el motivo por el que la práctica de idioma para entrevistas rinde doble: cada
frase que produce es un ensayo de la respuesta real.
