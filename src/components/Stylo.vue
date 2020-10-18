<template>

<v-container fluid>
	<v-container>
		<v-row>

			<v-img v-for="(image,index) in images" :key="index" :src="require('../assets/'+image)" v-show="base" class="image"/>

		</v-row>
	</v-container>
  </v-container>
</template>

<script>
export default {
    name: "Stylo",
    
    data: () => ({
		base: true,
		aiguille1: true,
		accessible1: true,
		chargement: true,
		reglage: true,
		bouton: true,
		capuchon: true,
		inviolabilite1: true,
	}),
	
	props:{
		images: Array
	}
}
</script>

<style>
.image{
	position:absolute !important;
	width:auto;
	height:auto;
	left:800px;
	top:100px;
}

.saut{
    display:flex;
    flex-direction:column;
}
</style>

