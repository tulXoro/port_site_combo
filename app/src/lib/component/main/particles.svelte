<script>
	import { particlesInit } from '@tsparticles/svelte';
	import { onMount } from 'svelte';
	import { loadSlim } from '@tsparticles/slim';

	/**
	 * @type {typeof import("@tsparticles/svelte").default}
	 */
	let ParticlesComponent = $state();

	onMount(async () => {
		const module = await import('@tsparticles/svelte');

		ParticlesComponent = module.default;
	});

	let onParticlesLoaded = (event) => {
		const particlesContainer = event.detail.particles;

		// you can use particlesContainer to call all the Container class
		// (from the core library) methods like play, pause, refresh, start, stop
	};

	void particlesInit(async (engine) => {
		// call this once per app
		// you can use main to customize the tsParticles instance adding presets or custom shapes
		// this loads the tsparticles package bundle, it's the easiest method for getting everything ready
		// starting from v2 you can add only the features you need reducing the bundle size
		//await loadFull(main);
		await loadSlim(engine);
	});

	let particlesConfig = {
		fpsLimit: 120,
		interactivity: {
			detectsOn: 'window',
			events: {
				onClick: {
					enable: true,
					mode: 'repulse'
				},

				resize: true
			},
			modes: {
				repulse: {
					distance: 10,
					duration: 100
				}
			}
		},
		particles: {
			color: {
				value: '#ffffff'
			},
			links: {
				color: '#ffffff',
				distance: 75,
				enable: true,
				opacity: 0.5,
				width: 1,
				triangles: {
					enable: true,
					frequency: 1,
					opacity: 0.1
				}
			},
			move: {
				direction: 'none',
				enable: true,
				random: false,
				speed: 2,
				straight: false
			},
			number: {
				density: {
					enable: true
				},
				value: 50
			},
			opacity: {
				value: 1
			},
			shape: {
				type: 'circle'
			},
			size: {
				value: { min: 1, max: 3 }
			}
		},
		detectRetina: true,
		style: {
			filter: 'blur(1px)'
		}
	};
</script>

<ParticlesComponent
	id="tsparticles"
	class="-z-10 absolute top-0 left-0 w-full h-full pointer-events-auto"
	style=""
	options={particlesConfig}
	on:particlesLoaded={onParticlesLoaded}
/>
