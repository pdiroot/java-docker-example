new Vue({
  el: '#random',
  data: {
    from: 1,
    to: 100,
    result: 0
  },
  methods: {
    generate: function (event) {
      var self = this;

      var params = {
        from: self.from,
        to: self.to
      }

      axios.post('/generate', params)
        .then(function (response) {
          self.result = response.data
        })
        .catch(function (error) {
          console.error(error)
          alert(error)
        })
    }
  }
})
