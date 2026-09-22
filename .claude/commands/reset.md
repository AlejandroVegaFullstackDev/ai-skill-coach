# /reset — Empezar de cero

Borra datos. **Todo lo que hace este comando es irreversible**, así que nada se ejecuta sin
confirmación explícita y sin haber mostrado antes exactamente qué desaparece.

```
/reset progress     el tracker: niveles, items, historial
/reset ejercicios   los ejercicios generados
/reset knowledge    las fichas destiladas
/reset profile      el perfil del aprendiz
/reset all          todo lo anterior
/reset              pregunta
```

---

## Paso 1: Mostrar qué se pierde

Antes de nada, leer lo que se va a borrar y **enseñar el tamaño real del daño**:

```
## /reset progress

Se borra progress/<perfil>/tracker.json:

  Linea base:     B1, medida el 2026-09-22
  Items:          23   (7 mastered, 9 practiced, 4 taught, 3 unseen)
  Sesiones:       14 registradas desde el 2026-09-22
  Archivados:     5 items superados

Esto NO se puede deshacer. El tracker no esta en git.

Escribe "borrar progress" para confirmar.
```

El conteo de sesiones y de ítems dominados no es decoración: es lo que hace que el usuario se dé
cuenta de lo que está a punto de tirar.

---

## Paso 2: Confirmación literal

Exigir que escriba la frase exacta: `borrar <objetivo>`.

Nada de "sí", "ok" o "dale". Un sí distraído borra meses de progreso.

Si escribe otra cosa, **no interpretar la intención**: repetir qué frase hace falta.

---

## Paso 3: Respaldo antes de borrar

Salvo que el usuario pida explícitamente que no:

- `progress/<perfil>/tracker.json` → `progress/tracker.backup-<fecha>.json`
- `private/<perfil>/profile.md` → `private/profile.backup-<fecha>.md`

Ambas carpetas están fuera de git, así que el respaldo es la única red que hay. Decir dónde quedó.

---

## Paso 4: Borrar

| Objetivo | Qué se borra | Qué se conserva |
|---|---|---|
| `progress` | `progress/<perfil>/tracker.json` | Currículo, fichas, perfil |
| `ejercicios` | `ejercicios/**/*.md` | El tracker, con sus ítems intactos |
| `knowledge` | `knowledge/*.md` | `sources/` — el material crudo **nunca se toca** |
| `profile` | `private/<perfil>/profile.md`, secciones de perfil en `01-`, `02-` y `CLAUDE.md` | El progreso |
| `all` | Los cuatro | `sources/`, los `SKILL.md`, los comandos |

**`sources/` no se borra nunca.** Es material que el usuario aportó, a veces con esfuerzo. Si lo
quiere fuera, lo borra él.

Los `SKILL.md` y los comandos tampoco: son el motor, no datos.

---

## Paso 5: Qué queda

Decir el estado resultante y el siguiente paso:

> Borrado el progreso. El currículo y las fichas siguen ahí. Respaldo en
> `progress/tracker.backup-2026-09-22.json`.
>
> Para volver a empezar: `/assess`.

---

## Cuándo no se usa

Si el usuario quiere **cambiar de habilidad**, esto no es lo que necesita. El tracker es por
habilidad: se archiva el actual y se empieza otro, sin borrar nada. Ofrecer eso en su lugar.
