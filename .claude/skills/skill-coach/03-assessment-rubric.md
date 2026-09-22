# 03 — Cómo se mide el nivel

Agnóstico de habilidad. Sirve igual para un idioma, para soldadura, para negociación o para
escribir tests.

## Principio

**Un nivel sin evidencia es una opinión.** Cada afirmación lleva fuente y fecha, y distingue lo
que se midió de lo que se supuso.

| Afirmación | Válida |
|---|---|
| "L3 en diagnóstico de frenos — cambió unas pastillas solo, 2026-09-22" | Sí |
| "Certificado X, marzo 2026, examen teórico" | Sí, pero solo para conocimiento |
| "Parece que se le da bien" | No. Es una impresión |
| "Sabe programar, lleva 4 años" | No. El tiempo no es una medida |

---

## La escala

Cinco niveles. Se aplican **por sub-habilidad**, nunca a la habilidad entera.

| Nivel | Nombre | Qué significa | Cómo se comprueba |
|---|---|---|---|
| **L0** | Desconocido | No lo ha tocado | — |
| **L1** | Reconoce | Lo identifica cuando lo ve. No lo produce | Se lo muestras y lo nombra |
| **L2** | Con guía | Lo hace si le vas diciendo | Lo hace contigo delante, preguntando |
| **L3** | Solo, caso típico | Lo hace sin ayuda en la situación normal | Le das la tarea estándar y sale |
| **L4** | Solo, caso raro | Se adapta cuando la situación no es la del manual | Le cambias las condiciones y sigue |
| **L5** | Enseña | Explica por qué, no solo cómo. Detecta el error de otro | Le haces corregir un trabajo ajeno |

**El salto que importa casi siempre es L2 → L3.** Es donde está la diferencia entre "he hecho un
curso" y "sé hacerlo". Y es donde la gente se estanca años, porque el material de estudio es
abundante y las oportunidades de hacerlo solo no.

### Recepción y producción

En cualquier habilidad hay **recepción** (entender, leer, reconocer, diagnosticar) y **producción**
(hacer, decir, construir, decidir). La recepción casi siempre va uno o dos niveles por delante.

Un test que solo mide recepción da un número alto e inútil:

| Habilidad | Recepción | Producción |
|---|---|---|
| Idioma | Entiende un artículo | Sostiene una conversación |
| Programación | Lee y entiende el código | Lo escribe desde cero y lo depura |
| Mecánica | Identifica el ruido | Desmonta, diagnostica y arregla |
| Negocios | Lee un balance | Decide con él y defiende la decisión |
| Habilidades sociales | Nota que la reunión se tensó | Reconduce la conversación en el momento |

**Regla: el nivel que se reporta es el de producción.** El de recepción se anota aparte.

---

## Mapear a la escala del dominio

Si la habilidad tiene una escala propia reconocida, el paquete de dominio la declara y se anotan
las dos. La escala externa es la que sirve para hablar con terceros; la interna es la que mueve el
currículo.

| Dominio | Escala externa | Aproximación |
|---|---|---|
| Idiomas | CEFR A1-C2 | L2≈A2/B1 · L3≈B2 · L4≈C1 |
| Oficios | Certificaciones sectoriales | Según el sector |
| Programación | Ninguna real | Solo la interna |
| Habilidades sociales | Ninguna | Solo la interna |

Que no haya escala externa no es un problema: L0-L5 con evidencia es más informativo que un número
de un test.

**Cuidado con las escalas externas que miden otra cosa.** Un certificado de idioma que solo evalúa
lectura y gramática puntúa alto y no predice cómo irá una conversación. Se anota qué midió, no
solo el resultado.

---

## Qué produce `/assess`

```yaml
skill: mecanica-basica
measured_at: 2026-09-22
scale_external: null

reception:
  diagnostico-por-sonido: L2   # identifico el ruido de pastillas, fallo el de rodamiento
  lectura-de-esquemas: L1      # reconoce los simbolos, no sigue el circuito

production:
  cambio-de-pastillas: L2      # lo hizo con instrucciones delante, dos pasos fuera de orden
  diagnostico-completo: L1     # no llego a una hipotesis sin ayuda

overall: L2
evidence_source: sesion practica de 40 min, 2026-09-22, grabada
```

Sin el campo de evidencia, la entrada no es válida.

---

## Cómo se hace la línea base

Vale para cualquier dominio:

1. **Producción primero, sin aviso previo.** Una tarea real, no ejercicios. Nada de prepararse: se
   mide lo que sale sin preparar.
2. **No corregir durante.** Interrumpir mide otra cosa.
3. **Registrar lo exacto.** "Falló el diagnóstico" no sirve; "descartó el rodamiento sin
   comprobarlo porque el ruido cambiaba al frenar" sí, porque se puede volver a ello.
4. **Empujar hasta que falle.** El nivel está donde deja de salir, no donde deja de ser cómodo.
   Si todo sale bien, la tarea era demasiado fácil y no se midió nada.
5. **Recepción después**, con material real del dominio.

### Cuando no se puede observar la producción

En habilidades físicas o presenciales el agente no puede ver la ejecución. Tres sustitutos, en
orden de calidad:

1. **Grabación**, si el aprendiz puede grabarse.
2. **Que narre lo que hace mientras lo hace**, y contrastar el razonamiento.
3. **Que explique cómo lo haría**, paso a paso, ante un caso concreto y con preguntas de por qué.

El tercero mide conocimiento procedimental, **no ejecución**. Se anota como tal y el nivel de
producción queda marcado como no verificado. No se finge que se midió.

---

## Cuándo se vuelve a medir

- Cada 20 sesiones, o
- Cuando 5 ítems pasan a `mastered` desde la última medición, o
- Cuando el aprendiz lo pida.

**No más seguido.** Medir cada semana produce ruido y convierte el progreso en algo que se vigila
en vez de algo que ocurre.

---

## La regla de honestidad

Si la evidencia no sostiene una subida, **no se sube**, aunque el aprendiz haya trabajado mucho y
se lo merezca emocionalmente. El nivel es una predicción sobre cómo le va a ir en una situación
real. Inflarla es prepararle un fracaso.

## Exámenes de terceros

Si el aprendiz está haciendo un test de nivel, una certificación, una prueba técnica de una
empresa o cualquier evaluación cuyo resultado entrega a otro: **no se responde, ni parcialmente,
ni "solo esta".** Se ofrece revisarla después.

Un certificado obtenido así describe al agente, no a la persona, y el aprendiz se lo encuentra de
frente el primer día del trabajo.
