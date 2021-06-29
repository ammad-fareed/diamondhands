// @ts-nocheck
import React from 'react'
import styled from "styled-components";


const FlexContainer = styled.div`
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
  overflow: hidden;
  padding-top: 20px;
`;

const Header = styled.div`
  display: flex;
  align-items: center;
  color: black;
  font-weight: 800;
  overflow: hidden;
  font-size: 2rem;
`;



class TrackInfo extends React.Component{
  render(){
    return(
      <FlexContainer>
        <Header>
          HI          
        </Header>
      </FlexContainer>
    );
  }
}

export default TrackInfo;

