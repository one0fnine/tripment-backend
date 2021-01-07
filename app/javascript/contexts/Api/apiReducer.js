import { FETCH_DATA, FILTER_DATA, HIDE_LOADER, SHOW_LOADER, UPDATE_DATA } from '../types'

const handlers = {
  [FETCH_DATA]: (state, { payload }) => ({ ...state, data: payload }),
  [FILTER_DATA]: (state, { payload }) => ({ ...state, data: payload }),
  [HIDE_LOADER]: (state) => ({ ...state, loading: false }),
  [UPDATE_DATA]: (state) => ({ ...state }),
  [SHOW_LOADER]: (state) => ({ ...state, loading: true }),
  DEFAULT: (state) => state,
}

const apiReducer = (state, action) => {
  const handle = handlers[action.type] || handlers.DEFAULT

  return handle(state, action)
}

export default apiReducer
