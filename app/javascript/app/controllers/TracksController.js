import { ApolloController } from 'diamondhands';
import { GetTracks } from "../operations/GetTracks";

class TracksController extends ApolloController {
  accessor() {
    return "tracks";
  }

  index() {
    return GetTracks;
  }
}