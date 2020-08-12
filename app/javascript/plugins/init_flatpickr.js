import flatpickr from "flatpickr";
import 'flatpickr/dist/flatpickr.css';

const initFlatpickr = () => {
  const flatInstances = document.querySelectorAll('.flatpickr');
  flatpickr(flatInstances, {});
}

export {initFlatpickr}
