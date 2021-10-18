export const toDateTime = (timestamp) => {
  const time = new Date(timestamp);
  return time.toLocaleString("sv-SE");
};

export const toDate = (timestamp) => {
  const time = new Date(timestamp);
  return time.toLocaleString("sv-SE");
};

export const toStrDate = (dateObj) => {
  return dateObj.toLocaleString("sv-SE").split(" ")[0];
};

export const toTime = (timestamp) => {
  const time = new Date(timestamp);
  return time.toLocaleString("sv-SE").split(" ")[1];
};

export const getNameById = (arr, id) => {
  const result = arr.filter((obj) => obj.id == id)[0];
  return result?.name;
};

export const getParentName = (facilities, areas, id) => {
  const area = areas.filter((a) => a.id == id)[0];
  const facility = facilities.filter((f) => f.id == area.facility_id)[0];
  return facility?.name;
};

export const getTimeStatus = (device, criticalLevels) => {
  const threshold = 15;
  const frequency = criticalLevels.find(
    (c) => c.id === device.critical_level_id
  ).frecuency;
  const days = frequency * 30;
  const millisInDay = 24 * 60 * 60 * 1000;
  const lastMaintenance = new Date(device.last_maintenance);
  const nextMaintenance = lastMaintenance.getTime() + days * millisInDay;
  const diffDays = parseInt((nextMaintenance - Date.now()) / millisInDay);
  if (diffDays < 0) return "danger";
  if (diffDays <= threshold) return "warning";
  if (diffDays > threshold) return "success";
};

export const getNextMaintenance = (device, criticalLevels) => {
  const frequency = criticalLevels.find(
    (c) => c.id === device.critical_level_id
  ).frecuency;
  const days = frequency * 30;
  const millisInDay = 24 * 60 * 60 * 1000;
  const lastMaintenance = new Date(device.last_maintenance);
  const nextMaintenance = lastMaintenance.getTime() + days * millisInDay;
  return toStrDate(new Date(nextMaintenance));
};
