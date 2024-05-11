import React from 'react';
import {
  Table, TabPane
} from 'semantic-ui-react';
import { ForecastRow } from './forecast_row';

const ForecastTabPane = ({periods}) => {
  return (
    <TabPane>
      <Table celled>
        <Table.Header>
          <Table.Row>
            <Table.HeaderCell>Time</Table.HeaderCell>
            <Table.HeaderCell>Icon</Table.HeaderCell>
            <Table.HeaderCell>Temp.</Table.HeaderCell>
            <Table.HeaderCell>Wind Speed</Table.HeaderCell>
            <Table.HeaderCell>Description</Table.HeaderCell>
          </Table.Row>
        </Table.Header>
        <Table.Body>
          {periods.map((period, index) => (
            <Table.Row key={index}>
              <ForecastRow period={period}/>
            </Table.Row>
          ))}
        </Table.Body>
      </Table>          
    </TabPane>
  );
}

export {ForecastTabPane};