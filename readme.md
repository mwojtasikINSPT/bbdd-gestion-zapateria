# 👟 Sistema de Gestión de Zapatería

**Proyecto final — Estructura y Base de Datos**  
**Comisión 2.603 · 2026**

## 👥 Integrantes

- Milagros Figueroa
- Miguel Pereyra
- Marcela Wojtasik

## 👨‍🏫 Profesor Titular
- Lic. Jonathan Pécora

## 🎓 Ayudante de cátedra
- Juan Capia


## 📌 Descripción

Base de datos transaccional desarrollada en **MySQL 8** para gestionar las operaciones de una zapatería.

Permite administrar productos, categorías, talles, stock, usuarios, proveedores, compras, ventas y pagos. Incluye controles de integridad, actualización automática del stock y consultas para el análisis del negocio.

## ⚙️ Características

- Gestión de productos y stock por talle.
- Registro de compras, ventas y pagos.
- Claves primarias y foráneas.
- Restricciones `UNIQUE`, `CHECK` y `NOT NULL`.
- Triggers para actualizar y controlar el stock.
- Índices para optimizar el acceso a los datos.
- Consultas comerciales, operativas y gerenciales.
- Validaciones de integridad y consistencia.

## 📂 Scripts

| Archivo | Contenido |
|---|---|
| `01_Estructura.sql` | Base de datos, tablas y claves primarias. |
| `02_Restricciones.sql` | Constraints, claves foráneas, índices y triggers. |
| `03_Inserts.sql` | Categorías, productos, talles y stock inicial. |
| `04_Datos_Operaciones.sql` | Usuarios, proveedores, compras, ventas y pagos. |
| `05_Consultas_Negocio.sql` | Consultas de inventario, facturación y rendimiento. |
| `06_Consultas_Validacion.sql` | Controles de integridad y consistencia. |
| `Script_Completo.sql` | Estructura, restricciones y datos maestros unificados. |

## ▶️ Ejecución

Opción recomendada:

```text
1. Script_Completo.sql
2. 04_Datos_Operaciones.sql
3. 05_Consultas_Negocio.sql
4. 06_Consultas_Validacion.sql
```

> ⚠️ `Script_Completo.sql` elimina y vuelve a crear la base `gestion_zapateria`.

## 📊 Datos de prueba

- 100 compras a proveedores.
- 400 ventas entre cuatro vendedores.
- Ventas con uno o varios productos.
- Diferentes categorías y talles.
- Estacionalidad y fechas comerciales especiales.
- Descuentos en efectivo durante fines de semana.
- 30 pagos a proveedores.

## 🔎 Análisis disponible

Las consultas permiten conocer:

- Stock total y stock crítico.
- Productos y talles más vendidos.
- Ventas y facturación por período.
- Rendimiento de los vendedores.
- Rentabilidad estimada.
- Estado de cuenta y deuda con proveedores.

## 🛠️ Tecnologías

- MySQL 8.0.16 o superior.
- SQL.
- Visual Studio Code.
- MySQL Workbench.

---

> Los datos utilizados son ficticios y fueron creados exclusivamente con fines académicos.