# stroll_social

### Approach:

### For Video:
* Used better_player plugin for showing video
* Added caching of video
* initially it will cache around 2 MB & but total caching is capped at 1GB  &  can be changed 
* to show background video as soon as user taps
* Video will also be cached while user is seeing it, to fetch video next time From Cache instead of network

### For Dragging Screen : 
* Used Gesture Detector and based on its input of how much user has dragged over screen, updating the position of video and other ui elements

### Other :
* if video supports HLS (http live streaming), then video quality can be changed depending on user internet connection (eg. 480p->720p etc... and vice-versa)
* Commented link in code can be used to check HLS functionality

### Optimisation: 
* can use CloudFront CDN instead of Firebase (where current video is hosted) to achieve lesser initial loading & caching time

### Video Specification tested:
* Mp4
* HLS videos

### Packages Used:
better_player


https://github.com/patelkeval936/stroll_social_assignment/assets/68424914/e30d0048-f209-45d4-9be5-18aaecacdf7d


________________

<img width="434" alt="Screenshot 2024-03-13 at 5 29 50 AM" src="https://github.com/patelkeval936/stroll_social_assignment/assets/68424914/1d053e4f-4fb5-483c-a538-d77ddd5c3bd4">

<img width="424" alt="Screenshot 2024-03-10 at 3 54 47 AM" src="https://github.com/patelkeval936/stroll_social_assignment/assets/68424914/7d055852-3847-42da-9a7e-26907eab7c52">


https://github.com/patelkeval936/stroll_social_assignment/assets/68424914/4375ef3f-55f1-4723-baa7-fb3ec8b0f08f


https://github.com/patelkeval936/stroll_social_assignment/assets/68424914/7f77cfc8-8345-4cc8-96c1-fba05d8fbd21

## Contact Me : 
patelkeval936@gmail.com
