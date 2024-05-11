export default (dateTime) => {
  const date = new Date(dateTime);
  return date.toLocaleString();
};
