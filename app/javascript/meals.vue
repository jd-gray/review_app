<template>
  <div class="container">
    <div v-masonry transition-duration=".3s" item-selector=".item" class="meals">
      <div v-masonry-tile class="items" v-for="meal in meals">
        <p>{{ meal.title }}</p>
        <p>{{ meal.description }}</p>
        <p>{{ meal.total_rating }}</p>
        <button v-on:click="liked(meal)">Like</button>
      </div>
    </div>
  </div>
</template>

<script>
  import Vue from 'vue';
  import VueResource from 'vue-resource';
  import {VueMasonryPlugin} from 'vue-masonry';

  Vue.use(VueResource);
  Vue.use(VueMasonryPlugin);

  // TODO: Consider adding interceptor
  Vue.http.headers.common['X-CSRF-Token'] = $('[name="csrf-token"]').attr('content');

  export default {
    data: {
      meals: this.meals
    },
    methods: {
      liked: function(meal) {
        this.$http.post('/meals/' + meal.id + '/reviews', { liked: true })
          .then(response => {
            meal.total_rating = response.body.total_rating;
          }).catch(response => {
            // TODO: Better error messages
            alert(response.body.errors.meal_id[0]);
          });
      }
    },
    mounted: function () {
      this.$http.get('/meals.json').then(response => {
        this.meals = response.body;
      });
    }
  }
</script>

<style scoped>

.container {
  margin-top: 20px;
}

.items {
  background: gray;
  border-radius: 5%;
  float: left;
  height: 325px;
  padding: 10px;
  margin: 5px;
  width: 250px;
}

</style>