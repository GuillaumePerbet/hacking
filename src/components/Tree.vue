<template>
<section id="tree">
<v-container>

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
import axios from 'axios'

export default {
  name: 'Tree',

  components: {
      Node,
  },

  data: () => ({
    breadcrumb: [0,1],
    currentId: 1,
    currentNode: new Object,
    childNode1: new Object,
    childNode2: new Object,
  }),

  computed: {

  },

  methods: {
    
  },

  created: function(){
    axios.get('http://localhost/hacking/element.php?id='+this.currentId)
    .then(response => {
      this.currentNode=response.data
      axios.get('http://localhost/hacking/element.php?id='+this.currentNode.elementSuivant1)
      .then(response => {
        this.childNode1=response.data
      })
      axios.get('http://localhost/hacking/element.php?id='+this.currentNode.elementSuivant2)
      .then(response => {
        this.childNode2=response.data
      })
    })
  }
}
</script>