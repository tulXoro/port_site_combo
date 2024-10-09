<script lang='ts'>
    import { onMount, onDestroy } from 'svelte';
    import { createEventDispatcher } from "svelte";

	export let name: string | null = null;

    const dispatch = createEventDispatcher();

    function closeWindow() {
        dispatch('close', { name });
        history.back();
    }

    onMount(() => {
        history.pushState({ name }, '', `#${name}`);
        const handlePopState = (event: PopStateEvent) => {
            event.preventDefault();
            closeWindow();
        };

        window.addEventListener('popstate', handlePopState);

        return () => {
            window.removeEventListener('popstate', handlePopState);
        };
    })

</script>

<div class="bg-gray-800 absolute z-100 left-1/2 transform -translate-x-1/2">
	<!-- Top bar -->
	<div class="flex justify-between items-center p-4">
		<div class="flex items-center space-x-4 md:w-96 w-52">
			<button class="bg-red-500 h-3 w-4 rounded-full" on:click={closeWindow} />
			<button class="bg-yellow-500 h-3 w-4 rounded-full" on:click={closeWindow}/>
			<button class="bg-green-500 h-3 w-4 rounded-full" on:click={closeWindow}/>
            <span class="text-neutral-50 text-center select-none w-full">{name}</span>
		</div>
		
	</div>
</div>
