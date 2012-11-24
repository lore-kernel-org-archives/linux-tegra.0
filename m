From: =?UTF-8?B?VGVyamUgQmVyZ3N0csO2bQ==?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/6] video: tegra: Add nvhost driver
Date: Sat, 24 Nov 2012 22:02:43 +0200
Message-ID: <50B127E3.3080404@nvidia.com>
References: <1353577684-7896-1-git-send-email-tbergstrom@nvidia.com> <1353577684-7896-2-git-send-email-tbergstrom@nvidia.com> <20121123233855.GD21555@avionic-0098.adnet.avionic-design.de> <50B07084.40707@nvidia.com> <20121124190416.GC26154@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121124190416.GC26154-RM9K5IK7kjIyiCvfTdI0JKcOhU4Rzj621B7CTYaBSLdn68oJJulU0Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

I'll reply to the rest later, but here some initial comments.

On 24.11.2012 21:04, Thierry Reding wrote:
> The usual way to do this is to adapt downstream kernels to upstream
> changes, not the other way around.

Yep, we're doing both ways - leveraging downstream and upstream code.

> Some more documentation about host1x would certainly be very welcome. If
> you write something up, maybe you can push to get it included in the TRM
> as well. The host1x chapter in the TRM is a bit sketchy and something
> more like a programming guide would be really useful.

Got it. I hope user space code would help here, as it would be a
definite explanation of how the thing is supposed to be used.

> Funny enough, the chapter about the 2D engine says that it is merely
> there to document the registers and explicitly not as a programming
> guide because it is expected that NVIDIA supplied drivers will always be
> used. I had a good laugh when I read that. =)

Ouch. :-)

> The benefit is that smaller changes that add a single particular feature
> are a lot easier to review and verify.

Yep, I'm working on this. I think I found a way.

> But that's precisely my point. If the hardware is called host1x, why not
> call the driver host1x as well. We do the same for all other hardware
> blocks. The I2C controller driver is named i2c-tegra just as the RTC
> driver is named rtc-tegra. Why should the driver for host1x not be named
> host1x?

Ok, I got it.

Terje
