<script lang="ts">

	let cmdHistory: string[] = $state([]);
	let field: string = $state('');

	let userTyped: string = '';

	let prevCmds: string[] = [];
	let prevCmdIndex: number = 0;

	const handleKeyDown = (e: KeyboardEvent) => {
		const key = e.key;

		switch (key) {
			case 'Backspace':
				userTyped = userTyped.slice(0, -1);
				break;
      case 'Enter':
				handleSend();
        break;
      
			default:
      const isAlphanumeric = e.code.startsWith('Key') || e.code.startsWith('Digit');
      if (isAlphanumeric)
				userTyped += key;

			break;
		}
	};

	const handleSend = () => {
		if (userTyped === '') return;
		cmdHistory = [...cmdHistory, "> "+userTyped];
        field = '';
        userTyped = '';
	}


</script>

<div class="flex flex-col text-white font-mono h-full">
	<div class="pt-3 pl-3 bg-black flex-1 overflow-auto">
		<span>Type 'help' for a list of available commands.</span>
		{#each cmdHistory as cmd}
			<div>{cmd}</div>
		{/each}
	</div>
	<div class="inline-flex pl-3 bg-black border-zinc-800 border-2">
		<label for="prompt" class="mr-1">
			<span class="mr-1">></span>
		</label>
		<input
			id="prompt"
			type="text"
			class="bg-black text-white border-none outline-none caret-neutral-50 w-full pb-1 "
			bind:value={field}
			onkeydown={handleKeyDown}

		/>
		<button class="bg-slate-500" onclick={handleSend} >SEND</button>
	</div>
</div>
