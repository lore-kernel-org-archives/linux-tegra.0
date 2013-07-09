From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: CPU hotplug issue w/ 0647065 clocksource: Add generic dummy
 timer driver
Date: Mon, 8 Jul 2013 17:58:37 -0700
Message-ID: <20130709005837.GC830@codeaurora.org>
References: <51DAF895.1020700@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <51DAF895.1020700-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, ARM kernel mailing list <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 07/08, Stephen Warren wrote:
> CPU hotplug (replug) on Tegra HW seems to be occasionally broken due to
> commit 0647065 "clocksource: Add generic dummy timer driver" in
> linux-next. Reverting that commit solves the issue.

We found some breakage during boot that has been fixed by two
commits in linus' tree already. Do you know if you have these two
patches

1f73a9806bdd07a5106409bbcab3884078bd34fe
07bd1172902e782f288e4d44b1fde7dec0f08b6f

?

> 
> The symptom is that ~10% of the time, when re-plugging CPU1 (in a 2-core
> system, after unplugging it about 1 second before), I'll see the
> following WARN trigger in clockevents_program_event():
> 
> > int clockevents_program_event(struct clock_event_device *dev, ktime_t expires,
> > 			      bool force)
> > {
> > 	unsigned long long clc;
> > 	int64_t delta;
> > 	int rc;
> > 
> > 	if (unlikely(expires.tv64 < 0)) {
> > 		WARN_ON_ONCE(1);
> > 		return -ETIME;
> > 	}
> 
> This appears to be because in tick_handle_periodic_broadcast(),
> dev->next_event == KTIME_MAX. The system then hangs; I think that loop
> just keeps adding tick_period onto next_event, which doesn't manage to
> get to an acceptable value for a long time, if ever!
> 
> Do you have any idea why this could happen? I assume that during
> switching between the dummy timer added by that patch, and the real
> Tegra timer (drivers/clocksource/tegra20_timer.c) the Tegra timer's
> dev->next_event is temporarily set to KTIME_MAX, but somehow the timer
> IRQ handling goes off while the device is in this temporary state? The
> timer core seems to take steps to prevent this though, i.e. callilng
> spin_lock_irqsave() in places.

If you have the TWD then the dummy should only be used when you
notify clockevents core about hitting "C3". Are you seeing this
during idle or only during hotplug?

> 
> If I modify tick_handle_periodic_broadcast() to check for a negative
> dev->next_event and simply return in that case, the system seems to work
> fine, and I do see tick_handle_periodic_broadcast() being called at a
> later time, so obviously something is coming along later and programming
> the HW to generate additional events. On this HW, I believe struct
> clock_event_device.set_next_event is being used to emulate the periodic
> broadcast using a one-shot timer, rather than using the HW's native
> periodic capability, probably due to CONFIG_NO_HZ.

This sounds very much like the bug that was fixed. I don't see
why your broadcast timer would be emulating periodic mode instead
of just using oneshot mode unless it was started before the
system ever hit C3.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
