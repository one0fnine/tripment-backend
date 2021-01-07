import React, { useContext, useEffect } from 'react'

import ApiContext from '../../contexts/Api/apiContext'
import Form from '../Form'
import List from '../List'
import Loader from '../Loader'

const App = () => {
  const { fetchData, data, loading } = useContext(ApiContext)

  useEffect(() => {
    fetchData()
  }, [])

  return (
    <div className='vw-100 vh-100 primary-color d-flex justify-content-center'>
      <div className='jumbotron jumbotron-fluid bg-transparent'>
        <div className='container secondary-color'>
          <h1 className='display-4'>Procedures</h1>
          <hr className='my-4' />
          <Form />
          <hr className='my-4' />
          {loading ? <Loader /> : <List data={data} />}
        </div>
      </div>
    </div>
  )
}

export default App
