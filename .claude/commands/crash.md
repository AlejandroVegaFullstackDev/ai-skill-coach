# /crash — Aprender algo concreto, ya

Para cuando no hay meses: hay un ticket el lunes, una entrevista el jueves, una reunión en dos
horas y hace falta entender **una cosa específica** lo bastante para no quedar en evidencia.

```
/crash programacion reactiva
/crash RxJS, entrevista el jueves
/crash como funciona OAuth, tengo 2 horas
```

No es el flujo normal. El flujo normal mide, planifica y consolida. Esto comprime todo en una
sesión y **asume la deuda**.

---

## Lo primero: decir qué compra esto y qué no

Antes de nada, en dos líneas. No es un descargo de responsabilidad, es información que cambia
cómo va a usar lo que aprenda:

> En [tiempo disponible] llegas a **L1-L2**: vas a poder seguir la conversación, usar los
> términos bien y hacer preguntas sensatas. **No** vas a poder diseñar con esto ni defenderlo
> ante alguien que lo use a diario.
>
> Si lo que necesitas es parecer que lo dominas, esto no lo hace. Si lo que necesitas es no
> perderte y saber qué preguntar, sí.

Escala en `03-assessment-rubric.md`. Un crash **no produce L3**, y decir lo contrario le prepara
una escena mala.

---

## Paso 1: Acotar por la situación

Dos preguntas, y con la primera basta casi siempre:

1. **¿Para qué exactamente, y cuándo?** Una entrevista, un ticket, una reunión, una decisión que
   tomar. Determina qué se estudia y qué se descarta.
2. **¿Cuánto tiempo tienes de verdad?** Hasta el evento y hasta ahora mismo.

La misma palabra pide cosas opuestas según la situación:

| "Programación reactiva" para… | Lo que hace falta |
|---|---|
| Una entrevista | Vocabulario, el porqué, los trade-offs, qué problema resuelve |
| Un ticket el lunes | Los cinco operadores del caso, el error típico, cómo depurarlo |
| Decidir si adoptarlo | Coste de adopción, cuándo **no** usarlo, alternativas |

Si contesta algo vago, insistir una vez. Un crash mal acotado es el peor uso posible del tiempo
que tiene.

---

## Paso 2: Harvest dirigido

Como `/harvest`, pero **estrecho y rápido**. No cobertura: solo lo que la situación exige.

- Fuentes primarias antes que tutoriales: documentación oficial, el texto de quien lo diseñó.
- Buscar explícitamente **"cuándo no usarlo"** y **"errores comunes"**. Son la mitad del valor y
  lo que separa entender de haber leído.
- Misma tabla de calidad de `source-harvester/SKILL.md`. Con prisa se baja el listón y es cuando
  entra la basura.

Escribir **una** ficha en `knowledge/<habilidad>/`, marcada `mode: crash`. Sirve luego si decide
consolidar.

Si hay material en `sources/`, mirarlo primero.

---

## Paso 3: El mapa mínimo

Lo que de verdad entrega este comando:

```
## <tema> en <N> minutos

### El problema que resuelve
[Una frase. Si no se puede decir en una frase, no se entendio.]

### Los 5 conceptos que no puedes no saber
1. ... — [que es, y por que importa aqui]

### Lo que puedes ignorar hoy
[Explicito. Es la mitad del valor: saber que NO hay que mirar.]

### El error que comete todo el mundo al empezar
[Uno o dos. Concretos.]

### Cuándo NO se usa
[Lo que mas rapido distingue a quien lo entiende de quien lo leyo ayer.]
```

**"Lo que puedes ignorar hoy" es obligatorio.** Con tiempo limitado, recortar es el trabajo. Una
lista de 20 conceptos sin jerarquía es lo mismo que no tener nada.

---

## Paso 4: Producir, aunque sea poco

Un crash sin producción es lectura, y la lectura no sobrevive a la primera pregunta.

Aunque queden diez minutos: **una** producción. La que más se parezca a la situación:

| Situación | Producción |
|---|---|
| Entrevista | Explicarlo en voz alta en 60 segundos, sin leer |
| Ticket | Escribir el fragmento, aunque no compile |
| Reunión | Formular las tres preguntas que harías |
| Decisión | Defender el "no" y luego el "sí" |

Corregir según `06-correction-protocol.md`. Sin suavizar: aquí el margen es corto.

---

## Paso 5: La pregunta que te delata

Cerrar con esto. Es lo más útil del comando:

> Si te preguntan **[X]**, se nota que lo viste ayer. La respuesta honesta es: *"no lo he usado
> en producción, lo que entiendo es [...]"*. Eso pasa. Fingir, no.

Reconocer el límite es una respuesta senior. Farolear se detecta en la segunda repregunta, y ahí
se pierde también lo que sí sabía.

---

## Paso 6: Registrar la deuda

Escribir en el tracker del perfil activo, con los ítems marcados `via: crash`:

- Estado **`taught`**, nunca `practiced` ni `mastered`. Se explicó; no se ha producido bajo
  condiciones reales.
- Repaso a **2 días**, sin excepción. Un crash sin repaso se evapora entero.

Cerrar así:

> Queda como deuda. Si esto va a formar parte de tu trabajo, corre `/plan` esta semana y lo
> consolidamos de verdad. Si era para el jueves y ya pasó, déjalo: se archiva solo.

Las dos salidas son legítimas. Aprender algo a fondo porque salió una vez en una reunión es
desperdiciar el tiempo igual que no haberlo aprendido.

---

## Si no hay perfil activo

`/crash` funciona **sin perfil y sin línea base**: es su razón de ser. Si no hay perfil activo, se
ejecuta igual y el registro del Paso 6 se salta, diciéndolo:

> Sin perfil activo no guardo esto. Si quieres que lo consolidemos después, corre `/setup`.
