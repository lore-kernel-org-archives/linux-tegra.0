From: rcochran-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org
Subject: Re: [patch 61/66] timers: Convert to hotplug state machine
Date: Tue, 26 Jul 2016 16:40:39 +0200
Message-ID: <20160726144039.GB23707@linutronix.de>
References: <20160711122450.923603742@linutronix.de>
 <20160711122535.775201614@linutronix.de>
 <7d37714e-b072-ee90-f14f-364f4fd01f0d@nvidia.com>
 <20160725153543.GB10939@linutronix.de>
 <0b5a7bb5-6670-606b-e33d-63cd8b0fcedd@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <0b5a7bb5-6670-606b-e33d-63cd8b0fcedd-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Anna-Maria Gleixner <anna-maria-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Jon,

On Tue, Jul 26, 2016 at 10:20:58AM +0100, Jon Hunter wrote:
> Thanks. I have not tried another ARM based device, but I would be
> curious if another ARM device sees this or not.

I do see this stall on socfpga and on zynq, but in both cases the
suspend mechanism is flakey in other ways, too.  At least I can
reproduce the stall sometimes.

In your other mail you wrote that you test it like this:

   rtcwake -d rtc1 -m mem -s 3

But the stall appears only after 20 seconds.  So the resume event
after three seconds (-s 3) is getting lost, right?

Thanks,
Richard
