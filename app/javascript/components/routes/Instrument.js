import React from 'react';
import _ from 'lodash';
import { apiEndpoint } from '../util/helpers';
import tw from "tailwind-styled-components"

// styled components
const Section = tw.section`
	flex
	flex-col
	items-center
	justify-center
	w-full
	m-5
	p-10
`

const SectionHeading = tw.h1`
	text-xl
	text-gray-600
	font-thinner
`

const TagLabel = tw.div`
  cursor-pointer
	m-1
	p-2
	border-1
	border-white
	rounded-lg
	bg-blue-100
	text-blue-600
	font-normal
`

const LabelSection = tw.div`
	flex
	flex-wrap
	w-4/6
	h-2/6
	m-4
	p-4
	border
	border-gray-300
	rounded-lg
	shadow-lg
`


class InstrumentTag extends React.Component {
	constructor(props) {
		super(props);

		this.state = {
			data: null,
			selectedTags: [],			
		};
	}

	componentDidMount(){
		this.fetchData();
	}

	fetchData = () => {
		fetch(apiEndpoint+'/instruments')
			.then(res => res.json())
			.then(data => this.setState({ data: data.data }));
	}

	render() {
		console.log(this.state.data);
		let data = this.state.data;
		let selectedTags = this.state.selectedTags;
		
    return(
      <>
				<Section>
					<SectionHeading>List of the Intruments Selected</SectionHeading>
					<LabelSection>
						 { data !== null ? data.map(elem => (
							<TagLabel key={elem.id}>{elem.name}</TagLabel>
						)) : ''} 
					</LabelSection>
				</Section>
        
				<Section>
					<SectionHeading>List of the Intruments Available</SectionHeading>
					<LabelSection>
						 { selectedTags !== null ? '' :'' }
					</LabelSection>
				</Section>

				
      </>
    );
    
	}
}

export default InstrumentTag;
