<template>
    <div class="container">
        <div class="card">
            <div class="card-header">
                Editar ingrediente
            </div>
            <div class="card-body">
                <form v-on:submit.prevent="actualizarRegistro" >

                    <div class="form-group">
                      <label for="nombre">NOMBRE:</label>
                      <input type="text"
                        class="form-control" required name="nombre" v-model="ingrediente.nombre" id="nombre" aria-describedby="helpId" placeholder="">
                      <small id="helpId" class="form-text text-muted">Nombre del ingrediente</small>
                    </div>
                    <div class="form-group">
                      <label for="descripcion">DESCRIPCION:</label>
                      <input type="text"
                        class="form-control" required name="descripcion" v-model="ingrediente.descripcion" id="descripcion" aria-describedby="helpId" placeholder="">
                      <small id="helpId" class="form-text text-muted">Descripción del ingrediente</small>
                    </div>
                    <div class="form-group">
                      <label for="fecha_ingreso">FECHA INGRESO:</label>
                      <input type="date"
                        class="form-control" required name="fecha_ingreso" v-model="ingrediente.fecha_ingreso" id="fecha_ingreso" aria-describedby="helpId" placeholder="">
                      <small id="helpId" class="form-text text-muted">Fecha de ingreso</small>
                    </div>
                    <div class="form-group">
                      <label for="fecha_vencimiento">FECHA VENCIMIENTO:</label>
                      <input type="date"
                        class="form-control" required name="fecha_vencimiento" v-model="ingrediente.fecha_vencimiento" id="fecha_vencimiento" aria-describedby="helpId" placeholder="">
                      <small id="helpId" class="form-text text-muted">Fecha de vencimiento</small>
                    </div>

                    <div class="btn-group" role="group" aria-label="">
                        <button type="submit" class="btn btn-success">Modificar</button>
                        <router-link :to="{name:'ListarI'}" class="btn btn-warning">Cancelar</router-link>
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

            ingrediente:{}
        }

    },
    created:function(){
        this.obtenerInformacionID();

    },
    methods:{
        obtenerInformacionID(){

             fetch('http://localhost/ingredientes/?consultar='+this.$route.params.id_ingrediente)
             .then(respuesta=>respuesta.json())
             .then((datosRespuesta)=>{


                console.log(datosRespuesta)
                this.ingrediente = datosRespuesta[0];
                

             })
            .catch(console.log)

        },

        actualizarRegistro(){
            var datosEnviar = {id_empleado:this.$route.params.id_ingrediente,
            nombre:this.ingrediente.nombre, descripcion:this.ingrediente.descripcion, fecha_ingreso:this.ingrediente.fecha_ingreso, fecha_vencimiento:this.ingrediente.fecha_vencimiento}

            fetch('http://localhost/ingredientes/?actualizar='+this.$route.params.id_ingrediente,{
                method:"POST",
                body:JSON.stringify(datosEnviar)
            })
            .then(respuesta=>respuesta.json())
            .then((datosRespuesta=>{
                console.log(datosRespuesta);
                window.location.href='../ListarI'
            }))

        }

        }
    }
</script>