# /plan — Generar el siguiente tramo de currículo

Lee el progreso, lee `knowledge/<habilidad>/`, y escribe entre 5 y 10 ejercicios nuevos en `ejercicios/<perfil>/`.

Este es el comando que hace que `/learn` sea instantáneo y gratis: el trabajo caro pasa aquí, cada
pocos días, no en cada sesión.

---

## Paso 1: Leer el estado

En paralelo:

- `progress/<perfil>/tracker.json` — ítems, estados, fallos, fechas de repaso
- `Glob ejercicios/<perfil>/**/*.md` — qué ejercicios ya existen y cuáles no se han usado
- `Glob knowledge/<habilidad>/*.md` — con qué material se puede construir
- `01-learner-profile.md`, `04-diseno-de-ejercicios.md`, el paquete de dominio

**Si `knowledge/<habilidad>/` está vacío, parar.** Generar ejercicios sin fichas es inventárselos, que es lo
que este diseño evita. Mandar a `/harvest`.

**Si hay más de 10 ejercicios sin usar**, parar también: no falta currículo, falta practicar.
Decirlo y mandar a `/learn`.

---

## Paso 2: Decidir qué toca

Prioridad, de arriba abajo:

1. **Ítems `practiced` que fallaron en las últimas 3 sesiones.** Deuda cara: ya se explicaron y
   siguen sin salir.
2. **Ítems `taught` sin producir.** Convertir explicación en producción es donde está el avance.
3. **Ítems `unseen` con ficha disponible.** Como mucho **dos por tramo**.

Los repasos no se generan como ejercicios: los saca `/review` del tracker directamente.

Si un ítem lleva tres tramos seguidos en la lista sin moverse, **cambiar el enfoque**, no repetir
el mismo tipo de ejercicio. Si tres ejercicios de present perfect no lo arreglaron, el cuarto
tampoco. Probar otro ángulo: producción oral en vez de escrita, contraste explícito con el
español, uso dentro de una tarea real.

---

## Paso 3: Distribuir

Respetar la mezcla de `04-diseno-de-ejercicios.md`:

| Duración | Proporción |
|---|---|
| 5 min | 40% |
| 10-15 min | 40% |
| 25-30 min | 20% |

Y **al menos la mitad con `needs_voice: false`**. La mitad de los huecos del aprendiz son en
sitios donde no puede hablar; un tramo que ignora eso se consume a medias.

Mínimo dos ejercicios de producción por cada uno de reconocimiento.

---

## Paso 4: Escribir

Un fichero por ejercicio en `ejercicios/<perfil>/<id>.md`, con el frontmatter completo de
`04-diseno-de-ejercicios.md`.

Reglas duras:

- **`sources` nunca vacío.** Cada ejercicio cita las fichas de `knowledge/<habilidad>/` que lo sustentan. Sin
  eso no se escribe el fichero.
- **Contenido del trabajo real del aprendiz.** Nada de "John goes to the supermarket".
- **Sin solucionario.** La corrección la da el agente después de que produzca.
- **`id` único y estable**, nunca reutilizado.
- **`minutes` medido, no aspiracional.** Si dudas, redondea hacia arriba. Un ejercicio que dice 5
  y dura 12 rompe la confianza en todo el sistema.

Crear en el tracker como `unseen` cualquier ítem nuevo que aparezca.

---

## Paso 5: El plan, en una pantalla

Terminar con algo que se lee en diez segundos:

```
## Tramo generado — [fecha]

Ejercicios: N   (M sin voz, K con voz)
Cubre:      [items, agrupados por prioridad]

Lo que ataca primero:
  1. [item] — falló 4 veces. Enfoque nuevo: [cual y por que]
  2. [item] — explicado, nunca producido

Nuevo este tramo: [1-2 items]

Sigue sin cubrirse: [items sin ficha en knowledge/]  -> /harvest
```

Sin calendario. **No proponer "30 minutos diarios".** El aprendiz tiene huecos irregulares; un plan
que asume constancia se rompe el primer día malo y el fallo desmotiva más que no haber empezado.

Verificar la checklist de `CLAUDE.md`.

---

## Cada cuánto

Cada 2-3 días de uso, o cuando queden menos de 3 ejercicios sin usar.

Generar tres meses de currículo garantiza que la mitad esté mal calibrada cuando llegue: se diseñó
contra un nivel que ya cambió.
