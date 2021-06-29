// @ts-nocheck
import React from 'react';
import { Molecule } from 'diamondhands';

import track from '../../models/Track'

class TrackCard extends React.Component {
  constructor(props){
    super(props);

    this.state = {
      trackName: 'Maybe'
    }
  }

  componentDidMount()}{
    track.index.query()
  }
}