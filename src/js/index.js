import 'bootstrap';

import '../scss/index.scss';
import { dragMe } from './dragMe';

dragMe({
  draggableItem: '.draggable',
  draggableContainer: '.draggable-container',
});
