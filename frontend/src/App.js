import React, { useState, useEffect } from "react";
import "./App.css";

const restUrl = "https://api." + window.location.hostname + "/python";

function App() {
  const [apiData, setApiData] = useState({});

  useEffect(() => {
    getRestWithFetch();
  }, []);

  const getRestWithFetch = async () => {
    const response = await fetch(restUrl);
    const jsonData = await response.json();
    console.log(jsonData);
    setApiData(jsonData);
  };

   return (
    <div className="App">
      <header className="App-header">
        <h2>How is the world?</h2>
        <div className="user-container">
        <h5>Response from python-service through the API gateway https://api.&#123;default&#125;/python :</h5>

        <h2 className="info-item">{apiData.the_world}</h2>
      </div>
      </header>

    </div>
  );
}

export default App;

