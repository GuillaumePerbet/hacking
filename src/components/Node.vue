<template>
<v-card>
    <!-- return button -->
    <v-btn @click="back" v-if="details && (!init)" class="float-right ma-2" elevation="2" icon><v-icon>mdi-undo</v-icon></v-btn>
    <!-- title -->
    <v-card-title>{{ nomElement }}</v-card-title>
    <!-- question -->
    <v-card-text class="text-center" v-if="details">{{ question }}</v-card-text>
    <!-- anwers -->
    <v-card-actions v-if="details">
      <v-btn @click="chooseAnswer1">{{ reponse1 }}</v-btn>
      <v-btn @click="chooseAnswer2">{{ reponse2 }}</v-btn>
    </v-card-actions>
</v-card>
</template>

<script>
  export default {
    name: 'Node',

    props: {
        details: Boolean,
        init: Boolean,
        nomElement: String,
        question: String,
        reponse1: String,
        reponse2: String
    },

    data: () => ({
      
    }),

    computed: {
    },

    methods:{
      chooseAnswer1(){
        this.$emit('choice1')

      },

      chooseAnswer2(){
        this.$emit('choice2')
      },

      back(){
        this.$emit('back')
      }
    }
  }
</script>