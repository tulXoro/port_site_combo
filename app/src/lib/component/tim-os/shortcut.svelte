<script>
	export let name = 'null';
	export let icon = 'https://via.placeholder.com/50';

	export let selected = false;
	let hovered = false;
</script>

<button class="grid hover:bg-slate-600 hover:bg-opacity-75 w-24 h-20">
	<img class="m-auto" src="{icon}" alt="Placeholder" />
	<span class="text-center">{name}</span>
</button>
