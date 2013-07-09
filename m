From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: CPU hotplug issue w/ 0647065 clocksource: Add generic dummy timer
 driver
Date: Tue, 09 Jul 2013 10:05:01 -0600
Message-ID: <51DC34AD.30009@wwwdotorg.org>
References: <51DAF895.1020700@wwwdotorg.org> <20130709005837.GC830@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130709005837.GC830-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, ARM kernel mailing list <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 07/08/2013 06:58 PM, Stephen Boyd wrote:
> On 07/08, Stephen Warren wrote:
>> CPU hotplug (replug) on Tegra HW seems to be occasionally broken due to
>> commit 0647065 "clocksource: Add generic dummy timer driver" in
>> linux-next. Reverting that commit solves the issue.
> 
> We found some breakage during boot that has been fixed by two
> commits in linus' tree already. Do you know if you have these two
> patches
> 
> 1f73a9806bdd07a5106409bbcab3884078bd34fe
> 07bd1172902e782f288e4d44b1fde7dec0f08b6f

I didn't before since I was using next-20130705, but I just tried
next-20130709 which does have those two commits, and I still see the issue.
