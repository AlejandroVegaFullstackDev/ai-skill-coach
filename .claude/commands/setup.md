# /setup — Empezar

Crea un **perfil** y lo deja listo para entrenar.

## Cómo se conduce esto

**Una pregunta a la vez, con opciones, usando `AskUserQuestion`.** Nunca un muro de texto con
cinco preguntas dentro.

Reglas de conducción, y son la mitad del valor de este comando:

- **Siempre con opciones concretas**, aunque la pregunta parezca abierta. El usuario debería poder
  completar el setup entero pulsando Enter. Escribir es la salida de emergencia, no la vía normal.
- **Marca la opción más probable como recomendada** y ponla primera. Dedúcela de lo que ya sabes:
  la habilidad, lo que contestó antes, lo que haya en `sources/`.
- **Nunca preguntes algo que puedas deducir o buscar.** Si la respuesta está en `sources/`, en un
  perfil anterior o en la web, ya la tienes.
- **Máximo 6 preguntas.** Si necesitas más, estás preguntando cosas que deberías investigar tú.
- **Sin preámbulos.** Nada de explicar el sistema antes de empezar. La primera pregunta es lo
  primero que ve.

---

## Paso 0: Mirar antes de preguntar

En paralelo, sin decir nada al usuario todavía:

- `private/active` y `Glob private/*/profile.md` — ¿ya hay perfiles?
- `Glob progress/*/tracker.json` — ¿hay progreso que **no se puede pisar**?
- `Glob sources/**/*` — ¿dejó material?
- `Glob .claude/skills/*-coach/SKILL.md` — qué paquetes de dominio existen

Si ya hay perfiles, la primera pregunta es si quiere uno nuevo o continuar con el que hay.

Si `sources/` tiene material, **léelo antes de preguntar nada**. Puede que conteste la mitad.

---

## Pregunta 1 — Qué quieres aprender

Texto libre; es la única que no puede tener opciones cerradas. Ofrece ejemplos de dominios
distintos para que quede claro que no es una app de idiomas:

> ¿Qué quieres aprender?
>
> Un idioma, programación, mecánica, hablar en público, un instrumento, negociación, un oficio.
> Lo que sea.

Si hay material en `sources/`, propón lo que hayas deducido como primera opción.

---

## Pregunta 2 — A fondo o para ya

```
¿Cuánto margen tienes?

1. A fondo, sin fecha límite (Recomendado)
   Plan sostenido: medimos tu nivel, generamos ejercicios, vas a tu ritmo.
2. Tengo una fecha
   Hay algo concreto en el calendario. Trabajamos hacia atrás desde ahí.
3. Lo necesito esta semana
   No hay tiempo para nada sostenido. Necesito entenderlo y usarlo ya.
```

**Si elige 3, esto no es un `/setup`.** Dilo y cambia de comando:

> Entonces lo tuyo es `/crash`, que salta la medición y el plan y te da lo mínimo usable en una
> sesión. Te aviso de lo que compra eso: vas a poder seguir la conversación y preguntar bien, no
> a diseñar con ello.
>
> ¿Lo lanzo ahora, o prefieres montar el perfil primero para que quede registrado?

Si dice que sí, ejecuta `.claude/commands/crash.md` y termina aquí. Sin perfil, `/crash` funciona
igual.

Si elige 2, pide la fecha y guárdala: cambia las prioridades de todo lo que venga después.

---

## Paso 3 — Investigar el dominio antes de seguir preguntando

**Aquí es donde el agente trabaja, y va antes de las preguntas difíciles.** No le preguntes el
nivel a alguien antes de saber tú de qué partes se compone la habilidad: para un idioma cuela
porque todo el mundo conoce el A1-C2, pero *"¿cuál es tu nivel en programación reactiva?"* es una
pregunta que nadie sabe contestar.

Dilo y hazlo:

> Dame un momento, me documento sobre [habilidad] para no hacerte preguntas genéricas.

Si **no hay paquete de dominio** para esa habilidad, ejecuta el procedimiento de
`.claude/commands/add-domain.md` ahora, no después. No le pidas al usuario que corra otro
comando.

Si **ya existe**, léelo y salta a la Pregunta 4.

De ahí salen tres cosas que necesitas ya:

- **Las sub-habilidades reales.** Convierten la Pregunta 5 en algo contestable.
- **El objetivo típico.** Convierte la Pregunta 4 en opciones en vez de un folio en blanco.
- **Las condiciones de práctica.** Determinan qué preguntar en la 6.

Al terminar, resume en tres líneas qué encontraste. El usuario tiene que ver que pasó algo.

---

## Pregunta 4 — Para qué, concretamente

Ahora sí puedes ofrecer opciones, porque sabes para qué usa la gente esta habilidad.

Ejemplo, para programación reactiva:

```
¿Para qué lo necesitas? Esto ordena todo lo demás.

1. Entender código ajeno que ya lo usa (Recomendado)
   Puedes leer el repo de tu equipo sin perderte.
2. Escribirlo tú en producción
   Diseñas flujos nuevos y los depuras solo.
3. Pasar una entrevista técnica
   Explicarlo, justificar decisiones, aguantar repreguntas.
4. Decidir si lo adoptamos
   Trade-offs, coste de adopción, cuándo no usarlo.
```

