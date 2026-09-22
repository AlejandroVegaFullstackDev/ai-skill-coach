# /add-domain — Generar el paquete de una habilidad

Crea `.claude/skills/<habilidad>-coach/SKILL.md` para la habilidad que le digas. Es lo que hace
que el motor sirva para mecánica, negocios o hablar en público y no solo para el ejemplo que
viene de fábrica.

```
/add-domain mecanica de motos
/add-domain negociacion comercial
/add-domain hablar en publico
/add-domain                       <- pregunta
```

Sigue `.claude/skills/skill-coach/08-domain-packs.md`. **Léelo antes de empezar.**

---

## Paso 1: Acotar

Una habilidad demasiado ancha produce un paquete inútil. "Programación" no; "depurar sistemas
concurrentes en Python" sí.

Si lo que pide es ancho, repreguntar con opciones concretas en vez de pedirle que lo acote él:

> "Mecánica" es mucho. ¿Cuál de estas se parece más a lo que quieres?
> - Mantenimiento básico de tu propia moto
> - Diagnóstico de averías por síntoma
> - Trabajo de taller a nivel profesional
>
> O dime tú cuál es la situación concreta que quieres poder resolver.

Y la pregunta que ordena todo lo demás: **¿en qué situación concreta vas a usar esto?** Sin ella
el paquete sale genérico y el currículo se dispersa.

---

## Paso 2: De dónde viene el aprendiz

Determina la mitad del paquete: los errores típicos **no son universales**, dependen de dónde
viene quien aprende.

- Un hispanohablante y un alemán fallan cosas distintas del inglés.
- Alguien que llega a la programación desde el autodidactismo y alguien que llega desde la
  universidad fallan cosas opuestas.
- Un mecánico que aprendió mirando a su padre tiene huecos distintos a uno que salió de un curso.

Leer `01-learner-profile.md`. Si no dice de dónde viene, preguntarlo.

---

## Paso 3: Investigar

**No escribir el paquete de memoria.** Es exactamente lo que este repo evita.

Buscar, con la tabla de calidad de `source-harvester/SKILL.md`:

- **Dónde se atasca la gente**, no el temario. Foros de practicantes, comunidades, subreddits de
  oficio, respuestas de gente que enseña esto. Suele estar mejor documentado en un foro que en un
  manual.
- **Errores típicos del perfil de partida concreto.**
- **Cómo se practica de verdad**: qué hace falta, cuánto cuesta montar, si hay ruta sin
  equipamiento.
- **Si hay escala o certificación reconocida, y qué mide.** Muchas miden conocimiento y se leen
  como si midieran ejecución.

Verificar antes de citar. Dos fuentes que coincidan, o se marca la afirmación como no confirmada.

Si hay material en `sources/`, tiene prioridad.

---

## Paso 4: Las siete preguntas

Escribir el paquete respondiéndolas, con la plantilla de `08-domain-packs.md`:

1. ¿Cuál es el salto real? (dónde se atasca la gente, no el temario)
2. ¿Qué errores comete alguien que viene de donde viene este aprendiz?
3. ¿Cómo se practica esto de verdad?
4. ¿Cuál es el formato de mayor valor?
5. ¿Hay escala externa, y qué mide?
6. **¿Cómo se representa sin ambigüedad?** — la notación ASCII del dominio. Ver `09-notacion.md`
7. **¿Con qué se verifica?** — el kit, y qué queda fuera. Ver `10-kit-de-verificacion.md`

Para la 6, buscar **la notación que usa la gente que hace esto**, no inventarse una. Casi todos
los oficios tienen la suya: diagramas de acordes, esquemas eléctricos, pinouts, patrones de
corte, notación de ajedrez. Renderizarla en ASCII puro y dejar un ejemplo en el paquete.

Para la 7, proponer el nivel **más barato** que funcione. El nivel 0 —que el aprendiz reproduzca
la notación antes de ejecutar— aplica siempre y es gratis.

**Si no puedes responder una con evidencia, escríbelo así en el paquete**, marcado como hueco. Un
paquete honesto con tres de cinco sirve; uno que inventa las cinco hace daño durante meses.

---

## Paso 5: La pregunta incómoda

Antes de cerrar: **¿cómo sabrá el aprendiz que lo hizo bien?**

No vale responder "no se puede" y seguir. Eso es la salida cómoda. Hay que buscar **lo más barato
que lo convierta en comprobable**, con los cinco niveles de `10-kit-de-verificacion.md`.

Y lo que quede fuera, decirlo con lo que haría falta para cubrirlo:

> Para [habilidad] puedo darte [lo que sí]. Lo que no puedo es [lo que no], y para eso hace falta
> [grabarte / alguien delante / medir con X].
>
> Si esto va en serio, en algún momento necesitas a esa persona. El sistema sirve para llegar a
> ella sabiendo más, no para sustituirla.

Una habilidad física sin verificación produce práctica confiada y equivocada, que es peor que no
practicar. Y un mal hábito motor se automatiza: desaprenderlo cuesta más que aprenderlo bien la
primera vez.

---

## Paso 6: Registrar y encaminar

- Escribir `.claude/skills/<habilidad>-coach/SKILL.md`.
- Añadir `Skill(<habilidad>-coach)` a `.claude/settings.json`.
- Actualizar la habilidad en `private/<perfil>/profile.md` si hacía falta. **No tocar
  `CLAUDE.md`**: no contiene datos de nadie.
- Si el aprendiz cambia de habilidad, eso es **un perfil nuevo**, no un tracker sobrescrito.
  Mandarlo a `/profile new`.

Verificar la checklist de `CLAUDE.md` y cerrar:

> Paquete creado. Lo que no pude confirmar: [lista].
>
> Siguiente: `/assess` para la línea base. Si tienes material (manuales, apuntes, un curso),
> déjalo en `sources/` y corre `/harvest` antes.

---

## Mejorarlo después

El paquete inicial es una hipótesis. Los errores reales del aprendiz salen de las sesiones.

Cuando `/log` o `/learn` revelen un patrón que la tabla no tenía, **añadirlo al paquete**, no solo
al tracker. El paquete es lo que se comparte; el tracker es de una persona.
