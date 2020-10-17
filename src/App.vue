<template>
  <v-app>
    <v-app-bar
      app
      color="primary"
      dark
    >
      
    </v-app-bar>

    <v-main>
      <Tree/>
    </v-main>
  </v-app>
</template>

<script>
import Tree from './components/Tree';

export default {
  name: 'App',

  components: {
    Tree,
  },

  data: () => ({
    //
  }),
};
</script>
