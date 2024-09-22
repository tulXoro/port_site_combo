<script>

    const titles = [
        "Software Developer",
        "Writer",
        "Designer",
        "DevOps Engineer",
        "Data Scientist"
    ]

    let currentTitle = 0;

    let subtitle = '';

    let blinkingRectangle = "▮";
    let isTyping = false;


    const updateBlinkingRectangle = () => {
        if (!isTyping) {
            blinkingRectangle = blinkingRectangle === "▮" ? "" : "▮";
        }else{
            blinkingRectangle = "▮";
        }
    }

    // update subtitle by making an animation that looks like typing
    // and cycle through the titles. pauising at each title for a few seconds
    const updateSubtitle = () => {
        let i = 0;
        let interval = setInterval(() => {
            // if we haven't finished typing the current title
            if (i < titles[currentTitle].length) {
                isTyping = true;
                subtitle += titles[currentTitle][i];
                i++;
            } else {
                // if we have finished typing the current title
                clearInterval(interval);
                // make rectangle blink for a few seconds
                isTyping = false;
                // pause for a few seconds
                setTimeout(() => {
                    // delete the title
                    interval = setInterval(() => {
                        isTyping = true;
                        if (i > 0) {
                            subtitle = subtitle.slice(0, -1);
                            i--;
                        } else {
                            clearInterval(interval);
                            currentTitle = (currentTitle + 1) % titles.length;
                            
                            // pause for a few seconds and then start typing the next title
                            setTimeout(updateSubtitle, 500);

                        }
                    }, 50);
                }, 1000);
                
            }
            
        }, 100);

    }

    setInterval(updateBlinkingRectangle, 500);
    updateSubtitle();
    

</script>

<main>
    <h1>Timothy Lor</h1>
    <h2>A <span>{subtitle}</span>{blinkingRectangle}</h2>
</main>