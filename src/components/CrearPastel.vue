<template>
    <div class="container">
        <div class="card">
            <div class="card-header">
                Agregar nuevo pastel
            </div>
            <div class="card-body">
                <form v-on:submit.prevent="agregarRegistro" >

                    <div class="form-group">
                      <label for="nombre">NOMBRE:</label>
                      <input type="text"
                        class="form-control" required name="nombre" v-model="pastel.nombre" id="nombre" aria-describedby="helpId" placeholder="">
                      <small id="helpId" class="form-text text-muted">Nombre del pastel</small>
                    </div>
                    <div class="form-group">
                      <label for="descripcion">DESCRIPCION:</label>
                      <input type="text"
                        class="form-control" required name="descripcion" v-model="pastel.descripcion" id="descripcion" aria-describedby="helpId" placeholder="">
                      <small id="helpId" class="form-text text-muted">Descripción del pastel</small>
                    </div>
                    <div class="form-group">
                      <label for="preparado_por">PREPARADO POR:</label>
                      <input type="text"
                        class="form-control" required name="preparado_por" v-model="pastel.preparado_por" id="preparado_por" aria-describedby="helpId" placeholder="">
                      <small id="helpId" class="form-text text-muted">Quién preparo el pastel</small>
                    </div>
                    <div class="form-group">
                      <label for="fecha_creacion">FECHA CREACION:</label>
                      <input type="date"
                        class="form-control" required name="fecha_creacion" v-model="pastel.fecha_creacion" id="fecha_creacion" aria-describedby="helpId" placeholder="">
                      <small id="helpId" class="form-text text-muted">Fecha de creación</small>
                    </div>
                    <div class="form-group">
                      <label for="fecha_vencimiento">FECHA VENCIMIENTO:</label>
                      <input type="date"
                        class="form-control" required name="fecha_vencimiento" v-model="pastel.fecha_vencimiento" id="fecha_vencimiento" aria-describedby="helpId" placeholder="">
                      <small id="helpId" class="form-text text-muted">Fecha de vencimiento</small>
                    </div>

                    <div class="btn-group" role="group" aria-label="">
                        <button type="submit" class="btn btn-success">Agregar</button>
                        <router-link :to="{name:'Listar'}" class="btn btn-warning">Cancelar</router-link>
                    </div>
                </form>

            </div>
            
        </div>

    </div>
</template>

<script>
export default{
    data(){
        return{
            pastel:{}
        }
    },
    methods:{
        agregarRegistro(){
            console.log(this.pastel);

            var datosEnviar = {nombre:this.pastel.nombre, descripcion:this.pastel.descripcion, preparado_por:this.pastel.preparado_por, fecha_creacion:this.pastel.fecha_creacion, fecha_vencimiento:this.pastel.fecha_vencimiento}

            fetch('http://localhost/pasteles/?insertar=1',{
                method:"POST",
                body:JSON.stringify(datosEnviar)
            })
            .then(respuesta=>respuesta.json())
            .then((datosRespuesta=>{
                console.log(datosRespuesta);
                window.location.href='Listar'
            }))
        }
    }
}

</script>