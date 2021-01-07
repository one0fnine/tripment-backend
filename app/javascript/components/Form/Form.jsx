import React, { useContext, useState } from 'react'
import ApiContext from '../../contexts/Api/apiContext'
import { debounce } from 'lodash'

const Form = () => {
  const [value, setValue] = useState('')
  const api = useContext(ApiContext)

  const handleDebounceChange = (event) => {
    const name = event.target.value
    debounce((name) => api.filterData(name), 500).call(this, name.trim().toLowerCase())
    setValue(event.target.value)
  }

  const handleSubmit = (event) => {
    event.preventDefault()
  }

  return (
    <form>
      <div className='mb-3'>
        <input
          type='text'
          className='form-control'
          placeholder='Medical procedure name'
          onChange={handleDebounceChange}
          onSubmit={handleSubmit}
          value={value}
        />
      </div>
    </form>
  )
}

export default Form
