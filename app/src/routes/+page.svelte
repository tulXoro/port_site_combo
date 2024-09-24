<script>
	import { onMount } from 'svelte';

	const titles = ['Software Developer', 'Writer', 'Designer', 'DevOps Engineer', 'Data Scientist'];
	const rect = '▍';

	let currentTitle = 0;
	let subtitle = '';
	let blinkingRectangle = rect;

	let isTyping = false;
	/**
	 * @type {number}
	 */
	let typeAnimationFrameId;
	/**
	 * @type {number}
	 */
	let blinkAnimationFrameId;
	let lastTimestamp = 0;

	const updateBlinkingRectangle = (/** @type {number} */ timestamp) => {
		const blinkSpeed = 500; // milliseconds
		if (timestamp - lastTimestamp >= blinkSpeed) {
			if (!isTyping) blinkingRectangle = blinkingRectangle === rect ? '' : rect;
			else blinkingRectangle = rect;
			lastTimestamp = timestamp;
		}
		blinkAnimationFrameId = requestAnimationFrame(updateBlinkingRectangle);
	};

	const updateSubtitle = () => {
		let i = 0;
		const typingSpeed = 50; // milliseconds
		const deletingSpeed = 50; // milliseconds

		const typeTitle = (/** @type {number} */ timestamp) => {
			if (timestamp - lastTimestamp >= typingSpeed) {
				if (i < titles[currentTitle].length) {
					isTyping = true;
					subtitle += titles[currentTitle][i];
					i++;
					lastTimestamp = timestamp;
				} else {
					isTyping = false;
					cancelAnimationFrame(typeAnimationFrameId);
					setTimeout(deleteTitle, 2000); // Pause before deleting
					return;
				}
			}
			typeAnimationFrameId = requestAnimationFrame(typeTitle);
		};

		const deleteTitle = (/** @type {number} */ timestamp) => {
			if (timestamp - lastTimestamp >= deletingSpeed) {
				if (i > 0) {
					isTyping = true;
					subtitle = subtitle.slice(0, -1);
					i--;
					lastTimestamp = timestamp;
				} else {
					isTyping = false;
					cancelAnimationFrame(typeAnimationFrameId);
					currentTitle = (currentTitle + 1) % titles.length;
					setTimeout(updateSubtitle, 1000); // Pause before typing next title
					return;
				}
			}
			typeAnimationFrameId = requestAnimationFrame(deleteTitle);
		};

		typeAnimationFrameId = requestAnimationFrame(typeTitle);
	};

	onMount(() => {
		// Start the subtitle update process
		updateSubtitle();
		// Start the blinking cursor animation
		blinkAnimationFrameId = requestAnimationFrame(updateBlinkingRectangle);
	});
</script>

<main class="min-w-screen min-h-screen">
	<div class="w-full h-screen grid items-center font-mono px-28 md:px-60">
		<div>
			<h1 class="text-2xl text-nowrap md:text-6xl lg:text-9xl md:text-nowrap font-bold font-mono xl:text-start mx-auto md:mx-0">Timothy Lor</h1>
			<h2 class="text-base text-nowrap md:text-3xl font-bold font-mono md:mx-0 lg:mx-20 select-none">
				A <span>{subtitle}</span>{blinkingRectangle}
			</h2>
		</div>
	</div>
</main>
