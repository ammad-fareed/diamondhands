// @ts-nocheck
import { Atom } from 'diamondhands';
import { TrackInfo } from "../html/TrackInfoPart";


class TrackNameAtom extends Atom {
  render(){
    return (
      <>
        <h1>{this.quark()}</h1>
      </>
    );
  }
}