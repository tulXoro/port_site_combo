<script lang="ts">
  import { onMount } from 'svelte';

  let cmdHistory: string[] = [];
  let field: string = '';

  let userTyped: string = '';

  let prevCmds: string[] = [];
  let prevCmdIndex: number = 0;

  const handleKeyDown = (e: KeyboardEvent) => {
    const key = e.key;

    switch(key) {
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

</script>

<div>
  <input type="text" class="bg-black text-white w-full" bind:value={field} /> {blinkingRectangle}
</div>
