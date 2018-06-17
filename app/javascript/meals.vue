<template>
  <div id="meals">
    <ul>
      <li v-for="meal in meals">
        {{ meal.title }}
      </li>
    </ul>
  </div>
</template>

<script>
  import Vue from 'vue'
  import VueResource from 'vue-resource'

  Vue.use(VueResource);

  export default {
    data: {
      meals: this.meals
    },
    mounted: function () {
      this.$http.get('/meals.json').then(response => {
        this.meals = response.body;
      });
    }
  }
</script>