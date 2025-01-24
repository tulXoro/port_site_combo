<script lang="ts">
	import { Shortcut, Window, Terminal, Resume } from '$lib';

	let shortcuts = [
		{ name: 'Terminal' },
		{ name: 'Resume' },
		{ name: 'Projects' },
		{ name: 'Contact' },
		{ name: 'About' },
		{ name: 'Blog' },
		{ name: 'Experience' }
	];

	let window: string | null = $state(null);

	function handleOpenWindow(e: { detail: { name: any } }) {
		window = e.detail.name;
		console.log(window);
	}

	function handleCloseWindow() {
		window = null;
	}
</script>

<main class="h-screen w-screen bg-orange-400 top-0">
	{#if window}
		<Window name={window} on:close={handleCloseWindow}>
			{#if window === 'Terminal'}
				<Terminal />
			{:else if window === 'Resume'}
				<Resume />
			{/if}
		</Window>
	{/if}

	<ul
		class="grid md:gap-3 p-4 grid-cols-3 gap-4 w-full md:grid-cols-subgrid justify-items-center md:justify-start"
	>
		{#each shortcuts as shortcut}
			<li>
				<Shortcut name={shortcut.name} on:click={handleOpenWindow} />
			</li>
		{/each}
	</ul>

	<!-- Taskbar -->
	<div
		class="hidden md:flex absolute bottom-0 left-0 h-10 w-full bg-slate-600 items-center justify-between px-4"
	>
		<!-- Start Button -->
		<div class="flex items-center">
			<button class="bg-blue-500 text-white px-2 py-1 rounded">Start</button>
		</div>

		<!-- Clock -->
		<div class="text-white">
			<!-- TODO: make date responsive -->
			{new Date().toLocaleTimeString().replace(/([\d]+:[\d]{2})(:[\d]{2})(.*)/, '$1$3')}
		</div>
	</div>

</main>
