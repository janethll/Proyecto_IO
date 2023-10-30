<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>IO-Proyecto</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
    <div id="tittle">
        RESTAURANTE EL TIO 10 LUCAS
    </div>

    <div id="encabezado">
        <button class="boton" id="btnAdministrador">Administrador</button>
        <button class="boton" id="btnCliente">Cliente</button>
        <label id="fecha-hora">Fecha: </label>
    </div>

    <div id="platos-hoy">
        ¡Platos de hoy!
    </div>

    <div id="contenedor-cuadros">
        <div class="cuadro">
            <span class="monto-label">s/</span>
            <input type="text" class="monto-input" placeholder="Monto">
            <input type="file" class="image-input" accept="image/*">
            <button class="upload-button" disabled>CARGAR IMAGEN</button>
        </div>
        <div class="cuadro">
            <span class="monto-label">s/</span>
            <input type="text" class="monto-input" placeholder="Monto">
            <input type="file" class="image-input" accept="image/*">
            <button class="upload-button"disabled>Cargar Imagen</button>
        </div>
        <div class="cuadro">
            <span class="monto-label">s/</span>
            <input type="text" class="monto-input" placeholder="Monto">
            <input type="file" class="image-input" accept="image/*">
            <button class="upload-button" disabled>Cargar Imagen</button>
        </div>

        <div class="cuadro">
            <span class="monto-label">s/</span>
            <input type="text" class="monto-input" placeholder="Monto">
            <input type="file" class="image-input" accept="image/*">
            <button class="upload-button" disabled>Cargar Imagen</button>
        </div>
        <div class="cuadro">
            <span class="monto-label">s/</span>
            <input type="text" class="monto-input" placeholder="Monto">
            <input type="file" class="image-input" accept="image/*">
            <button class="upload-button" disabled>Cargar Imagen</button>
        </div>
       
        
    </div>


    <script>
    
    function cargarImagen(input, cuadro) {
    const file = input.files[0];

    if (file) {
        const reader = new FileReader();

        reader.onload = function(e) {
            const image = new Image();
            image.src = e.target.result;

            // Reemplaza cualquier imagen anterior en el cuadro.
            const existingImage = cuadro.querySelector('img');
            if (existingImage) {
                cuadro.replaceChild(image, existingImage);
            } else {
                cuadro.appendChild(image);
            }
        };

        reader.readAsDataURL(file); // Lee la imagen como una URL de datos.
    }
}



      
        function handleUploadButtonClick(input, cuadro) {
            input.click();
        }
        const cuadros = document.querySelectorAll('.cuadro');
        const imageInputs = document.querySelectorAll('.image-input');
        const uploadButtons = document.querySelectorAll('.upload-button');

  
        uploadButtons.forEach((button, index) => {
            button.addEventListener('click', () => {
                handleUploadButtonClick(imageInputs[index], cuadros[index]);
            });
        });

        
        imageInputs.forEach((input, index) => {
            input.addEventListener('change', () => {
                cargarImagen(input, cuadros[index]);
            });
        });
    
        document.getElementById('btnAdministrador').addEventListener('click', function() {
            window.location.href = 'admin.php';
        });

       
        document.getElementById('btnCliente').addEventListener('click', function() {
            window.location.href = 'cliente.php';
        });

        function FechaHora() {
            const fechaHoraElemento = document.getElementById('fecha-hora');
            const ahora = new Date();

            const dia = String(ahora.getDate()).padStart(2, '0');
            const mes = String(ahora.getMonth() + 1).padStart(2, '0');
            const anio = String(ahora.getFullYear()).slice(-2);

            const hora = String(ahora.getHours()).padStart(2, '0');
            const minuto = String(ahora.getMinutes()).padStart(2, '0');
            const segundo = String(ahora.getSeconds()).padStart(2, '0');

            const fechaHoraTexto = `Fecha: ${dia}/${mes}/${anio} ${hora}:${minuto}:${segundo}`;
            fechaHoraElemento.textContent = fechaHoraTexto;
        }

        setInterval(FechaHora, 1000);
        FechaHora();
    </script>
    
    
    <div class="d-grid gap-6 d-md-flex justify-content-md-end fixed-bottom">
        <button class="btn btn-primary" type="button">Button</button>
        <button class="btn btn-primary" type="button">Button</button>
    </div>
</body>

</html>
