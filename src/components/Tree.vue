<template>
<section id="tree">
<v-container>
  <!-- parent node -->
  <v-row>
    <v-col cols="6" offset="3">
      <Node v-bind="parentNode"/>
    </v-col>
  </v-row>

  <!-- current node -->
  <v-row>
    <v-col cols="6" offset="3">
      <Node details v-bind="currentNode"/>
    </v-col>
  </v-row>

  <!-- child nodes -->
  <v-row>
    <v-col cols="6">
      <Node v-bind="childNode1"/>
    </v-col>

    <v-col cols="6">
      <Node v-bind="childNode2"/>
    </v-col>
  </v-row>
</v-container>
</section>
</template>

<script>
import Node from './Node'

export default {
  name: 'Tree',

  components: {
      Node,
  },

  data: () => ({
    breadcrumb: [0,1],
    currentId: 1,
    currentNode: new Object,
    parentNode: new Object,
    childNode1: new Object,
    childNode2: new Object,
  }),

  computed: {
  },

  methods: {
    // getElement( id ){
    //   get node form database
    // }
  },

  created: function(){
    //get current node form database
    this.currentNode.nomElement = "Réutilisabilité"
    this.currentNode.question = "Le stylo est-il réutilisable?"
    this.currentNode.reponse1 = "OUI"
    this.currentNode.reponse2 = "NON"
    this.currentNode.elementSuivant1 = 2
    this.currentNode.elementSuivant2 = 3
    //get child nodes
    this.childNode1.nomElement = "Multidose"
    this.childNode2.nomElement = "Chargement"
    //get parent node
    this.parentNode.nomElement = "Départ"
  }
}
</script>