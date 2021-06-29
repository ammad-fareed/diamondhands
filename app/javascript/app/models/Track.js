import Model from 'diamondhands';
import TracksController from '../controllers/TracksController';

class Track extends Model {
  constructor(){
    super();

    this.controller = new TracksController();
  }

  name() {
    return "tracks";
  }

  resolvers(){
    return [{
      attr: "index"
    }]
  }
}