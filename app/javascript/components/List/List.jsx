import React from 'react'
import ListItem from './ListItem'

const List = ({ data }) => (
  <ul className='list-group list-group-flush'>
    {data.map(({ attributes, id }) => (
      <ListItem {...attributes} key={id} />
    ))}
  </ul>
)

export default List
