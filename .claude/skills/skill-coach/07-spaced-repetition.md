# 07 — Cuándo vuelve un ítem

## El problema

Sin repaso programado, un ítem `mastered` se olvida y reaparece como error nuevo seis semanas
después. Con repaso mal calibrado, el sistema se llena de repasos y no queda hueco para avanzar.

## El algoritmo

Intervalos fijos crecientes. **No SM-2, no FSRS.**

```
1er repaso:   2 dias despues de pasar a mastered
2o repaso:    7 dias
3er repaso:  21 dias
4o repaso:   60 dias
despues:    archivado — solo vuelve si falla en uso real
```

Si falla un repaso: el ítem baja a `practiced` y el contador vuelve a cero.

### Por qué fijo y no adaptativo

Los algoritmos adaptativos necesitan una señal limpia de acierto/fallo por tarjeta, muchas
repeticiones y sesiones regulares. Aquí no hay nada de eso: las sesiones son irregulares, los ítems
son estructuras gramaticales que se producen parcialmente bien, y el juicio de "acertó" lo emite un
modelo, no un botón.

Un algoritmo sofisticado alimentado con señal sucia da precisión falsa. Los intervalos fijos son
peores en teoría y funcionan igual en la práctica cuando el volumen es de decenas de ítems, no de
miles.

**Esto se puede cambiar más adelante**, cuando haya suficiente historial real para medir si los
intervalos fallan. Antes de eso sería optimizar a ciegas.

## Presupuesto de repaso

**Máximo 30% de la sesión.** Si hay más repasos vencidos de los que caben:

1. Primero los que llevan más tiempo vencidos.
2. Luego los que ya fallaron alguna vez.
3. El resto se queda vencido y se arrastra. **No se descarta silenciosamente.**

Si la deuda de repaso supera los 15 ítems, decírselo: significa que hay demasiado material abierto
y toca parar de añadir hasta consolidar.

## Repaso implícito

Un ítem que aparece correctamente en una sesión normal cuenta como repaso aprobado, aunque no
estuviera programado. Se actualiza su fecha y se pasa al siguiente intervalo.

Esto importa: si practica una conversación y usa bien el present perfect tres veces, no tiene
sentido hacerle un ejercicio de present perfect al día siguiente. **Uso real vale más que repaso
programado**, y el sistema tiene que reconocerlo o se vuelve burocracia.

## Lo que no se repasa

- Ítems `taught` o `practiced`: esos no se repasan, se practican. El repaso es para lo consolidado.
- Vocabulario suelto. Una palabra que no aparece en uso real durante meses no hacía falta. El
  repaso se reserva para estructuras productivas.
