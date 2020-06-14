import React from "react";
import { Link } from "react-router-dom";
import styled from "styled-components";
import SongBox from "./shared/SongBox";
import $ from "jquery";

const Wrapper = styled.div`
  padding: 20px;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-wrap: wrap;
  max-width: 1080px;
`;

const InnerHeader = styled.div`
  width: 100%;
  margin-top: 50px;
  height: 50px;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 24px;
  color: #61646d;
`;

const AddATrackLink = styled.a`
  cursor: pointer;
  font-size: 24px;
  padding: 5px;
  padding-bottom: 50px;
  width: 100%;
  height: 200px;
  display: flex;
  align-items: center;
  justify-content: center;
  margin-bottom: 50px;
  margin-top: -30px;
`;

class HomePage extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      tracks: [],
    };
  }

  componentDidUpdate() {
    this.getTracks();
  }

  componentDidMount() {
    this.getTracks();
  }

  getTracks = () => {
    if (this.state.tracks.length == 0) {
      $.get("/tracks").done((res) => {
        this.setState(
          {
            tracks: res.tracks,
          },
          () => {
            if (masterAudioTag.paused) this.enableTrack(0, false);
          }
        );
      });
    }
  };

  enableTrack = (i, play = true) => {
    const newTrack = this.state.tracks[i];
    window.masterShowTrack(newTrack, play);
  };

  render() {
    return (
      <div>
        <InnerHeader>💐 Welcome back!</InnerHeader>
        <Wrapper>
          {this.state.tracks.map((obj, i) => {
            return (
              <SongBox
                key={obj.link}
                trackInfo={obj}
                enableTrack={() => {
                  this.enableTrack(i);
                }}
              />
            );
          })}
        </Wrapper>
        <AddATrackLink href="/add-a-track">Add a track!</AddATrackLink>
      </div>
    );
  }
}

export default HomePage;
