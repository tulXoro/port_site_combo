<script lang="ts">
	import { createEventDispatcher } from 'svelte';
	export let name: string | null = null;

	const dispatch = createEventDispatcher();

	function closeWindow() {
		dispatch('close', { name });
	}
</script>

<div class="bg-gray-800 absolute z-100 left-1/2 transform -translate-x-1/2 mt-10">
	<!-- Top bar -->
	<div class="flex justify-between items-center p-4">
		<div class="flex items-center space-x-4 md:w-96 w-52">
			<button class="bg-red-500 h-3 w-4 rounded-full hover:bg-red-300" on:click={closeWindow} />
			<button
				class="bg-yellow-500 h-3 w-4 rounded-full hover:bg-yellow-300"
				on:click={closeWindow}
			/>
			<button class="bg-green-500 h-3 w-4 rounded-full hover:bg-green-300" on:click={closeWindow} />
			<span class="text-neutral-50 text-center select-none w-full">{name}</span>
		</div>
	</div>

	<slot />
</div>
