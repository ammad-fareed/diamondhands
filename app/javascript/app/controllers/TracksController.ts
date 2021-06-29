// @ts-nocheck
import { ApolloController } from 'diamondhands';

class TracksController extends ApolloController {
  accessor() {
    return "tracks";
  }

  index() {
    return GetTracks;
  }
}