# Análisis de Inventario: Modelo de Clasificación ABC con SQL

Este proyecto presenta el diseño y la ejecución de un **Modelo de Clasificación ABC** implementado en **PostgreSQL** sobre un dataset de retail con **27,555 SKUs**. El objetivo es identificar la contribución económica de cada producto al valor total del inventario siguiendo el Principio de Pareto, cruzando los resultados con métricas de calidad (ratings) y riesgos de sobrestock para optimizar la toma de decisiones logísticas.

## Tecnologías y Datos Utilizados
* **Motor de Base de Datos:** PostgreSQL
* **Técnicas SQL Aplicadas:** Funciones de ventana (`SUM() OVER`, `CUME_DIST`), ordenamiento avanzado, agregaciones y uniones de tablas.
* **Dataset:** `Inventory_BigBasket_Products.csv` (27,555 registros analizados).

---

## Validación del Modelo Pareto (Análisis ABC)

El modelo se construyó utilizando funciones de ventana para calcular el valor acumulado y clasificar cada SKU según su impacto económico:

| Clase | Significado | N° Productos | Valor Total (COP) | % del Valor |
| :---: | :--- | :---: | :---: | :---: |
| **A** | Inversión Alta | 10,290 | $1,939,940,232 | ~80% |
| **B** | Inversión Media | 8,389 | $363,733,414 | ~15% |
| **C** | Inversión Baja | 8,876 | $121,131,400 | ~5% |

> **Hallazgo Clave:** La Clase A concentra el 80% del valor pero representa el 37% de los productos. Esto refleja un comportamiento real de retail donde coexisten productos de lujo (precios altos) con consumo masivo de bajo costo, amplificando la dispersión del valor. Junto a la Clase B, representan el **95% del valor total**.

---

## Categorías Dominantes e Impacto Operativo

Al agrupar la clasificación por categorías del catálogo, se identificaron los líderes de cada segmento:

* **Clase A y B (Dominante):** *Beauty & Hygiene* lidera ambas categorías con la mayor concentración de productos y valor de inversión ($1,939M y $363M respectivamente).
* **Clase C (Dominante):** *Gourmet & World Food* lidera la inversión baja (8,876 productos, $121M), consistente con un alto volumen de catálogo pero bajo costo unitario.

---

## Análisis de Riesgos Cruzados

### A. Riesgo de Calidad (Rating Promedio)
Se analizó la percepción del cliente por categoría para mitigar riesgos en productos de alto valor:
* **Mayor Calidad:** *Foodgrains, Oil & Masala* (4.06) y *Baby Care* (4.02).
* **Zona de Alerta:** *Kitchen, Garden & Pets* presenta el rating más bajo (**3.73**). Al tener una fuerte presencia en la Clase A, cualquier problema de calidad aquí impacta directamente el valor económico del inventario.

### Riesgo de Sobrestock (Capital Inmovilizado)
Se filtraron los productos cuyo stock supera **1.5 veces el promedio general** del inventario:

| Categoría | Productos en Sobrestock | Status |
| :--- | :---: | :--- |
| **Beauty & Hygiene** | **2,763** | *Alerta Crítica* |
| Snacks & Branded Foods | 827 | *Atención* |
| Beverages | 459 | *Moderado* |
| Cleaning & Household | 45 | *Estable* |
| Kitchen, Garden & Pets | 45 | *Estable* |

---

## Conclusiones y Recomendaciones

El modelo establece una jerarquía clara para el equipo de compras y operaciones:

1. **Beauty & Hygiene (Prioridad Alta):** Es el motor de valor (Clases A y B) pero también el mayor riesgo financiero con **2,763 SKUs en sobrestock**. Se recomienda revisar de inmediato las políticas de reposición y renegociar la frecuencia de pedidos con proveedores.
2. **Kitchen, Garden & Pets (Enfoque en Calidad):** Auditar la calidad de los productos y abrir canales de retroalimentación con clientes. Su bajo rating (3.73) afecta a productos de alta inversión (Clase A).
3. **Cleaning & Household (Mantener):** Categoría estable, con bajo riesgo de sobrestock y excelente percepción de calidad.
4. **Gourmet & World Food (Control Flexible):** Al pertenecer mayormente a la Clase C, no requiere un control estricto de inversión; mantener revisiones esporádicas.
