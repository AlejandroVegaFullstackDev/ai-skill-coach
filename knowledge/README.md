# knowledge/

Material destilado, **agrupado por habilidad**. Lo escribe `/harvest` leyendo `sources/` y
buscando en la web. Lo lee `/plan` para generar ejercicios.

```
knowledge/<habilidad>/<tema>.md
```

Por habilidad y no por perfil: las fichas describen la materia, no a la persona. Si dos perfiles
entrenan lo mismo, comparten el material y `/harvest` no se corre dos veces.

**El contenido está ignorado por git** porque se genera contra el nivel y el objetivo de una
persona concreta. Si quieres versionar el tuyo, quita `knowledge/*` de `.gitignore`.

---

## Por qué existe esta capa

Sin ella, `/plan` genera ejercicios de memoria: plausibles, genéricos y sin nada detrás. Con ella,
cada ejercicio cita la ficha que lo sustenta, y la ficha cita su fuente.

**Un ejercicio con el campo `sources` vacío no se acepta.** Ese es el mecanismo que fuerza a pasar
por aquí.

---

## Formato de una ficha

Una por concepto.

```markdown
---
id: en-grammar-perfect-aspect
skill: english
topic: present perfect y present perfect continuous
level: B1-B2
confidence: alta
sources:
  - type: pdf
    ref: sources/pdf/cambridge-grammar-in-use.pdf
    locator: "unidades 7-11"
  - type: web
    ref: https://ejemplo.org/perfect-aspect
    retrieved: 2026-09-22
conflicts: []
---

## La regla
## Ejemplos que sirven para este aprendiz
## Errores tipicos desde el espanol
## Que ejercicio sale de aqui
```

| Campo | Regla |
|---|---|
| `confidence` | `alta`: dos fuentes independientes coinciden · `media`: una fuente buena · `baja`: una dudosa sin confirmar |
| `sources` | Siempre con `locator`. "Está en el libro" no permite comprobarlo |
| `conflicts` | Si dos fuentes se contradicen, se registra. No se elige la que suene mejor |

---

## Las tres reglas de una ficha

1. **Reformular, no copiar.** Una ficha es la regla escrita para poder generar ejercicios, no un
   extracto. Copiar párrafos largos de material con derechos no se hace.
2. **Ejemplos adaptados al aprendiz.** Los del libro se sustituyen por su trabajo real.
3. **La última sección es la que importa.** "Qué ejercicio sale de aquí" es lo que lee `/plan`.
   Una ficha sin eso es un resumen bonito que no produce nada.

---

## Cobertura

`/harvest` reporta al terminar qué ítems del tracker no tienen ficha. Los que **fallan y no tienen
ficha** son la prioridad: son errores reales sin material para atacarlos.
