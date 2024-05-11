import React, { useState } from 'react';
import axios from 'axios';
import { ForecastTabPane } from './forecast_tab_pane';
import { ForecastForm } from './forecast_form';
import {
  Tab, Container, Header, Segment, Message, List
} from 'semantic-ui-react';


const App = () => {


  // loading, error, weather, cached
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState(null);
  const [weather, setWeather] = useState(null);

  const panes = [
    { menuItem: 'Hourly', render: () => <ForecastTabPane periods={weather.hourly.properties.periods.slice(1, 12)}/> },
    { menuItem: 'Extended', render: () => <ForecastTabPane periods={weather.extended.properties.periods.slice(13)} /> }
  ];  

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

  return (
    <Container>
      <Header as="h1" textAlign="center">
        Weather Forecaster
      </Header>
      <Segment>
        <ForecastForm loading={loading} onSubmit={fetchWeather}/>
        {error && <Message error content={error} />}
      </Segment>
      {weather && (
        <Segment>
          {weather.cached ? <Message info content="Fetched from Cache" /> : <Message success content="Served fresh" />}
          <Header as="h2">Current Conditions</Header>
          <List>
            <List.Item>
              <strong>Temperature (F):</strong> {weather.current.temperature}
            </List.Item>
            <List.Item>
              <strong>Wind Speed:</strong> {weather.current.windSpeed} {weather.current.windDirection}
            </List.Item>
            <List.Item>
              <strong>Last Update:</strong> {weather.updated_at}
            </List.Item>
          </List>

          <Tab panes={panes} />

        </Segment>
        
      )}
    </Container>
  );
};

export default App;
