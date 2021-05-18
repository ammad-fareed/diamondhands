// api endpoints
export const apiEndpoint = 'http://localhost:3000/api/v1';

// view helpers

export const upcase = (string) => {
  return string.toUpperCase();
}

export const filterOutOldData = (dataArr, currentElement) => {
  return dataArr.filter(data => (data.name !== currentElement.name));
}

export const initialDataList = (dataArr, selectedTags) => {
  selectedTags != [] ? selectedTags.forEach(element => {
    dataArr = dataArr.filter(data => data.name !== element.name)
  }) : dataArr;
  return dataArr;
}
