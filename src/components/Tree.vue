<template>
<section id="tree">
<v-container>

  <Breadcrumb :items="breadcrumb"/>

  <!-- current node -->
  <v-row>
    <v-col cols="8" offset="1">
      <Node v-if="!finish" @back="back" @choice1="choice1" @choice2="choice2" details :init="init" v-bind="currentNode"/>
    </v-col>
  </v-row>

  <!-- child nodes -->
  <v-row>
    <v-col cols="4">
      <Node v-if="childNode1.idElement" class="text--disabled" v-bind="childNode1"/>
    </v-col>

    <v-col cols="4">
      <Node v-if="childNode2.idElement" class="text--disabled" v-bind="childNode2"/>
    </v-col>
  </v-row>

  <Stylo :images="images"/>

  <!-- errors -->
  <v-container v-if="finish">
    <v-row><v-col><h2>Erreurs récontrées par les utilisateurs</h2></v-col></v-row>
    <v-row v-for="(error,index) in errors" :key="index">
      <v-col v-if="error.textErreur">
        <v-banner>{{error.textErreur}}</v-banner>
      </v-col>
    </v-row>
  </v-container>
</v-container>
</section>
</template>

<script>
import Node from './Node'
import Breadcrumb from './Breadcrumb'
import Stylo from './Stylo'
import axios from 'axios'

export default {
  name: 'Tree',

  components: {
      Node,
      Breadcrumb,
      Stylo
  },

  data: () => ({
    breadcrumb: [ { text: "Verrou de sécurité" , id:"1" } ],
    errors: [],
    images: [],
    currentNode: new Object,
    childNode1: new Object,
    childNode2: new Object,
    finish: false
  }),

  computed: {
    init(){
      return this.currentNode.idElement == 1
    }
  },

  methods: {
    choice1(){
      axios.get('http://localhost/hacking/errors.php?id='+this.currentNode.idElement+'&answer='+this.currentNode.reponse1).then((response)=>{
        this.errors.push(response.data)
      })
      axios.get('http://localhost/hacking/images.php?id='+this.currentNode.idElement+'&answer='+this.currentNode.reponse1).then((response)=>{
        if(response.data.image){
          this.images.push(response.data.image)
        }
      })
      if (this.childNode1.idElement){
        this.updateNodes( this.childNode1.idElement )
        this.breadcrumb.push({ text: this.childNode1.nomElement , id: this.childNode1.idElement})
      }else{
        this.finish=true
      }
    },

    choice2(){
      axios.get('http://localhost/hacking/errors.php?id='+this.currentNode.idElement+'&answer='+this.currentNode.reponse2).then((response)=>{
        this.errors.push(response.data)
      })
      axios.get('http://localhost/hacking/images.php?id='+this.currentNode.idElement+'&answer='+this.currentNode.reponse2).then((response)=>{
        if(response.data.image){
          this.images.push(response.data.image)
        }
      })
      if (this.childNode2.idElement){
        this.updateNodes( this.childNode2.idElement )
        this.breadcrumb.push({ text: this.childNode2.nomElement , id: this.childNode2.idElement})
      }else{
        this.finish=true
      }
    },

    back(){
      this.breadcrumb.pop()
      this.updateNodes( this.breadcrumb[this.breadcrumb.length-1].id )
    },

    updateNodes( id ){
    axios.get('http://localhost/hacking/element.php?id='+id)
    .then(response => {
      this.currentNode=response.data
      axios.get('http://localhost/hacking/element.php?id='+this.currentNode.elementSuivant1)
      .then(response1 => {
        if(response1.data.idElement){
          this.childNode1=response1.data
        }else{
          this.childNode1={}
        }
      })
      axios.get('http://localhost/hacking/element.php?id='+this.currentNode.elementSuivant2)
      .then(response2 => {
        if(response2.data.idElement){
          this.childNode2=response2.data
        }else{
          this.childNode2={}
        }
      })
    })
    }
  },

  created: function(){
    this.updateNodes( 1 )
  }
}
</script>