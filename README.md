# Generar iconos para la aplicación

- Se debe tener una imagen base de 1024 x 1024 en formato JPG o PNG. En caso de no respetar estas medidas, la AppStore rechazará la aplicación al momento de publicarla

# Generar splash screen de forma manual

- Toda aplicación en flutter genera sus respectivos proyectos terminados para Android y iOS, en este sentido, se pueden reemplazar las imagenes usadas como splash de cada proyecto y al momento de lanzarlo o generar el paquete final, estas se mostrarán en pantalla
- En Android ir a **android/app/src/main/res/drawable** y editar el archivo **launch_background.xml** descomentando y colocando la referencia a la imagen o logo que se usara como parte central del splash (sección item - bitmap - android:src="@mipmap/splash")
- Finalmente colocar un archivo splash.png en cada carpeta **mipmap** situada dentro de **res**. Esta imagen deberá tener el mismo tamaño o dimensiones a la que aparece como ejemplo en cada respectiva carpeta mipmap **ic_launcher.png**
- En iOS es más sencillo, solo es cuestión de reemplazar 3 imagenes que aparecen dentro de **ios/Runner/LaunchImage.imageset** con las mismas dimensiones.

# Generar splash screen mediante un paquete de terceros compatible con Flutter

- Se recomienda el uso de paquetes de terceros para la generación de splash screen, ya que si no se tiene un dominio básico del desarrollo de aplicaciónes en una plataforma nativa en particular, es muy probable que sea un desafío establecer ciertas propiedades, tales como el color de fondo, tamaños, parametros exclusivos para versiones superiores, y otros aditamentos.
- El paquete **flutter_native_splash** nos permite generar splash screen con un alto grado de personalización