# Print an optspec for argparse to handle cmd's options that are independent of any subcommand.
function __fish_leetrs_global_optspecs
	string join \n h/help
end

function __fish_leetrs_needs_command
	# Figure out if the current invocation already has a command.
	set -l cmd (commandline -opc)
	set -e cmd[1]
	argparse -s (__fish_leetrs_global_optspecs) -- $cmd 2>/dev/null
	or return
	if set -q argv[1]
		# Also print the command, so this can be used to figure out what it is.
		echo $argv[1]
		return 1
	end
	return 0
end

function __fish_leetrs_using_subcommand
	set -l cmd (__fish_leetrs_needs_command)
	test -z "$cmd"
	and return 1
	contains -- $cmd[1] $argv
end

complete -c leetrs -n "__fish_leetrs_needs_command" -s h -l help -d 'Print help'
complete -c leetrs -n "__fish_leetrs_needs_command" -f -a "auth" -d 'Authenticate with LeetCode'
complete -c leetrs -n "__fish_leetrs_needs_command" -f -a "tui" -d 'Launch the TUI (Placeholder for now)'
complete -c leetrs -n "__fish_leetrs_needs_command" -f -a "status" -d 'Check auth status'
complete -c leetrs -n "__fish_leetrs_needs_command" -f -a "pick" -d 'Pick a problem'
complete -c leetrs -n "__fish_leetrs_needs_command" -f -a "submit" -d 'Submit a problem to leetcode'
complete -c leetrs -n "__fish_leetrs_needs_command" -f -a "completion" -d 'Setup autocomplete for shell'
complete -c leetrs -n "__fish_leetrs_needs_command" -f -a "version" -d 'Check leetrs version'
complete -c leetrs -n "__fish_leetrs_needs_command" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c leetrs -n "__fish_leetrs_using_subcommand auth" -s h -l help -d 'Print help'
complete -c leetrs -n "__fish_leetrs_using_subcommand tui" -s h -l help -d 'Print help'
complete -c leetrs -n "__fish_leetrs_using_subcommand status" -s h -l help -d 'Print help'
complete -c leetrs -n "__fish_leetrs_using_subcommand pick" -s p -l preview
complete -c leetrs -n "__fish_leetrs_using_subcommand pick" -s h -l help -d 'Print help'
complete -c leetrs -n "__fish_leetrs_using_subcommand submit" -s h -l help -d 'Print help'
complete -c leetrs -n "__fish_leetrs_using_subcommand completion" -s h -l help -d 'Print help'
complete -c leetrs -n "__fish_leetrs_using_subcommand version" -s h -l help -d 'Print help'
complete -c leetrs -n "__fish_leetrs_using_subcommand help; and not __fish_seen_subcommand_from auth tui status pick submit completion version help" -f -a "auth" -d 'Authenticate with LeetCode'
complete -c leetrs -n "__fish_leetrs_using_subcommand help; and not __fish_seen_subcommand_from auth tui status pick submit completion version help" -f -a "tui" -d 'Launch the TUI (Placeholder for now)'
complete -c leetrs -n "__fish_leetrs_using_subcommand help; and not __fish_seen_subcommand_from auth tui status pick submit completion version help" -f -a "status" -d 'Check auth status'
complete -c leetrs -n "__fish_leetrs_using_subcommand help; and not __fish_seen_subcommand_from auth tui status pick submit completion version help" -f -a "pick" -d 'Pick a problem'
complete -c leetrs -n "__fish_leetrs_using_subcommand help; and not __fish_seen_subcommand_from auth tui status pick submit completion version help" -f -a "submit" -d 'Submit a problem to leetcode'
complete -c leetrs -n "__fish_leetrs_using_subcommand help; and not __fish_seen_subcommand_from auth tui status pick submit completion version help" -f -a "completion" -d 'Setup autocomplete for shell'
complete -c leetrs -n "__fish_leetrs_using_subcommand help; and not __fish_seen_subcommand_from auth tui status pick submit completion version help" -f -a "version" -d 'Check leetrs version'
complete -c leetrs -n "__fish_leetrs_using_subcommand help; and not __fish_seen_subcommand_from auth tui status pick submit completion version help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
