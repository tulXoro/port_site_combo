<script lang='ts'>
	// TODO: edit to change focusing
	import { createEventDispatcher } from "svelte";
	interface Props {
		name?: string | null;
		icon?: string;
	}

	let { name = null, icon = 'https://via.placeholder.com/50' }: Props = $props();

	const dispatch = createEventDispatcher();

	function handleClick() {
		dispatch('click', { name });
	}

</script>

<button class="grid hover:bg-slate-600 hover:bg-opacity-75 w-24 h-20" onclick={handleClick}>
	<img class="m-auto" src="{icon}" alt="Placeholder" />
	<span class="text-center">{name}</span>
</button>
