<template>
  <v-app>
    <v-app-bar
      app
      color="primary"
      dark
      class="mb-10"
    >
    </v-app-bar>

    <v-main>
      <!-- <v-container>
        <v-row>
          <v-col cols="3" offset="9"> -->
            <v-img class="float-right mr-10" width="250" src="@/assets/logo-DM-SAI.png"></v-img>
            <!-- </v-col> -->
        <!-- </v-row>
      </v-container> -->
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
