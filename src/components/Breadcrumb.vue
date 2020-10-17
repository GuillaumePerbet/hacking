<template>
<v-breadcrumbs
  divider=">"
  large
  :items="items"
></v-breadcrumbs>
</template>

<script>
  export default {
    name: 'Breadcrumb',

    props: {
        items: Array
    },

    data: () => ({
      
    }),

    computed: {
    },

    methods:{

    }
  }
</script>