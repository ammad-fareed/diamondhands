import React from 'react';
import _ from 'lodash';
import { apiEndpoint } from '../util/helpers';
// import styled from 'styled-components';
import tw from "tailwind-styled-components"

// styled components
let Section = tw.section`
	flex
	flex-col
	items-start
	justify-start
	w-full
	m-10
	p-10
`

const SectionHeading = tw.h1`
	text-3xl
	text-gray-800
	font-thinner
`

class InstrumentTag extends React.Component {
	constructor(props) {
		super(props);

		this.state = {
			data: {}
		};
	}

	componentDidMount(){
		this.fetchData();
	}

	fetchData = () => {
		fetch(apiEndpoint+'/instruments')
			.then(res => res.json())
			.then(data => this.setState({ data: data }));
	}

	render() {
		console.log(this.state.data);
    return(
      <>
				<Section>
					<SectionHeading>List of the Intruments Selected</SectionHeading>
				</Section>
        
				<Section>
					<SectionHeading>List of the Intruments Available</SectionHeading>
				</Section>

				
      </>
    );
    
	}
}

export default InstrumentTag;
