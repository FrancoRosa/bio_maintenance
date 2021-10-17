export const getNameById = (arr, id) => {
  const result = arr.filter((obj) => obj.id == id)[0];
  console.log("result", result);
  return result?.name;
};

export const getParentName = (facilities, areas, id) => {
  const area = areas.filter((a) => a.id == id)[0];
  const facility = facilities.filter((f) => f.id == area.facility_id)[0];
  return facility?.name;
};
