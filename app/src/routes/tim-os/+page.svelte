<script>

    import Shortcut from "../../lib/component/tim-os/shortcut.svelte";

</script>


<main class="h-screen w-screen bg-orange-400 top-0">
    <ul class="grid gap-3 p-4">
        <li>
            <Shortcut 
                name="Terminal"
            />
        </li>

        <li>
            <Shortcut 
                name="Resume"
            />
        </li>

        <li>
            <Shortcut 
                name="Projects"
            />
        </li>

        <li>
            <Shortcut 
                name="Contact"
            />
        </li>

        <li>
            <Shortcut 
                name="About"
            />
        </li>

        <li>
            <Shortcut 
                name="Blog"
            />
        </li>

        <li>
            <Shortcut 
                name="Experience"
            />
        </li>


    </ul>

    <!-- Taskbar -->
    <div class="absolute bottom-0 left-0 h-10 w-full bg-slate-600 flex items-center justify-between px-4">
        <!-- Start Button -->
        <div class="flex items-center">
            <button class="bg-blue-500 text-white px-2 py-1 rounded">Start</button>
        </div>
        
        <!-- Quick Launch Icons -->
        <div class="flex space-x-4">
            <img src="/icons/icon1.png" alt="Icon" class="h-8 w-8"/>
            <img src="/icons/icon2.png" alt="Icon" class="h-8 w-8"/>
            <img src="/icons/icon3.png" alt="Icon" class="h-8 w-8"/>
        </div>
        
        <!-- Clock -->
        <div class="text-white">
            {new Date().toLocaleTimeString().replace(/([\d]+:[\d]{2})(:[\d]{2})(.*)/, "$1$3")}
        </div>
    </div>
</main>