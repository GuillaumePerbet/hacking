<template>
<v-card>
    <!-- title -->
    <v-card-title>{{ nomElement }}</v-card-title>
    <!-- question -->
    <v-card-text v-if="details">{{ question }}</v-card-text>
    <!-- anwers -->
    <v-card-actions v-if="details">
      <v-btn >{{ reponse1 }}</v-btn>
      <v-btn >{{ reponse2 }}</v-btn>
    </v-card-actions>
</v-card>
</template>

<script>
  export default {
    name: 'Node',

    props: {
        details: Boolean,
        nomElement: String,
        question: String,
        reponse1: String,
        reponse2: String
    },

    data: () => ({
      
    }),

    computed: {
    }
  }
</script>