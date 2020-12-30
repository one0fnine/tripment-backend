import React, { useState, useEffect } from 'react';

const Dash  = () => {
  const [data, setData] = useState([]);

  useEffect(() => { fetchData(); }, []);

  const fetchData = async () => {
    const response = await fetch('api/v1/procedures');
    const result = await response.json();
    setData(result.data);
  }

  return (
    <div className="vw-100 vh-100 primary-color d-flex justify-content-center">
      <div className="jumbotron jumbotron-fluid bg-transparent">
        <div className="container secondary-color">
          <h1 className="display-4">Procedures</h1>
          <hr className="my-4" />
          <ul className="list-group">
            {data.map((record) => (
              <li key={record.id} className="list-group-item">
                {record.attributes.name}
              </li>
            ))}
          </ul>
        </div>
      </div>
    </div>
  )
}

export default Dash;
