import React from 'react';
import _ from 'lodash';
import { apiEndpoint, upcase } from '../util/helpers';
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
	${props => props.selected ? 'bg-green-100 text-green-600' : 'bg-blue-100 text-blue-600' }	
	font-normal
	hover:bg-blue-800
	hover:text-white
	hover:font-bold
	hover:shadow-lg
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

		fetch(apiEndpoint+'/selected-instruments', {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json'
			},
			body: JSON.stringify({ user_id: 1 })
		})
		.then(res => res.json() )
		.then(data => this.setState({ selectedTags: data }))
		.catch( error => console.error(error));
	}

	addTagToSelected(elem){
		let newResultList = this.state.selectedTags.concat(elem);
		this.setState({ selectedTags: newResultList });
		
		fetch(apiEndpoint+'/instruments', {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json'
			},
			body: JSON.stringify({ data: { name: elem.name, id: elem.id, user_id: 1, tag_type_id: elem.tag_type_id }})
		})
	}

	render() {
		console.log(this.state.data);
		let data = this.state.data;
		let selectedTags = this.state.selectedTags;
		console.log(selectedTags)

    return(
      <>
				<Section>
					<SectionHeading>List of the Intruments Available</SectionHeading>
					<LabelSection>
						 { data !== null ? data.map(elem => (
							<TagLabel key={elem.id} onClick={()=> this.addTagToSelected(elem) }>{ upcase(elem.name) }</TagLabel>
						)) : ''} 
					</LabelSection>
				</Section>
        
				<Section>
					<SectionHeading>List of the Intruments Selected</SectionHeading>
					<LabelSection>
						 { this.state.selectedTags != [] ? this.state.selectedTags.map(elem => (  
								<TagLabel selected={true} key={elem.id} >{upcase(elem.name)}</TagLabel>
						  ))  : 'There are no selected tags' }
					</LabelSection>
				</Section>
      </>
    );
    
	}
}

export default InstrumentTag;
