<?php
require_once('header.php');
if($valorSesion == 1){
  require_once("includes/conexion.php");
  $sql = "SELECT * FROM Usuario WHERE correo = '".$correo."'";
  $res = mysqli_query($con, $sql) or die(mysqli_connect_error());
  $reg = mysqli_fetch_array($res);
?>

      <div class="row ">
        <div id="curso">
          <div class="col-md-8 col-md-offset-2">
            <legend><h2>Crear nuevo curso</h2></legend>

            <form action="crearCurso.php" method="post" enctype="multipart/form-data">
              <div class="form-group">
                <label for="nombre">Nombre del curso: </label>
                <input type="text" name="nombre" class="form-control" placeholder="Ingresa el nombre del curso" </input>
              </div>
              <div class="form-group">
                <label for="nombreAsesor">Nombre del asesor: </label>
                <input type="text" name="nombreAsesor" class="form-control" <?php echo "value='".$reg[ 'nombre']. " ".$reg['apellidos']."'"; ?> placeholder="¿Quien impartira este curso?" readonly>
              </div>
              <div class="form-group">
                <label for="descripcion">Descripción: </label>
                <textarea name="descripcion" class="form-control" placeholder="¿De que tratará el curso?" required></textarea>
              </div>

              <div class="form-group">
                <label for="nombre">Fecha inicio: </label>
                <input type="text" name="fecha_inicio" class="form-control" placeholder="..." required />
              </div>

              <div class="form-group">
                <label for="nombre">Costo: </label>
                <input type="text" name="costo" class="form-control" placeholder="..." required />
              </div>

              <div class="form-group">
                <label for="imagen">Portada: </label>
                <input name='imagen' type='file'  id='imagen'  multiple required>
              </div>
              <!--<div class="form-group">
                    <label for="correo">Email</label>
                    <input type="text" name="correo" value="<?php $correo; ?>" class="form-control" place></input>
                </div>-->
              <input type="submit" class="btn btn-primary" value="Crear curso"></input>
            </form>
          </div>

        </div>
      </div>

      <?php
        $sqlCursos = "SELECT * FROM Curso as a, Usuario as b, Usuario_has_Curso as c WHERE b.id_usuario = '".$reg['id_usuario']."' and a.id_curso = c.id_curso and b.id_usuario = c.id_usuario";
        $resCursos = mysqli_query($con, $sqlCursos);

        if(mysqli_num_rows($resCursos) > 0){
       ?>
      <div class="row">
        <div id="tutorial" class="">
          <div class="col-md-8 col-md-offset-2">
            <form action="crearTutorial.php" enctype="multipart/form-data" method="post" >
            <legend><h2>Crear nuevo tutorial</h2></legend>
            <!--<form action="crearTutorial.php" method="post">-->
              <div class="form-group">
                <label for="nombre">Nombre del tutorial: </label>
                <input type="text" name="nombre" class="form-control" id="nombre" placeholder="Nombre del tutorial">
              </div>
              <div class="form-group">
                <label for="descripcion">Descripción: </label>
                <input type="text" name="descripcion" class="form-control" id="descripcion"placeholder="Descripcion">
              </div>

              <div class="form-group">
                <label for="video">Video:</label>
                <input name='video' type='file'  id='video' accept="video/mp4" multiple>
              </div>
              <div class="form-group">
                <label for="cursos">Curso al que pertenece</label>
                <select name="cursos" class="form-control">
                  <?php while($reg_curso = mysqli_fetch_array($resCursos)) { ?>
                    <option value="<?php echo $reg_curso['id_curso']; ?>"><?php echo $reg_curso['nombre_curso']; ?></option>
                  <?php	 } ?>
                </select>
              </div>
              <input type="submit" class="btn btn-default" value="Enviar" id="enviar">
            </form>
            <!--</form>-->
          </div>
        </div>
      </div>

      <?php
        } else {
          echo "<h3 class='text-danger text-center'> Aún no tienes cursos. Por favor <a href='home.php#curso'> registra alguno. </a></h3>";
        }
      ?>


  <?php
  }else{
	echo "<script type='text/javascript'>".
	 "alert('Usted no esta logueado');".
	  "document.location.href = 'index.php';</script>";
  }
  require_once("footer.php");
  ?>
