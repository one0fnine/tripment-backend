import React, { useReducer } from 'react'
import axios from 'axios'

import { FETCH_DATA, FILTER_DATA, HIDE_LOADER, SHOW_LOADER } from '../types'
import ApiContext from './apiContext'
import apiReducer from './apiReducer'

const procedures_path = '/api/v1/procedures'

const ApiState = ({ children }) => {
  const initialState = {
    data: [],
    loading: false,
  }

  const [state, dispatch] = useReducer(apiReducer, initialState)

  const showLoader = () => dispatch({ type: SHOW_LOADER })

  const fetchData = async (filter = null, type = FETCH_DATA) => {
    showLoader()
    const CancelToken = axios.CancelToken
    const source = CancelToken.source()
    const headers = { contentType: 'application/json', accept: 'application/json' }
    const params = filter ? { 'filter[name]': filter } : {}
    const result = await axios.get(`${procedures_path}`, {
      params: params,
      headers: headers,
      cancelToken: source.token,
    })
    const payload = await result.data.data
    dispatch({
      type: type,
      payload,
    })
    hideLoader()
    source.cancel()
  }

  const filterData = async (filter) => {
    fetchData(filter, FILTER_DATA)
  }

  const hideLoader = () => dispatch({ type: HIDE_LOADER })

  return (
    <ApiContext.Provider value={{ fetchData, filterData, ...state }}>
      {children}
    </ApiContext.Provider>
  )
}

export default ApiState
