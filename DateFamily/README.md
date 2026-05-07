La página web será un Sistema de Gestión de Perfiles Familiares desarrollado para la empresa ficticia “DataFamily”, donde cada empleado podrá registrarse, iniciar sesión y administrar tanto sus datos personales como la información de su grupo familiar. El sistema contará con diferentes vistas según el rol del usuario: una vista estándar para empleados y otra exclusiva para administradores.

En la página principal se incluirá un sistema de registro y login, permitiendo crear cuentas nuevas y acceder de manera segura mediante autenticación con usuario y contraseña. Una vez iniciada la sesión, el usuario podrá acceder a su panel personal.

El Panel de Usuario tendrá una sección de perfil donde el empleado podrá completar o modificar sus datos personales, como nombre completo, DNI y teléfono. Además, contará con una sección de gestión familiar que permitirá agregar, editar o eliminar familiares asociados a su cuenta, indicando nombre, parentesco y edad. Toda esta información quedará vinculada únicamente al usuario logueado, respetando la privacidad de los datos.

El sistema también incluirá un Panel de Administrador, accesible únicamente para usuarios con rol “Admin”. Desde allí se podrá visualizar un reporte general con todos los usuarios registrados y la lista de familiares asociados a cada uno, facilitando la supervisión y administración de la información cargada en el sistema.

La aplicación tendrá validaciones en los formularios para asegurar la correcta carga de datos, por ejemplo verificando que el DNI sea numérico y que no existan campos vacíos. Además, implementará manejo de sesiones para impedir el acceso a las páginas internas sin haber iniciado sesión previamente.

A nivel técnico, el proyecto estará conectado a una base de datos relacional que almacenará la información de usuarios y familiares mediante tablas relacionadas con claves foráneas. El código estará organizado separando la conexión a la base de datos, la lógica del sistema, los estilos CSS y las vistas HTML, logrando una estructura clara y mantenible
