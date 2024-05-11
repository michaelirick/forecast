import React from 'react';
import { useForecast } from './use_forecast';
import { ForecastTabPane } from './forecast_tab_pane';
import { ForecastForm } from './forecast_form';
import {
  Tab, Container, Header, Segment, Message, List
} from 'semantic-ui-react';


const App = () => {
  const {
    loading,
    error,
    weather,
    fetchWeather
  } = useForecast();

  const panes = [
    { menuItem: 'Hourly', render: () => <ForecastTabPane periods={weather.hourly.properties.periods.slice(1, 12)}/> },
    { menuItem: 'Extended', render: () => <ForecastTabPane periods={weather.extended.properties.periods.slice(13)} /> }
  ];  

  return (
    <Container>
      <Header as="h1" textAlign="center">
        Weather Forecast
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
              <strong>Temperature ({weather.current.temperatureUnit}):</strong> {weather.current.temperature}°
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
