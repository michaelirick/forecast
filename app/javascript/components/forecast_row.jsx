import React from 'react';
import {
  Table, Image
} from 'semantic-ui-react';
import {formatDateTime} from '../utils';

const ForecastRow = ({period}) => {
  const description = () => {
    var forecast = `${period.shortForecast}`;
    if(period.probabilityOfPrecipitation.value > 0) {
      forecast += ` (${period.probabilityOfPrecipitation.value}% precipitation)`;
    }

    return forecast;
  }

  return (
    <>
      <Table.Cell>{formatDateTime(period.startTime)}</Table.Cell>
      <Table.Cell>
        <Image src={period.icon.split(',')[0]} size="mini" />
      </Table.Cell>
      <Table.Cell>{period.temperature}° {period.temperatureUnit}</Table.Cell>
      <Table.Cell>{period.windSpeed} {period.windDirection}</Table.Cell>
      <Table.Cell>{description()}</Table.Cell>    
    </>
  )
};

export {ForecastRow};