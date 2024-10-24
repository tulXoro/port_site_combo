<script lang="ts">
	import { text } from '@sveltejs/kit';
	import { onMount } from 'svelte';

	let cmdHistory: string[] = ["A", "B", "C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","AA","BB","CC","DD","EE","FF","GG","HH","II","JJ","KK","LL","MM","NN","OO","PP","QQ","RR","SS","TT","UU","VV","WW","XX","YY","ZZ","AAA","BBB","CCC","DDD","EEE","FFF","GGG","HHH","III"];
	let field: string = '';

	let userTyped: string = '';

	let prevCmds: string[] = [];
	let prevCmdIndex: number = 0;

	const handleKeyDown = (e: KeyboardEvent) => {
		const key = e.key;

		switch (key) {
			case 'Backspace':
				userTyped = userTyped.slice(0, -1);
				break;

			default:
				userTyped += key;
				break;
		}
	};

	const rect = '▍';

	let blinkingRectangle = rect;

	let isTyping = false;

	let blinkAnimationFrameId;
	let lastTimestamp = 0;

	const updateBlinkingRectangle = (timestamp: number) => {
		const blinkSpeed = 500; // milliseconds
		if (timestamp - lastTimestamp >= blinkSpeed) {
			if (!isTyping) blinkingRectangle = blinkingRectangle === rect ? '' : rect;
			else blinkingRectangle = rect;
			lastTimestamp = timestamp;
		}
		blinkAnimationFrameId = requestAnimationFrame(updateBlinkingRectangle);
	};

	onMount(() => {
		// Start the blinking cursor animation
		blinkAnimationFrameId = requestAnimationFrame(updateBlinkingRectangle);
	});

	let textbox: HTMLDivElement;

	function handleFocus(event) {
		let content = textbox.innerText;
		textbox.innerText = '';
		textbox.innerText = content;
	}
</script>

<div class="flex flex-col text-white font-mono h-full">
	<div class="pt-3 pl-3 bg-black flex-1 overflow-auto">
		<span>Type 'help' for a list of available commands.</span>
		{#each cmdHistory as cmd}
			<div>{cmd}</div>
		{/each}
	</div>
	<div class="inline-flex pl-3 bg-black">
		<label for="prompt" class="mr-1">
			<span>user@website:~$</span>
		</label>
		<input
			id="prompt"
			type="text"
			class="bg-black text-white border-none outline-none caret-neutral-50 w-full pb-1"
			bind:value={field}
			on:keydown={handleKeyDown}
			bind:this={textbox}
		/>
	</div>
</div>
