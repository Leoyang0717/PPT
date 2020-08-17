<template>
  <div id="app">
    <h1>{{ message }}</h1>
    <h2>{{ message }}</h2>
    <ad></ad>
  </div>
</template>

<script>
import ad from 'vue/components/UI/ad.vue'
export default {
  data: function () {
    return {
      message: "Hello Vue!"
    }
  },
  components: { ad }
}
</script>

<style scoped>
h1 {
  color: #fa0;
}
</style>
