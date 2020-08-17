<template>
  <div>
    <h2>{{ title }}</h2>
    <p>{{ content }}</p>
  </div>
</template>

<script>
  export default {
    data: () => {
      return {
        title: 'CK',
        content: 'CK內文文文文文文文文',
      }
    }
  };
</script>

<style scoped>
  div {
    border: 2px solid #fff;
    border-radius:4px;
  }
</style>