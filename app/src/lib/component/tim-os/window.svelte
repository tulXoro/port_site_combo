<script lang="ts">
	import { createEventDispatcher } from 'svelte';
	interface Props {
		name?: string | null;
		children?: import('svelte').Snippet;
	}

	let { name = null, children }: Props = $props();

	const dispatch = createEventDispatcher();

	function closeWindow() {
		dispatch('close', { name });
	}
</script>

<div class="bg-gray-800 absolute z-100 left-1/2 transform -translate-x-1/2 mt-10 md:w-10/12 w-10/12 h-5/6 flex flex-col">
	<!-- Top bar -->
	<div class="flex justify-between items-center p-4">
		<div class="flex items-center space-x-4 w-full">
			<button class="bg-red-500 h-3 w-4 rounded-full hover:bg-red-300" onclick={closeWindow} aria-label="Close window"></button>
			<button
				class="bg-yellow-500 h-3 w-4 rounded-full hover:bg-yellow-300"
				onclick={closeWindow}
				aria-label="Minimize window"
			></button>
			<button class="bg-green-500 h-3 w-4 rounded-full hover:bg-green-300" onclick={closeWindow} aria-label="Maximize window"></button>
			<span class="text-neutral-50 text-center select-none w-full">{name}</span>
		</div>
	</div>

	<div class="flex-grow h-0 overflow-y-scroll">
		{@render children?.()}
	</div>

</div>
