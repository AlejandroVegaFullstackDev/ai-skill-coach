# /assess — Línea base con evidencia

Mide dónde está el aprendiz de verdad y crea `progress/<perfil>/tracker.json`. Es el único comando que puede
crear el tracker desde cero.

Sin esto, todo lo demás adivina.

---

## Antes de empezar

Leer `01-learner-profile.md`, `03-assessment-rubric.md` y el paquete de dominio activo.

Si `progress/<perfil>/tracker.json` **ya existe**, esto es una re-medición. Avisar y aplicar la regla de
frecuencia de `03-assessment-rubric.md`: cada 20 sesiones, o tras 5 ítems nuevos en `mastered`, o
a petición. Si no se cumple ninguna y el usuario no insiste, decirle que medir demasiado seguido
produce ruido y ofrecer `/learn`.

---

## Paso 1: Avisar de las condiciones

En una frase, antes de nada:

> Esto mide lo que sale sin preparar, así que no te prepares. Van a ser unos 20 minutos, no voy a
> corregir nada durante, y al final te digo exactamente dónde estás. Necesito que [la condición
> que exija el dominio: puedas hablar en voz alta / tengas las herramientas / tengas media hora
> sin interrupciones]. Si ahora no puedes, mejor lo dejamos: esa parte es la que importa.

Si la condición no se cumple, ofrecer la medición parcial dejando **explícito** que el nivel
resultante es provisional y no cubre lo que más falla.

Si el dominio no permite observar la ejecución en absoluto, aplicar los tres sustitutos de
`03-assessment-rubric.md` y **marcar el nivel de producción como no verificado**. No fingir que
se midió.

---

## Paso 2: Producción, sin red

15-20 minutos. Una **tarea real** del objetivo declarado, no ejercicios de libro.

El paquete de dominio define el formato de mayor valor; usar ese. Si no hay paquete, construir la
tarea desde el objetivo: si el objetivo es diagnosticar averías, se le da una avería.

Reglas durante:

- **No corregir.** Ni una vez.
- **No ayudar** cuando se atasca. Cómo sale del bache es parte de la medida.
- **Registrar lo exacto.** Literal: la frase, el paso, la decisión, tal cual salió.
- Anotar bloqueos: cuántas veces se detuvo, cuántas abandonó a mitad, cuántas pidió ayuda.
- **Empujar hasta que falle.** Si todo sale, la tarea era fácil y no se midió nada.

## Paso 3: Recepción

Más corto. Material real del dominio a velocidad y densidad reales, no adaptado.

Medir si entendió **lo suficiente para actuar**, no si entendió cada palabra.

---

## Paso 4: El veredicto

En español, sin suavizar y sin dramatizar.

```
## Dónde estás

Producción: [nivel]  — [evidencia concreta: "3 bloqueos en 12 min, 2 cambios al español"]
Recepción:  [nivel]  — [evidencia concreta]

Nivel que se reporta: [el de producción]

## Lo que ya sostienes
[Real. Si hubo algo correcto y sostenido, nombrarlo. Si no hubo, decirlo.]

## Los errores que salieron
| Hiciste | Correcto | Por qué |

## Los tres que más te cuestan
[Ordenados por impacto en el objetivo declarado, no por gravedad en abstracto.]

## Qué falta para el objetivo
[Distancia honesta al objetivo concreto. En sesiones aproximadas si se puede estimar.]
```

Si el nivel medido es más bajo que el que el usuario creía, **decirlo directamente y explicar por
qué**: casi siempre porque lo que lo sostenía medía conocimiento y no ejecución. No es un
fracaso, es información que evita presentarse a algo prematuramente.

---

## Paso 5: Crear el tracker

Escritura atómica: temporal y renombrado.

```json
{
  "schema_version": 1,
  "skill": "mecanica-motos",
  "goal": "diagnosticar una averia por sintoma sin manual",
  "baseline": {
    "measured_at": "2026-09-22",
    "production": { "diagnostico": "L1", "intervencion": "L2" },
    "reception":  { "identificacion-de-sintomas": "L2" },
    "evidence": "caso practico de 40 min: no llego a hipotesis sin ayuda, salto el descarte"
  },
  "items": [
    {
      "id": "descarte-de-hipotesis",
      "state": "practiced",
      "first_seen": "2026-09-22",
      "last_seen": "2026-09-22",
      "fail_count": 2,
      "correct_streak": 0,
      "evidence": ["descarto el rodamiento sin comprobarlo porque el ruido cambiaba al frenar"],
      "review_stage": null,
      "due": null
    }
  ],
  "sessions": [
    {
      "date": "2026-09-22",
      "command": "assess",
      "minutes": 40,
      "items_touched": ["descarte-de-hipotesis"],
      "notes": "linea base"
    }
  ],
  "mastered_archive": []
}
```

Crear un ítem por **cada error observado**, con la evidencia literal. No crear ítems "que
probablemente también falle": solo lo observado.

Los que hizo correctamente entran como `practiced` con `correct_streak: 1`, no como `mastered`.
Hace falta una segunda ocurrencia en otra sesión.

---

## Paso 6: Encaminar

Verificar la checklist de `CLAUDE.md` y cerrar con el siguiente paso:

- Si `knowledge/<habilidad>/` está vacío → `/harvest`, porque `/plan` no puede generar sin fichas.
- Si ya hay fichas → `/plan`.
