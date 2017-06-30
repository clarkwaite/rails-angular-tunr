ArtistsController.$inject = []
  ; function ArtistsController() {
    const vm = this;

    activate();

    function activate() {
      vm.artists = [{
        name: "Test artist",
        photo_url: "http://www.fillmurray.com/200/200",
        nationality: "USA"
      }, {
        name: "Test artist 2",
        photo_url: "http://www.fillmurray.com/205/205",
        nationality: "USA"
      }]
    }
  }
export default ArtistsController;