# 04 — Cómo se genera un ejercicio

`/plan` escribe en `ejercicios/<perfil>/`. Este fichero define qué es un ejercicio válido.

## Anatomía

Un ejercicio es un fichero Markdown con frontmatter. El frontmatter es lo que permite responder a
*"tengo 7 minutos y no puedo hablar"* filtrando, no improvisando.

```markdown
---
id: mec-diagnostico-ruido-frenos-01
skill: mecanica-motos
items: [diagnostico-por-sintoma, descarte-de-hipotesis]
level: L2
minutes: 10
needs_voice: false
needs_equipment: false
requires_mastered: [sistema-de-frenos-componentes]
sources: [knowledge/mec-frenos-diagnostico.md]
mode: production
---

# Un ruido al frenar

## Por qué esto ahora
La semana pasada cambiaste pastillas por un ruido que seguía después. Saltaste el descarte.

## El caso
Ruido metálico agudo, solo al frenar, solo en frío, desaparece tras cinco minutos.

## Produce tú
Ordena tus hipótesis de más a menos probable y di **qué comprobarías primero y por qué**. No
cuál es la avería: cuál es la comprobación que más hipótesis descarta de una vez.

## Corrección
<!-- El agente corrige contra 06-correction-protocol.md. No hay solucionario. -->
```

Los campos `needs_*` los define el paquete de dominio: `needs_voice` para un idioma,
`needs_equipment` para un oficio, `needs_partner` para habilidades sociales. El motor solo
necesita que sean booleanos para poder filtrar.

## Campos obligatorios

| Campo | Regla |
|---|---|
| `id` | Único, estable. Nunca se reutiliza aunque se borre el ejercicio |
| `items` | Los ítems que entrena. Deben existir en el tracker o se crean como `unseen` |
| `minutes` | Realista, medido, no aspiracional. Si dudas, redondea hacia arriba |
| `needs_*` | Las condiciones que exige. **Determinan si sirve en el hueco que hay ahora** |
| `requires_mastered` | Ítems que deben estar `mastered` antes. Evita construir sobre arena |
| `sources` | Ficheros de `knowledge/<habilidad>/` que lo sustentan. **Vacío no se acepta** |
| `mode` | `reception` o `production` |

`sources` vacío significa que el agente se lo inventó de memoria. Eso es exactamente lo que
`/harvest` existe para evitar. Un ejercicio sin fuente no se commitea.

## Reglas de generación

**Un ejercicio, un objetivo.** Si entrena cuatro ítems, no entrena ninguno.

**El contenido sale de su vida real.** Los casos, las frases y los problemas salen de lo que el
aprendiz conoce, según `01-learner-profile.md`. Esto no es decoración: si el objetivo es una
situación donde tendrá que defender lo que dice, practicar con un caso de manual no lo prepara.

**Producción por encima de reconocimiento.** Un ejercicio de opción múltiple mide reconocimiento
y es fácil de generar. El que sirve le hace producir: decir, hacer, decidir, construir.
Proporción mínima: **dos de producción por cada uno de reconocimiento.**

**Sin solucionario.** Si el ejercicio trae la respuesta, la lee y cree que la sabía. La corrección
la da el agente después de que produzca.

**Dificultad: lo siguiente, no lo ideal.** El salto correcto es el que puede dar hoy fallando a
veces. Un ejercicio que acierta entero no enseñó nada; uno que falla entero desmotiva.

## Cuánto generar

El siguiente tramo, no el curso. Como guía: **entre 5 y 10 ejercicios**, que cubren una semana o
dos de huecos irregulares.

Generar tres meses de currículo garantiza que la mitad esté mal calibrada cuando llegue, porque se
diseñó contra un nivel que ya cambió.

## Distribución por duración

Los huecos reales no son de 45 minutos. Al generar un tramo, respetar aproximadamente:

| Duración | Proporción | Para qué |
|---|---|---|
| 5 min | 40% | El hueco típico. Un ítem, una producción corta |
| 10-15 min | 40% | Sesión normal |
| 25-30 min | 20% | Simulacro, conversación sostenida |

Y de todos ellos, **al menos la mitad sin la condición más restrictiva del dominio**: sin voz si
la restricción es no poder hablar, sin herramientas si es no tener el taller a mano, sin otra
persona si es practicar solo.

Un tramo que ignora eso se consume a medias: el aprendiz abre la app en el hueco que de verdad
tiene y no hay nada que pueda hacer ahí.
