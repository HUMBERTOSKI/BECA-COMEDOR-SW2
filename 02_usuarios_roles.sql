-- SDCC-17 — Estructura propuesta de cuentas y roles
-- Sistema Beca Comedor UABJB — MySQL 8.0+
-- Responsable: Camila Arrazola Vargas
-- ESTADO: PROPUESTA. Revisar con el equipo antes de integrarla.
--
-- PRERREQUISITO: seleccionar previamente la base de datos del proyecto:
-- USE nombre_de_la_base_de_datos;
-- No se crea ni se borra una base de datos en este archivo.
-- Este script no crea cuentas ni contraseñas reales.

CREATE TABLE IF NOT EXISTS roles (
    id_rol INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL UNIQUE,
    descripcion VARCHAR(150) NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS usuarios (
    id_usuario INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre_completo VARCHAR(150) NOT NULL,
    usuario VARCHAR(80) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    id_rol INT UNSIGNED NOT NULL,
    activo TINYINT(1) NOT NULL DEFAULT 1,
    fecha_creacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_usuarios_roles
        FOREIGN KEY (id_rol) REFERENCES roles(id_rol)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Registrar los tres tipos de rol. No se crean usuarios de ejemplo.
-- ON DUPLICATE KEY UPDATE hace que repetir esta carga no duplique roles.
INSERT INTO roles (nombre, descripcion) VALUES
    ('admin', 'Administración de Bienestar Estudiantil'),
    ('recepcionista', 'Recepción del comedor'),
    ('cocina', 'Cocina y ventanilla de entrega')
ON DUPLICATE KEY UPDATE descripcion = VALUES(descripcion);

-- Consultas opcionales de verificación, ejecutarlas después de crear las tablas:
-- SHOW TABLES;
-- SHOW CREATE TABLE usuarios;
-- SELECT id_rol, nombre, descripcion FROM roles ORDER BY id_rol;

-- IMPORTANTE:
-- 1. Se supone una sola función/rol por usuario; confirmar antes de integrar.
-- 2. password_hash debe generarse en PHP con password_hash(),
--    y verificarse mediante password_verify(). Nunca insertar texto plano.
-- 3. La seguridad se implementa en PHP; estas tablas por sí solas
--    no bloquean páginas ni operaciones sin autorización.
-- 4. CREATE TABLE IF NOT EXISTS NO valida ni actualiza tablas preexistentes:
--    si el proyecto ya tiene 'roles' o 'usuarios', revisar una migración aparte.
