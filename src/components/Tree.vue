<template>
  <section id="tree">

    <!-- current node -->
    <Node :id="currentNode"/>

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
      breadcrumb: [1],
      currentNode: 1,
    }),
  }
</script>