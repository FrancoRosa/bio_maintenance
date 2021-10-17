import React, { useEffect, useState } from "react";
import {
  getAreas,
  getCriticalLevels,
  getDevices,
  getFacilities,
} from "../helpers/api";
import { getNameById, getParentName } from "../helpers/extra";

const App = () => {
  const [facilities, setFacilities] = useState([]);
  const [areas, setAreas] = useState([]);
  const [devices, setDevices] = useState([]);
  const [criticalLevels, setCriticalLevels] = useState([]);
  const [filteredDevices, setFilteredDevices] = useState([]);

  useEffect(() => {
    getFacilities().then((res) => {
      setFacilities(res);
      console.log(res);
    });

    getAreas().then((res) => {
      setAreas(res);
      console.log(res);
    });

    getDevices().then((res) => {
      setDevices(res);
      setFilteredDevices(res);
      console.log(res);
    });

    getCriticalLevels().then((res) => {
      setCriticalLevels(res);
      console.log(res);
    });
  }, []);

  return (
    <>
      <div className="columns mt-4">
        <div className="column">
          <div className="field">
            <label className="label">Facilities</label>
            <div className="control">
              <div className="select">
                <select>
                  {facilities.map((f) => (
                    <option value={f.id}>{f.name}</option>
                  ))}
                </select>
              </div>
            </div>
          </div>
        </div>

        <div className="column">
          <div className="field">
            <label className="label">Areas</label>
            <div className="control">
              <div className="select">
                <select>
                  {areas.map((f) => (
                    <option value={f.id}>{f.name}</option>
                  ))}
                </select>
              </div>
            </div>
          </div>
        </div>

        <div className="column">
          <div className="field">
            <label className="label">Filter</label>
            <div className="control">
              <input type="text" className="input" />
            </div>
          </div>
        </div>
      </div>

      <table class="table">
        <thead>
          <tr>
            <th>Nro</th>
            <th>Ubicacion</th>
            <th>Area</th>
            <th>Denominacion</th>
            <th>Marca</th>
            <th>Modelo</th>
            <th>Serie</th>
            <th>Criticidad</th>
            <th>UltimoMan</th>
          </tr>
        </thead>
        <tbody>
          {filteredDevices.map((d, i) => (
            <tr>
              <td>{i}</td>
              <td>{getParentName(facilities, areas, d.area_id)}</td>
              <td>{getNameById(areas, d.area_id)}</td>
              <td>{d.name}</td>
              <td>{d.brand}</td>
              <td>{d.model}</td>
              <td>{d.serial}</td>
              <td>{getNameById(criticalLevels, d.critical_level_id)}</td>
              <td>{d.last_maintenance}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </>
  );
};

export default App;
