From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: CPU hotplug issue w/ 0647065 clocksource: Add generic dummy
 timer driver
Date: Tue, 9 Jul 2013 09:35:18 -0700
Message-ID: <20130709163518.GD830@codeaurora.org>
References: <51DAF895.1020700@wwwdotorg.org>
 <20130709005837.GC830@codeaurora.org>
 <51DC34AD.30009@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <51DC34AD.30009-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, ARM kernel mailing list <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 07/09, Stephen Warren wrote:
> On 07/08/2013 06:58 PM, Stephen Boyd wrote:
> > On 07/08, Stephen Warren wrote:
> >> CPU hotplug (replug) on Tegra HW seems to be occasionally broken due to
> >> commit 0647065 "clocksource: Add generic dummy timer driver" in
> >> linux-next. Reverting that commit solves the issue.
> > 
> > We found some breakage during boot that has been fixed by two
> > commits in linus' tree already. Do you know if you have these two
> > patches
> > 
> > 1f73a9806bdd07a5106409bbcab3884078bd34fe
> > 07bd1172902e782f288e4d44b1fde7dec0f08b6f
> 
> I didn't before since I was using next-20130705, but I just tried
> next-20130709 which does have those two commits, and I still see the issue.
> 

Ok can you get the output of /proc/timer_list and send it back
please? I assume you have TWD and those should all be in the
per-cpu slots and the broadcast timer should be your tegra specific
timer.

The odd thing is that you're seeing periodic mode for the
broadcast which doesn't make any sense. I would expect oneshot
mode and tick_handle_oneshot_broadcast to be the handler.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
