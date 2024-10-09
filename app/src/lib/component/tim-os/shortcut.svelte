<script>
	import { createEventDispatcher } from "svelte";

	export let name = 'null';
	export let icon = 'https://via.placeholder.com/50';
	export let window = 'null';

	export let selected = false;
	let hovered = false;

	const dispatch = createEventDispatcher();

	function handleClick() {
		dispatch('click', { name });
	}

</script>

<button class="grid hover:bg-slate-600 hover:bg-opacity-75 w-24 h-20" on:click={handleClick}>
	<img class="m-auto" src="{icon}" alt="Placeholder" />
	<span class="text-center">{name}</span>
</button>
