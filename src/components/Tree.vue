<template>
<section id="tree">
<v-container>

  <Breadcrumb :items="breadcrumb"/>

  <!-- current node -->
  <v-row>
    <v-col cols="6" offset="3">
      <Node @back="back" @choice1="choice1" @choice2="choice2" details v-bind="currentNode"/>
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
import Breadcrumb from './Breadcrumb'
import axios from 'axios'

export default {
  name: 'Tree',

  components: {
      Node,
      Breadcrumb
  },

  data: () => ({
    breadcrumb: [{text: "Verrou de sécurité"}],
    currentId: 1,
    previousId: 0,
    currentNode: new Object,
    childNode1: new Object,
    childNode2: new Object,
  }),

  computed: {

  },

  methods: {
    choice1(){
      this.previousId = this.currentNode.idElement
      this.updateNodes( this.childNode1.idElement )
      this.breadcrumb.push({ text: this.childNode1.nomElement})
    },

    choice2(){
      this.previousId = this.currentNode.idElement
      this.updateNodes( this.childNode2.idElement )
      this.breadcrumb.push({ text: this.childNode2.nomElement})
    },

    back(){
      this.breadcrumb.pop()
      this.updateNodes( this.previousId )
    },

    updateNodes( id ){
    axios.get('http://localhost/hacking/element.php?id='+id)
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
  },

  created: function(){

    this.updateNodes( this.currentId )
    
  }
}
</script>