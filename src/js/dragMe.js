require('webpack-jquery-ui/draggable');
require('webpack-jquery-ui/css');

export function dragMe({
  draggableItem = 'string',
  draggableContainer = 'string',
}) {
  $(draggableItem).draggable({
    revertDuration: 100,
    containment: 'window',
    revert: function() {
      const parent = $(this).parents(draggableContainer);

      const leaveLeft = $(this).offset().left < parent.offset().left;
      const leaveTop = $(this).offset().top < parent.offset().top;
      const leaveRight =
        $(this).offset().left + $(this).width() >
        parent.offset().left + parent.width();
      const leaveBottom =
        $(this).offset().top + $(this).height() >
        parent.offset().top + parent.height();

      return leaveLeft || leaveTop || leaveRight || leaveBottom;
    },
  });
}
