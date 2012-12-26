path=ARGV[1]

watch(path)  do |md|
  test
end

$running_pid = nil
def test
  Process.kill("INT", $running_pid) if $running_pid

  $running_pid = fork do
    puts
    puts
    puts
    `tmux set -g status-right "watchr: #[fg=white]RUNNING"`
    system(ARGV[2])
    `tmux set -g status-right "watchr: #[fg=green]DONE"`
  end
end
test
