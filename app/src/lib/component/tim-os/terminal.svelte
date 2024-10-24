<script lang="ts">
	import { text } from '@sveltejs/kit';
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

  let textbox: HTMLDivElement;

  function handleFocus(event) {
    
    let content = textbox.innerText;
    textbox.innerText = '';
    textbox.innerText = content;
  }


</script>

<div class="flex-row bg-black text-white p-5 hover:cursor-text font-mono h-full" role="button" tabindex="0" on:click={() => textbox.focus()} on:keydown={(e) => { if (e.key === 'Enter' || e.key === ' ') textbox.focus(); }}>

  <div>
    <span>Type 'help' for a list of availble commands.</span>
    {#each cmdHistory as cmd}
      <div>{cmd}</div>
    {/each}
  </div>
  <div class="">
    <span>
      
    </span>
    <input type="text" class="bg-black text-white border-none outline-none caret-neutral-50 w-full" bind:value={field} on:keydown={handleKeyDown} bind:this={textbox} />
    <!-- <div contenteditable="true" class="bg-slate-500 border-none outline-none caret-transparent" on:focus={handleFocus} bind:this={textbox} style="width: {textboxWidth};">
      {userTyped}
      <span contenteditable="false" class="select-none">{blinkingRectangle}</span> -->
    <!-- </div> -->


  </div>
</div>
