# /review — Repasar lo vencido

Saca del tracker los ítems `mastered` con fecha de repaso vencida. Sin material nuevo. Rápido por
diseño.

```
/review
/review 5 minutos
```

---

## Paso 1: Qué está vencido

Leer `progress/<perfil>/tracker.json`. Seleccionar ítems con `state: mastered` y `due <= hoy`.

Si no hay ninguno, decirlo y parar:

> No hay nada vencido. Lo siguiente que toca repasar es [item] el [fecha]. ¿Hacemos `/learn`?

No inventar un repaso para que el comando haga algo.

---

## Paso 2: Presupuesto

**Máximo 30% del tiempo disponible.** Si hay más vencidos de los que caben, ordenar por:

1. Los que llevan más tiempo vencidos
2. Los que ya fallaron algún repaso antes

El resto **se arrastra visiblemente**, no se descarta en silencio:

> Quedan 4 repasos pendientes para la próxima.

Si la deuda supera los 15 ítems, decirlo claro: hay demasiado material abierto y toca parar de
añadir hasta consolidar. `/plan` debería generar menos en el siguiente tramo.

---

## Paso 3: El repaso

Una producción por ítem. Corta y sin explicación previa: lo que se mide es si sigue ahí.

**No re-explicar la regla antes.** Eso convierte el repaso en una clase y falsea el resultado.
Si falla, entonces sí se explica.

---

## Paso 4: Resultado

```
## Repaso — [fecha]

Aprobados: [items]     -> siguiente intervalo
Fallados:  [items]     -> vuelven a practiced, con la frase que lo evidencia

Pendientes para la próxima: N
```

- **Aprobado:** avanza al siguiente intervalo (2 → 7 → 21 → 60 días → archivado).
- **Fallado:** baja a `practiced`, `review_stage` a cero, y se registra la frase exacta. Sin
  frase, no se degrada.

Escritura atómica al tracker.

---

## Repaso implícito

Si un ítem programado aparece bien usado dentro de una sesión de `/learn` normal, eso **cuenta como
repaso aprobado** y `/learn` ya lo actualiza. No hace falta repetirlo aquí.

Uso real vale más que repaso programado. Si el sistema no lo reconoce, se vuelve burocracia y el
aprendiz deja de correrlo.
