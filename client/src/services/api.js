import axios from "axios"

// TODO: move to configuration
const BASE_URL = 'http://localhost:3001'
const PREFIX = 'api/v1'

export default {
  async googleCallback(code) {
    const { data } = await axios.post(`${BASE_URL}/${PREFIX}/auth/google_oauth2/callback?code=${code}`)
    return data
  },

  async secret(token) {
    const { data } = await axios.get(`${BASE_URL}/${PREFIX}/secrets`, {
      headers: {
        Authorization: 'Bearer ' + token
      }
    })
    return data
  }
}