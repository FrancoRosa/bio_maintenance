export const getNameById = (arr, id) => {
  const result = arr.filter((obj) => obj.id == id)[0];
  return result?.name;
};

export const getParentName = (facilities, areas, id) => {
  const area = areas.filter((a) => a.id == id)[0];
  const facility = facilities.filter((f) => f.id == area.facility_id)[0];
  return facility?.name;
};

export const getProximity = (device, criticalLevels) => {
  const threshold = 15;
  const frequency = criticalLevels.find(
    (c) => c.id === device.critical_level_id
  ).frecuency;
  const days = frequency * 30;
  const millisInDay = 24 * 60 * 60 * 1000;
  const lastMaintenance = new Date(device.last_maintenance);
  const nextMaintenance = lastMaintenance.getTime() + days * millisInDay;
  console.log("lastMaintenance", lastMaintenance);
  console.log("nextMaintenance", nextMaintenance);
  const diffDays = parseInt((nextMaintenance - Date.now()) / millisInDay);
  console.log("diff:", diffDays);
};
