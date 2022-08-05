<template>
    <nav>
        <div>
            <router-link to="/crear" class="btn btn-success">Agregar Pastel</router-link>
            <router-link to="/" class="btn btn-primary">Ir a página principal</router-link>
        </div>
    </nav>
    <br/>





    <div class="container">

        <div class="card">
            <div class="card-header">
                Pasteles
            </div>
            <div class="card-body">
                <table class="table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>NOMBRE</th>
                            <th>DESCRIPCION</th>
                            <th>PREPARADO POR</th>
                            <th>FECHA CREACION</th>
                            <th>FECHA VENCIMIENTO</th>
                            <th>ACCIONES</th>
                        </tr>
                    </thead>
                    <tbody>

                        <tr v-for="pastel in pasteles" :key="pastel.id_pastel">
                            <td>{{pastel.id_pastel}}</td>
                            <td>{{pastel.nombre}}</td>
                            <td>{{pastel.descripcion}}</td>
                            <td>{{pastel.preparado_por}}</td>
                            <td>{{pastel.fecha_creacion}}</td>
                            <td>{{pastel.fecha_vencimiento}}</td>
                            <td>

                                <div class="btn-group" role="group" aria-label="">


                                <router-link :to="{name:'Editar',params:{id_pastel:pastel.id_pastel}}" class="btn btn-info">Editar</router-link>

                                    <button type="button" v-on:click="borrarPastel(pastel.id_pastel)" class="btn btn-danger">Borrar</button>
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
            pasteles:[]
        }
    },


    created:function(){
        
        this.consultarPasteles();

    },
    methods:{
        
        consultarPasteles(){
             fetch('http://localhost/pasteles/')
             .then(respuesta=>respuesta.json())
             .then((datosRespuesta)=>{
                console.log(datosRespuesta)
                this.pasteles = []
                if(typeof datosRespuesta[0].success==='undefined'){
                    this.pasteles = datosRespuesta;
                }

             })
            .catch(console.log)

        },
        borrarPastel(id_pastel){
            console.log(id_pastel)

            fetch('http://localhost/pasteles/?borrar='+id_pastel)
             .then(respuesta=>respuesta.json())
             .then((datosRespuesta)=>{
                console.log(datosRespuesta)
                window.location.href="Listar"

             })
            .catch(console.log)

        }
       
    }
    
}
</script>
