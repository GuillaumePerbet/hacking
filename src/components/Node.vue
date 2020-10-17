<template>
  <v-container>

    <!-- current node -->
    <v-row>
      <v-col cols="6" offset="3">
        <v-card>
            <!-- title -->
            <v-card-title>{{ title }}</v-card-title>
            <!-- question -->
            <v-card-text>{{ question }}</v-card-text>
            <!-- anwers -->
            <v-card-actions>
                <v-btn v-for="(answer,index) in answers" :key="index">{{ answer }}</v-btn>
            </v-card-actions>
        </v-card>
      </v-col>
    </v-row>

    <!-- child nodes -->
    <v-row>
      <v-col cols="6">
        
      </v-col>

      <v-col cols="6">
        
      </v-col>
    </v-row>
    

  </v-container>


</template>

<script>
  export default {
    name: 'Node',

    props: {
        id: Number
    },

    data: () => ({
      
    }),

    computed: {
        title(){
            return "Réutilisabilité"
        },

        question(){
            return "Le stylo est-il réutilisable?"
        },

        answers(){
            return ["oui","non"]
        }
    }
  }
</script>