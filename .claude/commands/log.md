# /log — Registrar lo que pasó fuera del repo

Cierra el ciclo con la realidad. Una entrevista, una reunión en inglés, un examen, una conversación
que salió mal: eso vale más que diez sesiones de práctica, y si no se registra se pierde.

```
/log tuve la entrevista con Deel y me bloqueé en la pregunta de arquitectura
/log                   <- pregunta que paso
```

También sirve para registrar una sesión de práctica hecha sin el agente.

---

## Paso 1: Qué pasó

Si viene en `$ARGUMENTS`, partir de ahí. Preguntar solo lo que falte:

- ¿Qué situación era y cuánto duró?
- ¿Qué salió bien? Concreto.
- ¿Dónde te bloqueaste? **Frases exactas si te acuerdas.**
- ¿Hubo algo que entendiste mal, o que te hicieron repetir?
- ¿Qué habrías querido saber decir y no supiste?

La última es la más productiva de todas: apunta directamente a lo que falta, dicho por quien lo
sufrió.

---

## Paso 2: Convertir a ítems

Cada bloqueo se traduce a un ítem del tracker.

- Si el ítem existe → `fail_count++`, añadir la frase, actualizar `last_seen`.
- Si existe y estaba `mastered` → **baja a `practiced`**. Un fallo en uso real pesa más que
  cualquier repaso aprobado.
- Si no existe → crear como `practiced` con la evidencia.

Lo que salió bien también cuenta: un ítem producido correctamente bajo presión real es la mejor
evidencia posible. `correct_streak++`, y si llega a 2, a `mastered`.

**Uso real pesa más que práctica.** Un acierto en una entrevista vale por dos en un ejercicio, y
un fallo también.

---

## Paso 3: Lectura honesta

En español, sin consolar:

```
## [situacion] — [fecha]

Lo que funcionó: [concreto]
Dónde se rompió: [concreto, con las frases]

Lo que esto cambia en el plan:
[Que items suben de prioridad y cuales bajan.]

Distancia al objetivo: [honesta]
```

Si la experiencia real muestra que el nivel estimado estaba alto, **decirlo y corregir la línea
base**. Esa es la señal más valiosa que da este comando: la realidad contradiciendo la medición.

Si muestra que estaba bajo, también.

---

## Paso 4: Recalibrar

Escribir el tracker (atómico) y añadir la entrada al historial con `command: "log"`.

Si el registro cambia las prioridades de forma apreciable, decirlo y mandar a `/plan`:

> Esto cambia el orden. Lo de condicionales pasó a ser lo primero. Corre `/plan` cuando puedas.

Si no, cerrar sin más.

---

## Regla

Registrar un fracaso no es fracasar. El sistema aprende de esto más que de cualquier ejercicio
bien hecho. Si el aprendiz viene a contar que se bloqueó, **no se le consuela: se le agradece el
dato y se convierte en plan.**
