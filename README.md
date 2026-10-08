# Análisis RFM de Clientes - SQL + Python + Power BI

## ¿Qué problema resolví?
Segmenté los 1802 clientes de una empresa para identificar quiénes son los más valiosos (VIP), quiénes están en riesgo de abandonar y quiénes ya se perdieron. Esto permite tomar decisiones de marketing y retención basadas en datos.

## ¿Qué hice?
1. **SQL:** Escribí consultas para extraer y agregar datos de ventas por región, producto, categoría y cliente.
2. **Python:** Calculé las métricas RFM (Recencia, Frecuencia, Monetario) y clasifiqué a los clientes en 5 segmentos.
3. **Power BI:** Creé un dashboard interactivo con KPIs, tabla de clientes VIP y gráfico de segmentos.

## ¿Qué encontré?
- **1802 clientes** en total.
- **150 clientes VIP** (8.3%): los más valiosos, compran seguido y gastan mucho.
- **210 clientes en riesgo** (11.7%): solían comprar mucho pero llevan tiempo sin hacerlo.
- **102 clientes nuevos** (5.7%): acaban de comprar por primera vez.
- **880 clientes regulares** (48.8%): el grupo más grande.
- **460 clientes perdidos** (25.5%): hace mucho que no compran.

## ¿Qué recomendaría?
- **Programa VIP:** Ofrecer beneficios exclusivos a los 150 clientes VIP para retenerlos.
- **Campaña de reactivación:** Enviar ofertas especiales a los 210 clientes "En riesgo".
- **Onboarding para nuevos:** Secuencia de emails para los 102 clientes "Nuevo".
- **Análisis de pérdida:** Investigar por qué 460 clientes se perdieron.

## Herramientas usadas
- **SQL** (SQLite): Extracción y agregación de datos.
- **Python** (pandas): Análisis RFM y segmentación.
- **Power BI:** Dashboard interactivo.

## Archivos del proyecto
- `sales_sample.csv`: Datos originales de ventas.
- `consultas.sql`: Consultas SQL usadas en el análisis.
- `analisis_rfm.ipynb`: Notebook de Python con el análisis RFM.
- `rfm_segmentos.csv`: Resultado del análisis (1802 clientes con sus segmentos).
- `dashboard_clientes.pbix`: Archivo de Power BI.
- `dashboard_clientes.png`: Captura del dashboard.