**Esta pregunta no se salta y no acepta vaguedad.** Si escribe algo como "mejorar", repregunta
una vez con opciones. Sin situación verificable el currículo se dispersa y no hay forma de saber
si el sistema funciona o solo entretiene.

---

## Pregunta 5 — Nivel de partida

Con las sub-habilidades que descubriste. Multi-selección:

```
¿Qué te suena de esto? Marca lo que ya hayas hecho.

[ ] He leido sobre ello pero nunca lo he usado
[ ] Lo he usado siguiendo un tutorial
[ ] Lo he usado solo en algo real
[ ] Lo he depurado cuando fallaba
[ ] Se lo he explicado a alguien
```

Eso mapea a L0-L5 sin usar la escala por delante, que a nadie le dice nada.

**No es una medición.** Es una hipótesis para calibrar `/assess`. Apúntalo como autopercepción,
marcado como tal, y dilo:

> Esto es para orientarme. El nivel de verdad sale de `/assess`, y suele ser más bajo que lo que
> uno cree, porque lo que se reconoce va siempre por delante de lo que se produce.

Si tiene certificado o test, pregúntalo aparte y **anota qué midió**, no solo el resultado.

---

## Pregunta 6 — Cuándo y dónde practicas

Dos en una pantalla si el cliente lo permite; si no, seguidas.

```
¿Cuánto duran tus huecos de verdad?

1. 5-10 minutos, cuando salen (Recomendado)
2. Media hora, algunos días
3. Una hora o más, con planificación
4. Muy irregular, no hay patrón
```

```
¿Qué puedes hacer en esos huecos? Marca todo lo que aplique.

[ ] Hablar en voz alta
[ ] Escribir
[ ] Tener las herramientas o el equipo a mano
[ ] Practicar con otra persona
```

Las opciones de la segunda **salen del paquete de dominio**: para un idioma es hablar en voz
alta, para un oficio es el equipo, para habilidades sociales es la otra persona.

Recomienda la opción 1 salvo que algo diga lo contrario. Es la respuesta real de casi todo el
mundo, y el sistema está diseñado para eso.

---

## Pregunta 7 — Qué te hizo abandonar antes

La más informativa, y casi nadie la hace. Multi-selección:

```
¿Qué pasó las otras veces que lo intentaste?

[ ] Repetir lo basico una y otra vez sin llegar a lo que necesito
[ ] Se rompio la racha un dia y lo deje
[ ] Las sesiones no cabian en mi dia
[ ] No veia si estaba avanzando
[ ] Nunca llegue a empezar en serio
```

Cada respuesta tiene consecuencia directa, y **hay que decírsela**:

| Marca | Lo que cambia |
|---|---|
| Repetir lo básico | Lo dominado no vuelve. Es la razón de existir del tracker |
| Racha rota | No habrá planes diarios. Los huecos irregulares son el caso normal |
| No cabían | Todo tiene que funcionar en 5 minutos |
| No veía avance | Cada ítem que se supera se nombra en voz alta |
| Nunca empecé | La primera sesión es hoy, corta, y sin línea base previa |

Que vea que su respuesta cambió el sistema es lo que hace que la octava vez sea distinta.

---

## Paso 8 — Material de práctica

Propón tú, a partir de lo que sepas de él. Si no sabes nada, pregunta abierta pero corta.

> Para que los ejercicios no sean de manual: ¿con qué contenido tuyo practicamos? Proyectos,
> trabajo, casos que conozcas de verdad.

Si ya hay otro perfil de la misma persona, **reutiliza el suyo** y solo confirma.

---

## Paso 9 — Escribir

Nombre del perfil a partir de persona y habilidad —`ana-reactiva`, `sara-guitarra`—,
confirmado. Minúsculas, sin espacios, sin acentos: es un nombre de carpeta.

Escribir **solo dos cosas**:

| Fichero | Qué va |
|---|---|
| `private/<perfil>/profile.md` | Todo. Plantilla en `config/profile.example.md` |
| `private/active` | El nombre del perfil, una línea |

**Nada va a un fichero versionado.** Ni el nombre, ni la habilidad, ni el objetivo, ni el nivel.
`CLAUDE.md` y los ficheros del motor no se tocan: solo apuntan a `private/`. Así el repo se
publica sin revisar nada y un push accidental no expone nada.

Si el perfil ya existía, **leerlo antes y mezclar**, no sobrescribir.

**No crear el tracker.** Eso lo hace `/assess` con evidencia real.

---

## Paso 10 — Cerrar con una acción, no con un resumen

Resumen de **cuatro líneas como mucho**, y una sola cosa que hacer ahora:

```
Perfil: ana-reactiva
Objetivo: entender el codigo reactivo del equipo sin perderte
Huecos: 5-10 min, sin poder hablar en voz alta
Paquete de dominio: creado, con 2 huecos que no pude confirmar

Siguiente: /assess. Son 20 minutos y sale tu nivel real.
¿Lo hacemos ahora o lo dejas para luego?
```

Si tiene material sin subir, menciónalo en **una línea**: `sources/` y después `/harvest`.

Verificar la checklist de `CLAUDE.md`.
