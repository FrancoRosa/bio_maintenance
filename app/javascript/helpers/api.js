import axios from "axios";

// export const startControlledPump = async (pump) => {
//   console.log("... starting controlled pump");
//   const { id, pulses, timeout } = pump;
//   const url = `http://${host}:9999/api/startcontrolled`;
//   const response = await axios.post(url, { id, pulses, timeout });
//   return response.data;
// };

export const getFacilities = async () => {
  console.log("... retrieving facilities");
  const url = "/facilities.json";
  const response = await axios.get(url);
  return response.data;
};

export const getDevices = async () => {
  console.log("... retrieving devices");
  const url = "/devices.json";
  const response = await axios.get(url);
  return response.data;
};

export const getAreas = async () => {
  console.log("... retrieving areas");
  const url = "/areas.json";
  const response = await axios.get(url);
  return response.data;
};

export const getCriticalLevels = async () => {
  console.log("... retrieving critical levels");
  const url = "/critical_levels.json";
  const response = await axios.get(url);
  return response.data;
};
