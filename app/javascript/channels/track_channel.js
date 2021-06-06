import consumer from "./consumer";
import { Link } from 'react-router-dom';
import artistUrl from '../components/util/artistUrl';
import moment from 'moment';
import styled from 'styled-components';

const CommentInfoWrapper = styled.div`
	display: flex;
	width: 100%;
	justify-content: flex-start;
	align-items: flex-end;
`;
const CommentAuthor = styled(Link)`
  font-size: 10px;
  color: #6b6b6b !important;
  margin-right: 5px;
  text-decoration: none !important;
  padding: 0 !important;

  &:hover {
    color: #6b6b6b !important;
    background: none;
  }
`;
const CommentTime = styled.div`
	font-size: 8px;
	color: #cccccc;
`;

const CommentText = styled.div`
	font-size: 13px;
	color: #6b6b6b;
	width: 100%;
`;

// Generated with `rails g channel Comments`
var url = window.location.href;
let id = url.slice(url.length - 1, url.length);

consumer.subscriptions.create({channel: "TrackChannel", track_id: id}, {
  connected() {
    console.log("Connected");
  },

  disconnected() {
  
  },

  received(data) {
    this.appendComment(data);
  },

  appendComment(data){
    const html = this.createLine(data)
    const commentSection = document.getElementById("comments");
    if(data.count == 0 ){
      commentSection.innerText = '';
     } 
    commentSection.insertAdjacentHTML("beforeend", html)
  },

  createLine(data) {
    return (
      `<Comment key=${data.id}>
          <CommentInfoWrapper>
              <CommentAuthor to=${artistUrl(data.artist_name)}><a href="/artist/${data.artist_name}" style="background: white; color: #6b6b6b; text-decoration: none; font-size: 10px;">${data.artist_name}</a>
              </CommentAuthor>
              <CommentTime> <small style="color: #cccccc;">${moment(data.created_at).from(new Date())}</small></CommentTime>
          </CommentInfoWrapper><br />
          <CommentText>${data.text}</CommentText>
      </Comment><br />`
    )
  }
})