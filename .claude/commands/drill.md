# /drill — Atacar una debilidad concreta

Rápido y repetitivo, sobre un solo punto. Para cuando el aprendiz ya sabe qué le falla y quiere
machacarlo, o cuando un ítem lleva semanas sin moverse.

```
/drill present perfect
/drill pronunciacion
/drill                     <- elige el item mas fallado
```

---

## Paso 1: Elegir el objetivo

Con argumento: ese ítem. Si no existe en el tracker, crearlo como `unseen` y decirlo.

Sin argumento: el ítem con mayor `fail_count` que no esté `mastered`. Nombrarlo y explicar por qué
en una línea: *"este se te ha ido 5 veces desde el 22 de septiembre"*.

---

## Paso 2: La forma del drill

Ni explicación larga ni conversación. **Repetición con variación.**

1. La regla, en tres líneas como mucho. Si hace falta más, no es un drill: es `/learn`.
2. **Entre 6 y 10 producciones cortas**, todas del mismo ítem, con contexto distinto cada vez.
3. Corrección **inmediata** tras cada una. Aquí sí se interrumpe: el drill entrena automatismo, y
   el automatismo necesita señal rápida.
4. Las tres últimas, sin andamiaje ninguno.

Esta es la única excepción a "no corregir durante". En `/learn` se entrena sostener el discurso; en
`/drill` se entrena el reflejo.

**Contenido de su trabajo real**, como siempre.

---

## Drills específicos del dominio

El paquete de dominio puede definir formatos propios. Para inglés, en `english-coach/SKILL.md`:

- **Frases de rescate:** se le da una situación en inglés, produce la frase. Tienen que ser
  automáticas, no recordadas.
- **Pronunciación:** lista técnica y la vocal epentética ante grupos con *s-*. Ver `VOICE.md` si
  hay grabación.

---

## Paso 3: Cerrar

```
## Drill: [item]

Producciones: N
Correctas sin ayuda: N
Las que fallaron: [las frases exactas]

Patrón: [que tienen en comun los fallos, si lo hay]
```

El patrón es lo valioso. Si las cuatro que falló eran todas en negativo, eso es un ítem distinto y
más pequeño, y se crea como tal en el tracker.

---

## Paso 4: Estado

Actualizar el tracker igual que `/learn`. Un drill **no puede llevar un ítem a `mastered`**:
producir bien diez veces seguidas justo después de la explicación mide memoria a corto plazo. El
ascenso necesita producción espontánea en una sesión distinta.

Sí puede subir `taught` → `practiced`.
