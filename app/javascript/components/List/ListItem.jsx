import React from 'react'

const ListItem = ({ id, name }) => (
  <>
    <li className='list-group-item' key={id}>
      {name}
    </li>
  </>
)

export default ListItem
