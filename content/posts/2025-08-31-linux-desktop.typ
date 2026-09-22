#import "/src/util.typ": img

#let post = (
  slug: "linux-desktop",
  title: "The Year of the Linux Desktop",
  date: datetime(year: 2025, month: 8, day: 31),
  tags: ("linux", "life"),
  summary: "Reflecting on my primary computing platform this summer",
  images: ("linux-desktop.jpg",),
  body: [
#img("linux-desktop.jpg", alt: "Laptop in cafe")

I think 2025 may finally be the year of the Linux Desktop.

Of course, the community has been crying wolf in this regard for over a decade, but from the standpoint of my own personal experiences, it is true now.

This summer, I've come back from university and the summer itself has been split into two halves. The first half was spent at home, remotely taking a systems programming course, while the latter half I've been in South America. In the former, my primary computer was my home desktop. Returning to it after 9 months, I found Windows 11 to be overly opinionated and restrictive, I had no patience for it. I loaded up the latest Fedora Workstation ISO and immediately felt more at home. I was able to do everything. Gaming via Steam + Proton, general browsing on Firefox, all my coursework via nvim + kitty, and any other random tasks I needed a computer for like editing photos, watching movies etc. 

I did not find Fedora lacking in any regard, although I should stipulate that I finally succumbed to the pressure and purchased a relatively inexpensive Intel AX-200 based Wi-Fi adapter to alleviate the perpetual Wi-Fi and Bluetooth driver issues plaguing me after each kernel upgrade (thanks a lot Realtek...). I spent far too much time on HackerNews and playing video games, and Fedora + Firefox + Steam gave me a great experience. Nvidia drivers, WiFi drivers, kernel updates, nothing could throw a wrench into the works.

What is far more interesting in my opinion, however, is my experience with Fedora while travelling South America. As part of a study-abroad program, I'm with my professor and a dozen classmates studying Latin American Literature while visiting the very houses of the authors and museums containing pieces about which we read.

I had to write reports and essays and a whole bunch of other random things: processing and uploading photos from my Camera (I took the Sony RX-100 II with me), looking up maps and doing research for essays, or even just making bookings for side quests like bus tickets and airbnbs. Again, for this purpose, Zen Browser was more than sufficient on my ThinkPad T480s running Fedora. Battery life wasn't as much of a concern as I thought either. Coming from an M1 Air, I expected the T480s to be attrocious, but honestly the 4~5+ hours of battery life was sufficient on the go. If I really needed to get more work done, I was probably in my room, a cafe, or a study space where power sockets lay abundant. If I was really desperate, I had my battery bank which could push the 65W of power that the laptop needed.

I have to say, it was quite nice to not have to _think_ (I'm sorry, I had to do it) about my laptop. The battered T480s, plastered with technology and student club stickers, does not draw the same attention as a shiny MacBook does (granted, my M1 is covered with a discrete decal) in a random cafe. The 2018 ultrabook also has so many ports: usb-c 3.1 (w/ PD and DP-alt), thunderbolt 3, hdmi 1.4, rj-45, 2 usb-3.1 type-a, headphone jack, and SD Card Slot. It was quite freeing to not have to lug around a whole bag of dongles and adapters. I could just pop the SD Card out of my camera and back up my photos at the end of the day. It even has a Kensignton Lock, so if I was really cautious I could've brought one of those with me too.

I could also go on and on about the keyboard. I know the purists lament the T480s' keyboard being a mere shadow of its predecessors', but in comparison to the M1 Air, and even my Keychron K3 Pro, it is a very comfortable interface for all my computing needs. I'm writing this blog post, having returned home, on the ThinkPad as opposed to my MacBook or Desktop for mainly this keyboard. I also don't have to worry about spilling anything onto it; I could drink a coffee in complete peace, knowing that the worst thing that could happen to my laptop is that I might have to spend \$30 on a keyboard.

Now, the laptop is not without its flaws. Its main sin is being from 2018. More specifically, its rocking a 2018 core i5 8350u. I'm sure it was a fine contender back in the day, but now it's starting to show its age, in some workloads more than others. For most web browsing, even YouTube playback, terminal usage (`kitty` is my main workhorse), basic code compilation, etc. the 8350u with its UHD 620 graphics work just fine. However, when doing stuff like playing higher resolution HEVC video in VLC or even kernel upgrades, the system can come down to a bog. In one case, I was trying to play some drone footage I had received but it was more artefacts than video, so I thought it might be corrupt. However, loading it onto my Pixel 6, not even the 9 Pro, I could play it back in full resolution. 

Apart from that, the fingerprint reader is also not all that well supported on Fedora, requiring janky python packages to be loaded up and sketchy scripts with root access. The screen, webcam and trackpad are just adequate: not all that pleasing, but not unbearable either. Despite these issues, I would still say the usage experience was quite positive. In fact, I think some of the limitations of the platform, such as the screen not being as pleasant or the GPU being unable to play most games actually weaned me off from distractions, and helped me focus on just getting my tasks done before closing the lid and embarking on adventures in real life.

Before I close this off, I might also bring up some honourable mentions. My most used computer during the trip was undoubtedly the Google Pixel 9 Pro. Android 16 is a fine OS (Google bugs not withstanding, plus the Linux VM is pretty cool to use with XREAL One Glasses and a Bluetooth keyboard), and that phone was my lifeline for translations, contactless payments, and navigation - not to mention all the text messages and phone calls it made. I took tens of gigabytes of photos and video with it, and even wrote the occasional last-minute assignment in Google Docs for Android while standing in a moving subway car. 

Another Linux device that really made an impact for me is the reMarkable 2. I have another blog post up about it, although I might add that I have reversed most of those modifications now in favour of running a slightly newer OS. I didn't bring it with me this time, instead relying on a _nice_ pen and journal combination for all my notes, but the reMarkable is an exemplary showcase for non-Android linux in consumer devices.

With that, I think it is clear to see that Linux (mainly Fedora /w GNOME) has served all of my computing needs this past summer. From video games and programming, to web browsing and word processing, I have been perfectly satisfied and even productive. It's not without its fair share of hiccups but I think I have also gained from the experience. I have formed different opinions than before on how I want to use the precious time I have, and I think that the Linux ecosystem better fits those requirements than Windows or mac+iOS.
]
)
