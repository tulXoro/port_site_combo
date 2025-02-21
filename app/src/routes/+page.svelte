<script lang='ts'>
	import { onMount } from 'svelte';

	import { Particles } from '$lib';

	import Navbar from '$lib/component/main/navbar.svelte'

	const titles = ['Software Developer', 'Writer', 'Designer', 'DevOps Engineer', 'Data Scientist'];
	const rect = '▍';

	let currentTitle = 0;
	let subtitle = $state('');
	let blinkingRectangle = $state(rect);

	let isTyping = false;
	let typeAnimationFrameId: number;

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

	const updateSubtitle = () => {
		let i = 0;
		const typingSpeed = 50; // milliseconds
		const deletingSpeed = 50; // milliseconds

		const typeTitle = (timestamp: number) => {
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

		const deleteTitle = (timestamp: number) => {
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

<main class="min-w-screen min-h-screen bg -z-30">
	<div class="mv-grid min-h-screen"></div>
	<!-- <Particles /> -->
	<div class="gradient"></div>
	<div class="w-full h-screen grid items-center font-mono px-10 md:px-48">
		<div>
			<!-- If there is a problem with mobile view, adjust text size and wrapping -->
			<h1
				class="text-neutral-50 text-6xl md:text-7xl lg:text-9xl md:text-nowrap font-bold font-mono xl:text-start mx-auto md:mx-0"
			>
				Timothy Lor
			</h1>
			<h2
				class="text-neutral-300 text-2xl text-nowrap md:text-3xl font-bold font-mono md:mx-0 lg:mx-20 select-none"
			>
				A <span>{subtitle}</span>{blinkingRectangle}
			</h2>
		</div>
	</div>
	<Navbar />

</main>

<style>
.bg {
    margin: 0;
    height: 100vh;
    background: #003366; 
    overflow: hidden; 
    position: relative; 
}

.mv-grid {
    position: absolute;
    width: 200%; 
    height: 100%; 
    background-image:
        linear-gradient(to right, rgba(255, 255, 255, 0.1) 2px, transparent 2px),
        linear-gradient(to bottom, rgba(255, 255, 255, 0.1) 2px, transparent 2px); 
    background-size: 400px 400px; 
    background-position: 0 50px; 
    animation: move 60s linear infinite; 
    z-index: -20; 
	filter: blur(1.5px); 
}

.gradient {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: linear-gradient(
        180deg,
        rgba(0, 102, 153, 0) 0%,
        rgba(139, 139, 139, 0.055) 100%
    ); 
    z-index: -1; 

}

@keyframes move {
    0% {
        transform: translateX(0); 
    }
    100% {
        transform: translateX(-800px); 
    }
}

@keyframes move-slower {
    0% {
        transform: translateX(0); 
    }
    100% {
        transform: translateX(-400px); 
    }
}


@media (max-width: 768px) {
    .mv-grid {
        background-size: 200px 200px; 
        animation: move-slower 30s linear infinite;
    }
}

</style>
