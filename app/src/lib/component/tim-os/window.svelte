<script>
    import { createEventDispatcher } from "svelte";

	export let name = 'null';

    const dispatch = createEventDispatcher();

    function closeWindow() {
        dispatch('close', { name });
    }

</script>

<div class="bg-gray-800 absolute z-100">
	<!-- Top bar -->
	<div class="flex justify-between items-center p-4">
		<div class="flex items-center space-x-4 w-96">
			<button class="bg-red-500 h-3 w-4 rounded-full" on:click={closeWindow} />
			<button class="bg-yellow-500 h-3 w-4 rounded-full" on:click={closeWindow}/>
			<button class="bg-green-500 h-3 w-4 rounded-full" on:click={closeWindow}/>
            <span class="text-neutral-50 text-center select-none w-full">{name}</span>
		</div>
		
	</div>
</div>
