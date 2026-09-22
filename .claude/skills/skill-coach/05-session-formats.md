# 05 — Formatos de sesión

## Cómo se pide una sesión

El aprendiz dice las condiciones en lenguaje natural. El agente las traduce a un filtro:

| Lo que dice | Filtro |
|---|---|
| "Tengo 7 minutos" | `minutes <= 7` |
| "Estoy en el bus" | Todas las condiciones restrictivas a `false` |
| "En la oficina, puedo escribir" | `needs_voice: false` |
| "No tengo las herramientas aquí" | `needs_equipment: false` |
| "Estoy solo" | `needs_partner: false` |
| "Estoy fundido" | `mode: reception`, o producción de un ítem ya `practiced` |
| "Estoy en el taller / tengo la casa sola" | Sin filtro. **Aprovechar la condición buena** |
| "Tengo la prueba el jueves" | El formato de mayor valor, por encima de todo |

Los nombres de las condiciones los define el paquete de dominio. El motor solo filtra.

## Los formatos

### Micro · 2-5 min
Un ítem. Una producción corta. Sin contexto previo, sin calentamiento.

Tres producciones cortas del mismo ítem, sobre un caso que el aprendiz conoce. Se corrige, se
cierra.

Es el formato **más importante del sistema**, porque es el hueco que de verdad existe todos los
días. Si solo funcionara este, el proyecto ya valdría la pena.

### Corta · 10-15 min
Un ítem nuevo o uno fallado, con explicación breve y tres o cuatro producciones. Termina con
debrief completo.

### Completa · 25-30 min
Ejecución sostenida. Es donde se mide de verdad, porque el cansancio aparece y los errores
fosilizados salen.

### El formato de mayor valor · 20-30 min
Lo que más se parece a la situación objetivo: un simulacro de entrevista, depurar un bug real, un
diagnóstico a ciegas, un juego de rol con un interlocutor difícil. Lo define el paquete de
dominio, con su protocolo.

**No se corrige durante.** Interrumpir destruye justo lo que hay que entrenar: sostener la
ejecución bajo presión, sin red.

### Repaso · variable
Solo ítems `mastered` con fecha vencida. Sin material nuevo. Rápido por diseño.

---

## La ruta degradada

Casi siempre hay una condición que falta la mitad del tiempo: no poder hablar, no tener las
herramientas, no tener con quién practicar. Esa ruta tiene que ser **completa por sí sola**, no un
consuelo.

Patrones que funcionan en cualquier dominio:

| Actividad | Entrena | Ejemplo |
|---|---|---|
| Producir por escrito lo que haría en vivo | La misma decisión, sin el canal | Escribir la respuesta que diría en voz alta |
| Razonar sobre un caso sin ejecutarlo | Diagnóstico y criterio | "¿Qué comprobarías primero y por qué?" |
| Reconstruir de memoria una corrección de hace 10 minutos | Fijación | Reescribir la frase corregida |
| Analizar la ejecución de otro | Reconocimiento del error | Ver un vídeo y decir qué está mal |
| Preparar el guion ahora, ejecutarlo después | Puente a la ruta completa | Guion en el bus, grabación en casa |

La última es la que conecta las dos rutas, y es la que hace que el tiempo muerto valga algo.

**Si en un dominio esta ruta no existe**, el paquete lo dice y no se inventa una. Hay habilidades
que no se pueden practicar sin el equipamiento, y fingir lo contrario produce práctica inútil.

---

## Qué no es una sesión

- Un menú de opciones. **Una sesión, una actividad.** Ya gastó energía decidiendo practicar.
- Una lista de cosas que memorizar.
- Un plan para la semana. Eso es `/plan`, y se corre aparte.
- Una charla sobre cómo va el progreso. Eso es `/log`.
