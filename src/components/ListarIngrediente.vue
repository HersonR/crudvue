<template>
    <nav>
        <div>
            <router-link to="/crearI" class="btn btn-success">Agregar Ingrediente</router-link>
            <router-link to="/" class="btn btn-primary">Ir a página principal</router-link>
        </div>
    </nav>
    <br/>


    <div class="container">

        <div class="card">
            <div class="card-header">
                ingredientes
            </div>
            <div class="card-body">
                <table class="table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>NOMBRE</th>
                            <th>DESCRIPCION</th>
                            <th>FECHA INGRESO</th>
                            <th>FECHA VENCIMIENTO</th>
                            <th>ACCIONES</th>
                        </tr>
                    </thead>
                    <tbody>

                        <tr v-for="ingrediente in ingredientes" :key="ingrediente.id_ingrediente">
                            <td>{{ingrediente.id_ingrediente}}</td>
                            <td>{{ingrediente.nombre}}</td>
                            <td>{{ingrediente.descripcion}}</td>
                            <td>{{ingrediente.fecha_ingreso}}</td>
                            <td>{{ingrediente.fecha_vencimiento}}</td>
                            <td>

                                <div class="btn-group" role="group" aria-label="">


                                <router-link :to="{name:'EditarI',params:{id_ingrediente:ingrediente.id_ingrediente}}" class="btn btn-info">Editar</router-link>

                                    <button type="button" v-on:click="borrarIngrediente(ingrediente.id_ingrediente)" class="btn btn-danger">Borrar</button>
                                </div>

                            </td>
                        </tr>

                    </tbody>
                </table>
                
            </div>
        
        </div>

    </div>
</template>


<script>
export default {
    data(){

        return{
            ingredientes:[]
        }
    },


    created:function(){
        
        this.consultarIngredientes();

    },
    methods:{
        
        consultarIngredientes(){
             fetch('http://localhost/ingredientes/')
             .then(respuesta=>respuesta.json())
             .then((datosRespuesta)=>{
                console.log(datosRespuesta)
                this.ingredientes = []
                if(typeof datosRespuesta[0].success==='undefined'){
                    this.ingredientes = datosRespuesta;
                }

             })
            .catch(console.log)

        },
        borrarIngrediente(id_ingrediente){
            console.log(id_ingrediente)

            fetch('http://localhost/ingredientes/?borrar='+id_ingrediente)
             .then(respuesta=>respuesta.json())
             .then((datosRespuesta)=>{
                console.log(datosRespuesta)
                window.location.href="ListarI"

             })
            .catch(console.log)

        }
       
    }
    
}
</script>
