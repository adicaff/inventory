window.onload = function() {
  document.getElementById('print_img').onclick = function() {
    print_page();
  };
};

function print_page()
{
  window.print()
}