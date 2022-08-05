
<template>
  <div class="btn-group" role="group" aria-label="">
      <router-link :to="{name:'Listar'}" class="btn btn-primary">MODULO PASTELES</router-link>
      <router-link :to="{name:'ListarI'}" class="btn btn-info">MODULO INGREDIENTES</router-link>
  </div>
</template>

<script>
export default {
  name: 'HelloWorld',
  props: {
    msg: String
  }
}
</script>


