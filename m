From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/7] clocksource: Add Tegra186 timers support
Date: Fri, 20 Mar 2020 18:23:35 +0300
Message-ID: <5a559950-0497-b24f-6484-c2513375fe62@gmail.com>
References: <20200320133452.3705040-1-thierry.reding@gmail.com>
 <20200320133452.3705040-3-thierry.reding@gmail.com>
 <df532fef-1533-9da7-d676-f4671746fde3@gmail.com>
 <20200320150406.GA3706404@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200320150406.GA3706404@ulmo>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

20.03.2020 18:04, Thierry Reding пишет:
> On Fri, Mar 20, 2020 at 05:39:01PM +0300, Dmitry Osipenko wrote:
>> 20.03.2020 16:34, Thierry Reding пишет:
>>> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>
>>> Currently this only supports a single watchdog, which uses a timer in
>>> the background for countdown. Eventually the timers could be used for
>>> various time-keeping tasks, but by default the architected timer will
>>> already provide that functionality.
>>>
>>> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>> ---
>>>  drivers/clocksource/Kconfig          |   8 +
>>>  drivers/clocksource/Makefile         |   1 +
>>>  drivers/clocksource/timer-tegra186.c | 377 +++++++++++++++++++++++++++
>>>  3 files changed, 386 insertions(+)
>>>  create mode 100644 drivers/clocksource/timer-tegra186.c
>> Hello Thierry,
>>
>> Shouldn't this driver reside in drivers/watchdog/? Like it's done in a
>> case of the T30+ driver.
> 
> The hardware block that this binds to is primarily a time-keeping block
> that just so happens to also implement a watchdog. Moving this to
> drivers/watchdog would put us into an odd situation if we ever added
> code to also implement the time-keeping bits for this hardware.
> 
> I also think that the way this is done on Tegra30 was a bad choice. The
> problem is that we now have two drivers (tegra_wdt.c and tegra-timer.c)
> that both access the same region of memory. This seems to be relatively
> safe to do on those chips because there's no overlap between the timer
> and the watchdog interfaces, but on Tegra186 and later the watchdog is
> actually using one of the timers, so we'd have to be extra careful how
> to coordinate between the two. It seems much easier to do that by having
> everything in the same driver and have that register multiple devices in
> the system.

Sounds like a watchdog on Tegra20, where one of the timer is shared with
a watchdog function and there are no other free timers. Well, yes, it's
not nice.

But, will you really ever need an additional clocksource on T186?
