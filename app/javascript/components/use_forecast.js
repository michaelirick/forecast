import {useState} from 'react'
import axios from 'axios'

const useForecast = () => {
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState(null);
  const [weather, setWeather] = useState(null);

  const fetchWeather = async ({street, city, state, zipCode}) => {
    setLoading(true);
    setError('');
    setWeather(null);
    axios.get('/api/v1/forecast', {
      params: {
        street,
        city,
        state,
        zip: zipCode
      }
    }).then((response) => {
      setLoading(false);
      const data = response.data;
      console.log(data);
      setWeather({
        ...data,
        current: data.hourly.properties.periods[0]
      });
    }).catch((error) => {
      setLoading(false);
      setError(error);
    });
  };  

  return {
    loading,
    error,
    weather,
    fetchWeather
  }
}

export {useForecast};