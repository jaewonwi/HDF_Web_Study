$(document).ready(function () {
  initKanbanBoard();
});

function initKanbanBoard() {
  bindAddButtonEvent();
  bindDragAndDropEvents();
  updateAllColumnCounts();
}

function bindAddButtonEvent() {
  $('#todo-form').on('submit', function (event) {
    event.preventDefault();

    // TODO: 입력값을 읽고, createTodoCard()와 addTodoToColumn()을 호출하세요.
    let todoData = getFormData();
    
    if (!validateTodoData(todoData)){
      alert('값을 입력해주세요.');
      return false;
    }

    let todoCard = createTodoCard(todoData);
    addTodoToColumn(todoData.type, todoCard);
  });
}

function bindDragAndDropEvents() {
  // TODO: .todo-card 요소에 dragstart/dragend 이벤트를 연결하세요.
  $(document).on('dragstart', '.todo-card', handleDragStart);
  $(document).on('dragend', '.todo-card', handleDragEnd);

  // TODO: .todo-list 요소에 dragover/drop/dragleave 이벤트를 연결하세요.
  $('.todo-list').on('dragover', handleDragOver);
  $('.todo-list').on('drop', handleDrop);
  $('.todo-list').on('dragleave', handleDragLeave);
}

function getFormData() {
  // TODO: Type, Title, Description 값을 객체 형태로 반환하세요.
  let type = $('#todo-type option:selected').text();
  let title = $('#todo-title').val();
  let description = $('#todo-description').val();

  let todoData = {
    "type":type,
    "title":title,
    "description":description,
  }

  return todoData;
}

function validateTodoData(todoData) {
  // TODO: Title과 Description 입력값이 비어있는지 검사하세요.
  if (todoData.type != "" && todoData.title != "" && todoData.description != "") return true;
}

function createTodoCard(todoData) {
  // 드래그 가능한 TODO 카드 jQuery 객체를 생성해서 반환
  const $card = $('<div>').attr({
    "class": "todo-card",
    "draggable": true,
    "data-type": todoData.type
  });
  $card.append($('<h3>').text(todoData.title));
  $card.append($('<p>').text(todoData.description));
  
  return $card;
}

function addTodoToColumn(type, todoCard) {
  // 선택한 Type의 컬럼에 TODO 카드를 추가
  $('.kanban-column').each(function () {
    const columnType = $(this).find('.column-header h2').text().trim();
    let columnCnt = parseInt($(this).find('.column-header > .item-count').text());

    if (columnType == type) {
      $(this).find('.todo-list').append(todoCard);
      $(this).find('.column-header > .item-count').text(columnCnt+1);
      return false;
    }
  });
}

function clearForm() {
  // Form 입력 초기화
}

function handleDragStart(event) {
  $(this).addClass('dragging').css('opacity', '0.5').data('dragging', true);

  const dataTransfer = event.originalEvent && event.originalEvent.dataTransfer;
  if (dataTransfer) {
    dataTransfer.effectAllowed = 'move';
    dataTransfer.setData('text/plain', $(this).attr('data-type'));
  }
  // TODO: 드래그 중인 카드 정보를 저장하세요.
}

function handleDragEnd(event) {
  $(this).removeClass('dragging').css('opacity', '').removeData('dragging');
  $('.todo-list').removeClass('drag-over');

  const dataTransfer = event.originalEvent && event.originalEvent.dataTransfer;
  if (dataTransfer) {
    dataTransfer.clearData();
  }
}

function handleDragOver(event) {
  // TODO: drop이 가능하도록 기본 동작을 막고, 컬럼 강조 스타일을 적용하세요.
  event.preventDefault();
  $(this).addClass('drag-over');

  const dataTransfer = event.originalEvent && event.originalEvent.dataTransfer;
  if (dataTransfer) {
    dataTransfer.dropEffect = 'move';
  }
}

function handleDragLeave(event) {
  $(this).removeClass('drag-over');
  // TODO: 컬럼 강조 스타일을 제거하세요.
  
}

function handleDrop(event) {
  event.preventDefault();

  const $todoList = $(this);
  const $draggedCard = $('.todo-card.dragging');

  if (!$draggedCard.length) {
    return;
  }

  const newType = $todoList.closest('.kanban-column').attr('data-type');
  updateTodoType($draggedCard, newType);
  $todoList.append($draggedCard);
  $todoList.removeClass('drag-over');
  updateAllColumnCounts();
  // TODO: 드래그 중인 TODO 카드를 현재 컬럼으로 이동시키고 Type을 변경하세요.
}

function updateTodoType(todoCard, newType) {
  $(todoCard).attr('data-type', newType);
  // TODO: 카드의 data-type 값을 새 Type으로 변경하세요.
}

function updateAllColumnCounts() {
  $('.kanban-column').each(function () {
    updateColumnCount($(this).attr('data-type'));
  });
  // TODO: 모든 컬럼의 카드 개수를 다시 계산하세요.
}

function updateColumnCount(type) {
  const $column = $('.kanban-column[data-type="' + type + '"]');
  const count = $column.find('.todo-card').length;
  $column.find('.item-count').text(count);
  // TODO: 특정 Type 컬럼의 카드 개수를 계산해서 화면에 표시하세요.
}
