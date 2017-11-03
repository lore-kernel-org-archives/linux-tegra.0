From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: T20 Cpuidle Freeze
Date: Fri, 3 Nov 2017 21:52:26 +0300
Message-ID: <ddd84466-c4db-c2a0-c646-2ce6c2936806@gmail.com>
References: <1509714423.21320.11.camel@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1509714423.21320.11.camel@toradex.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Ziswiler <marcel.ziswiler@toradex.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "rafael.j.wysocki@intel.com" <rafael.j.wysocki@intel.com>
Cc: "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "mirq-linux@rere.qmqm.pl" <mirq-linux@rere.qmqm.pl>
List-Id: linux-tegra@vger.kernel.org

On 03.11.2017 16:07, Marcel Ziswiler wrote:
> Hi Rafael, dear community
> 
> One of our customers reported seeing freezes when running the LTS Linux
> kernel 4.9.x on our Toradex Colibri T20 modules [1]. I was able to
> reproduce a complete SoC lock-up after a few minutes also running the
> latest 4.14-rc7 while LTS 4.4.x seemed to run stable.
> 
> Having attempted a multi-level bisection points towards the following
> first bad commit:
> 
> 9c4b2867ed7c8c8784dd417ffd16e705e81eb145
> 
> cpuidle: menu: Fix menu_select() for CPUIDLE_DRIVER_STATE_START == 0
> 
> Unfortunately as drivers/cpuidle/governors/menu.c has gotten further
> edits since it seems not trivial to just revert it.
> 
> However I found out that it indeed has to do with CPU idle as when I
> did disable the CONFIG_CPU_IDLE Linux kernel configuration option also
> LTS 4.9.59 as well as latest 4.14-rc7 run now stable overnight.
> 
> Does anybody have any clue what exactly may be happening and/or why
> cpuidle may not run stable on T20? Or is everybody always just
> disabling cpuidle on T20 anyway?
> 
> Thanks!
> 
> [1] https://www.toradex.com/community/questions/16838/actual-lts-kernel
> -49-on-colibri-t20.html

I haven't seen any problems with the cpuidle on next and 4.14-rc7 works fine.

# cat /sys/devices/system/cpu/cpu[0-1]/cpuidle/state[0-1]/usage
162283
32905
254669
32905

# cat /sys/devices/system/cpu/cpu[0-1]/cpuidle/state[0-1]/time
436981763
2110484666
458260707
2121781516

# uptime
 18:50:24 up 44 min,  1 user,  load average: 0.15, 0.08, 0.07

It could be that cpuidle unmasks some other issue on the Colibri.
