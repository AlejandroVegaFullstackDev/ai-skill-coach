# ejercicios/

Los ejercicios, **una carpeta por perfil**. Los escribe `/plan`, los sirve `/learn`.

```
ejercicios/<perfil>/<id>.md
```

Van por perfil y no por habilidad porque se generan contra un nivel concreto: dos personas
aprendiendo lo mismo necesitan ejercicios distintos.

**El contenido está ignorado por git** porque se genera contra el nivel de una persona concreta.
Si quieres versionar el tuyo, quita `ejercicios/*` de `.gitignore`.

---

## Por qué están pre-generados

Es lo que hace que `/learn` sea instantáneo y gratis. El trabajo caro —buscar material, decidir
qué toca, redactar— pasa en `/plan`, cada pocos días. La sesión solo lee un fichero que ya existe.

La IA trabaja **entre sesiones**, no durante. Ese es todo el truco del coste cero.

---

## Anatomía

`ejercicios/<perfil>/<id>.md`, con frontmatter:

```markdown
---
id: en-present-perfect-duration-01
skill: english
items: [present-perfect-continuous, duration-for-since]
level: B1-B2
minutes: 8
needs_voice: false
needs_keyboard: true
requires_mastered: [present-simple, past-simple]
sources: [knowledge/en-grammar-perfect-aspect.md]
mode: production
---
```

El frontmatter es lo que permite responder a *"tengo 7 minutos y no puedo hablar"*: elegir es
filtrar por metadatos, no improvisar.

| Campo | Por qué importa |
|---|---|
| `minutes` | Medido, no aspiracional. Uno que dice 5 y dura 12 rompe la confianza en el sistema |
| `needs_voice` | Determina si sirve en público. **La mitad de los huecos reales son ahí** |
| `requires_mastered` | Evita construir sobre arena |
| `sources` | **Nunca vacío.** Vacío significa que el agente se lo inventó |
| `mode` | `production` o `reception`. Mínimo 2 de producción por cada 1 de reconocimiento |

---

## Lo que no lleva un ejercicio

**Solucionario.** Si trae la respuesta, el aprendiz la lee y cree que la sabía. La corrección la
da el agente después de que produzca.

**Contenido genérico.** Nada de "John goes to the supermarket". Las frases describen el trabajo
real del aprendiz: entrena la habilidad y ensaya la situación objetivo a la vez.

**Más de un objetivo.** Si entrena cuatro ítems, no entrena ninguno.

---

## Cuánto hay que tener

Entre 5 y 10 sin usar. Si hay más, no falta currículo: falta practicar, y `/plan` lo dice y para.

Generar tres meses de golpe garantiza que la mitad esté mal calibrada cuando llegue, porque se
diseñó contra un nivel que ya cambió.
