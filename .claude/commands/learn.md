# /learn — La sesión

El comando que se usa todos los días. Todo lo demás existe para que este sea instantáneo.

```
/learn tengo 7 minutos
/learn estoy en el bus, no puedo hablar
/learn 40 minutos pero estoy fundido
/learn                     <- pregunta las condiciones
```

---

## Paso 1: Condiciones

Si `$ARGUMENTS` trae tiempo y contexto, usarlos y **no preguntar nada más**. La fricción aquí mata
el hábito.

Si viene vacío, una sola pregunta: *"¿Cuánto tiempo tienes y dónde estás?"*

Traducir a filtro según `05-session-formats.md`:

| Lo que dice | Filtro |
|---|---|
| "7 minutos" | `minutes <= 7` |
| "en el bus" / "en la oficina" | `needs_voice: false` |
| "fundido" | `mode: reception`, o producción de un ítem ya `practiced` |
| "casa solo" | sin filtro — **aprovechar para voz** |
| "entrevista el jueves" | simulacro, por encima de todo |

---

## Paso 2: Cargar estado

Leer `progress/<perfil>/tracker.json` y `Glob ejercicios/<perfil>/**/*.md`.

Si no hay tracker → `/assess`. Si no hay currículo → `/plan`. No improvisar una sesión: el valor
de este repo es que sabe qué ya está dominado, y sin estado no lo sabe.

---

## Paso 3: Elegir **una** actividad

Prioridad de `skill-coach/SKILL.md`:

1. Repasos vencidos de ítems `mastered` (máximo 30% del tiempo)
2. Ítems `practiced` que fallaron la última sesión
3. Ítems `taught` sin producir
4. **Un solo** ítem `unseen`

Filtrar por las condiciones. De lo que sobrevive, coger lo de mayor prioridad que **quepa entero**
en el tiempo disponible.

**Una actividad, no un menú.** El aprendiz ya gastó energía decidiendo practicar; no le hagas
gastar más eligiendo.

Si el filtro deja fuera todo lo prioritario —por ejemplo, todo lo pendiente exige hablar y está en
una reunión— **decirlo** y ofrecer lo mejor disponible. No fingir que es el plan óptimo.

Si nada cabe en el tiempo disponible, decirlo también y ofrecer un micro-repaso de 3 minutos en
vez de forzar un ejercicio a medias.

---

## Paso 4: Abrir con continuidad

Una o dos frases nombrando lo último:

> La vez pasada saltaste el descarte dos veces. Hoy vamos a eso.

La sesión tiene que sentirse continua, no como empezar de cero. Es barato y es la mitad de por qué
el sistema se siente distinto a una app.

---

## Paso 5: Dar la actividad

Seguir el fichero de `ejercicios/<perfil>/`. Idioma según `02-learning-preferences.md`: se explica
en el idioma que domina, se practica en el que entrena.

**Renderiza la notación del dominio. No describas nada espacial en prosa.** Un diagrama, una
tablatura, un pinout, un antes/contra/después. Ver `09-notacion.md`; si el paquete de dominio
define un formato, ese.

**Antes de que ejecute, hazle reproducirlo.** No preguntes "¿entendido?" —a eso todo el mundo
dice que sí—: *"dime qué dedo va en qué traste"*, *"¿qué pasa si invierto estos dos pines?"*.
Treinta segundos, y es donde aparece el malentendido, antes de convertirse en semanas de práctica
equivocada.

Si el kit de verificación del dominio incluye foto o medición, **pídela ahora**, no al final.

Durante la producción: **no corregir.** Se deja terminar.

Única excepción: un error que hace la frase incomprensible y bloquea la conversación. Cinco
segundos y seguir.

---

## Paso 6: Debrief

Formato exacto de `06-correction-protocol.md`:

```
## Lo que sostuviste bien
## Errores            (tabla: dijiste / correcto / por qué)
## El que más te va a costar
## Para la próxima
```

Todos los errores, no una muestra. Ninguno inventado. No mejorar lo que ya estaba bien.

---

## Paso 7: Escribir el estado

Escritura atómica a `progress/<perfil>/tracker.json`:

- Error nuevo → crear ítem con la **frase exacta** en `evidence`
- Error repetido → `fail_count++`, actualizar `last_seen`
- Producción correcta espontánea de un `practiced` → `correct_streak++`; a `mastered` **solo al
  llegar a 2 en sesiones distintas**, y entonces fijar `review_stage: 1` y `due: +2 días`
- Fallo de un `mastered` → baja a `practiced` **con la frase que lo evidencia**. Sin frase, no se
  degrada
- Ítem correcto que estaba programado para repaso → repaso aprobado, siguiente intervalo
- Añadir la entrada de sesión al historial. **Append, nunca overwrite**

Si un ítem pasa a `mastered`, **decírselo**. Y si alguno lleva tres sesiones sin aparecer, moverlo
a `mastered_archive` y nombrarlo. Ver errores salir de la lista es la única señal visible de
progreso que tiene.

---

## Paso 8: Cerrar

Dos líneas. Qué se hizo, qué toca la próxima.

Nada de "sigue así". Nada de felicitar por haber aparecido: se felicita por producir bien algo que
antes fallaba, y se nombra qué era.
