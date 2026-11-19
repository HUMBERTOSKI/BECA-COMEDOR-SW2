
# SDCC-16 - Requisitos de acceso y permisos

## Historia de usuario
SDCC-13: Gestionar el acceso del personal autorizado.

## Objetivo
Definir los roles y permisos de los usuarios
del Sistema de Control de Comensales UABJB.

## Roles identificados

### 1. Administrador
- Iniciar y cerrar sesión.
- Registrar estudiantes becarios.
- Consultar y actualizar becarios.
- Generar credenciales QR.
- Consultar reportes administrativos.

### 2. Recepcionista
- Iniciar y cerrar sesión.
- Escanear QR de estudiantes en recepción.
- Consultar los datos necesarios del estudiante.
- Autorizar el servicio correspondiente.

### 3. Personal de cocina / ventanilla
- Iniciar y cerrar sesión.
- Escanear nuevamente el QR.
- Consultar autorizaciones pendientes.
- Confirmar la entrega de alimentos.

## Reglas de acceso
1. Cada trabajador tendrá una cuenta individual.
2. El sistema verificará el rol del usuario.
3. Solo el administrador gestionará el padrón.
4. Recepción autorizará, pero no confirmará entregas.
5. Ventanilla confirmará entregas previamente autorizadas.
6. Los usuarios no accederán a funcionalidades ajenas a su rol.
7. Los accesos no autorizados serán rechazados.

## Estado
Propuesta inicial, pendiente de revisión con el equipo.
