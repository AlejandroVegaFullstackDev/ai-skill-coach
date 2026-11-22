# progress/

Aquí vive el estado del aprendizaje, **un tracker por perfil**. Ignorado por git.

```
progress/
  <perfil>/tracker.json
  archived/<perfil>/
```

Un perfil es una persona aprendiendo una habilidad. Se gestionan con `/profile`.

Es la memoria del sistema. Es lo que hace que el agente no te vuelva a explicar algo que ya
dominas, y lo que permite que una sesión se sienta continua en vez de empezar de cero.

También es un mapa detallado de tus debilidades, con frases textuales tuyas. Por eso no se publica.

---

## El fichero

Lo crea `/assess`. Estructura en `tracker.example.json`, en esta misma carpeta — el ejemplo es
de mecánica, para dejar claro que el sistema no es de idiomas.

| Campo | Qué es |
|---|---|
| `schema_version` | Versión del esquema. Permite migrar sin adivinar |
| `baseline` | Nivel medido, con fecha y **evidencia**. Sin evidencia la entrada no vale |
| `items[]` | Un objeto por unidad que se puede dominar |
| `sessions[]` | Historial. **Append, nunca overwrite** |
| `mastered_archive[]` | Lo superado. Se conserva: es la parte que se siente como progreso |

### Un ítem

```json
{
  "id": "present-perfect-continuous",
  "state": "practiced",
  "first_seen": "2026-09-22",
  "last_seen": "2026-09-28",
  "fail_count": 3,
  "correct_streak": 0,
  "evidence": ["I have 3 years working here"],
  "review_stage": null,
  "due": null
}
```

`evidence` guarda **frases literales**. "Falló en present perfect" no permite volver a ello; la
frase exacta sí.

---

## Los cuatro estados

`unseen` → `taught` → `practiced` → `mastered`

Para llegar a `mastered` hace falta producción correcta y espontánea **dos veces en sesiones
distintas**. Una vez justo después de la explicación mide memoria a corto plazo.

Un `mastered` solo baja si falla, y **el fallo se registra con la frase**. Degradar sin evidencia
escrita está prohibido.

---

## Repaso

`review_stage` y `due` implementan los intervalos fijos de
`.claude/skills/skill-coach/07-spaced-repetition.md`:

```
2 dias -> 7 -> 21 -> 60 -> archivado
```

---

## Reglas de escritura

- **Atómica:** escribir a `tracker.json.tmp` y renombrar. Nunca sobrescribir en sitio.
- **Validar al leer.** Un fichero editado a mano es entrada externa.
- **Append** en `sessions` y en `mastered_archive`.

Se corrompe una vez y se pierde el progreso de ese perfil. No está en git: el único respaldo es
el que haga `/reset` antes de borrar.

---

## Respaldo

No se versiona, ni en un repositorio privado: un fork, un cambio de visibilidad o un push al
remoto equivocado lo publica entero. Si quieres historial, copia `progress/<perfil>/` a un
sitio fuera del repositorio (disco, nube personal).
