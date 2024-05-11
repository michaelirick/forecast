import React, { useState } from 'react';
import {
  Form, Button
} from 'semantic-ui-react';

const ForecastForm = ({loading, onSubmit}) => {
  // input fields, street, city, state, zipCode
  const [street, setStreet] = useState("1 Bass Pro Drive");
  const [city, setCity] = useState("Memphis");
  const [state, setState] = useState("TN");
  const [zipCode, setZipCode] = useState("38105");

  return (
    <Form onSubmit={() => onSubmit({street, city, state, zipCode})} loading={loading}>
      <Form.Input
        label="Enter Address"
        placeholder="Street"
        value={street}
        onChange={(e) => setStreet(e.target.value)}
      />
      <Form.Input
        label="Enter City"
        placeholder="City"
        value={city}
        onChange={(e) => setCity(e.target.value)}
      />
      <Form.Input
        label="Enter State"
        placeholder="State"
        value={state}
        onChange={(e) => setState(e.target.value)}
      />
      <Form.Input
        label="Enter Zip Code"
        placeholder="Zip Code"
        value={zipCode}
        onChange={(e) => setZipCode(e.target.value)}
      />
      <Button primary type="submit">
        Get Forecast
      </Button>
    </Form>
  );
};

export {ForecastForm};
