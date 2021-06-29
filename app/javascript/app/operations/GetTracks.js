import gql from 'graphql-tag';

export const GetTracks = () => {
  gql`
    {
      fetchTracks{
        id
        link
        photo
      }
    }
  `
}