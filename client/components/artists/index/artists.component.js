import ArtistsController from "./artists.controller";
import artistsTemplate from "./artists.html";

  const artistsComponent = {
  	controller: ArtistsController,
  	template: artistsTemplate
  };

  angular.module("TunrApp").component("tunrArtists", artistsComponent);