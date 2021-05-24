import React from 'react';
import _ from 'lodash';
import { apiEndpoint, upcase, filterOutOldData, initialDataList } from '../util/helpers';
import styled from 'styled-components';

// styled components
const Section = styled.section`
	flex
	flex-col
	items-center
	justify-center
	w-full
	m-5
	p-10
`

const SectionHeading = styled.h1`
	text-xl
	text-gray-600
	font-thinner
`

const TagLabel = styled.div`
  cursor-pointer
	m-1
	p-2
	border-1
	border-white
	rounded-lg
	${props => props.selected ? 'bg-blue-100 text-blue-600 hover:bg-blue-800' : 'bg-green-100 text-green-600 hover:bg-green-800' }	
	font-normal
	hover:text-white
	hover:font-bold
	hover:shadow-lg
`

const LabelSection = styled.div`
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
			user: this.props.user
		};
	}

	componentDidMount(){
		this.fetchData()
	}

	fetchData = () => {
		// fetching the all instruments list
		fetch(apiEndpoint+'/instruments')
			.then(res => res.json())
			.then(data => this.setState({ data: data.data }))
			.catch(error => console.error(error));

		// fetching the selected tags if any 
		fetch(apiEndpoint+'/selected-instruments', {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json'
			},
			body: JSON.stringify({ user_id: this.state.user.id })
		})
		.then(res => res.json() )
		.then(data => this.setState({ selectedTags: data }))
		.catch(error => console.error(error));
	}

	addTagToSelected(elem){
		// setting newly filterd data after every new addition
		let filterdData= filterOutOldData(this.state.data, elem);
		this.setState({ data: filterdData });
		
		let newResultList = this.state.selectedTags.concat(elem);
		this.setState({ selectedTags: newResultList });
		
		fetch(apiEndpoint+'/instruments', {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json'
			},
			body: JSON.stringify({ data: { name: elem.name, id: elem.id, user_id: this.state.user.id, tag_type_id: elem.tag_type_id }})
		})
	}

	render() {
		let data = initialDataList(this.state.data, this.state.selectedTags);		
    return(
			<>
			
				<Section>
					<SectionHeading>List of the Intruments Available</SectionHeading>
					<LabelSection>
							{ data !== null ? data.map(elem => (
							<TagLabel key={elem.id} selected={true} onClick={()=> this.addTagToSelected(elem) }>{ upcase(elem.name) }</TagLabel>
						)) : ''} 
					</LabelSection>
				</Section>
				
				<Section>
					<SectionHeading>List of the Intruments Selected</SectionHeading>
					<LabelSection>
							{ this.state.selectedTags != [] ? this.state.selectedTags.map((elem, key) => (  
								<TagLabel key={key} >{upcase(elem.name)}</TagLabel>
							))  : 'There are no selected tags' }
					</LabelSection>
				</Section>
		
      </>
    );
    
	}
}

export default InstrumentTag;
