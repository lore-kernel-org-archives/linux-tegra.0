From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH] drm: tegra: Use framebuffer pitch as line stride
Date: Tue, 27 Nov 2012 22:57:20 +0100
Message-ID: <1354053440.1479.57.camel@tellur>
References: <1353613037-15808-1-git-send-email-thierry.reding@avionic-design.de>
	 <50B3EF29.6000308@wwwdotorg.org> <50B43096.4060302@nvidia.com>
	 <50B503C5.6010208@wwwdotorg.org> <50B53312.7040000@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50B53312.7040000-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Jon Mayo <jmayo-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Am Dienstag, den 27.11.2012, 14:39 -0700 schrieb Stephen Warren:
> > For your viewing pleasure (and playing with my new phone) :-)
> > http://www.youtube.com/watch?v=ZJxJnONz7DA
> > 
> > The external monitor is 1920x1200 I believe.
> 
> Jon Mayo says the corruption in the video is display (memory fetch)
> underflow. Perhaps this is because (IIRC) the BCT I'm using on Cardhu
> programs the memory controller at a slow rate, and the bootloader and/or
> kernel is supposed to bump up the rate to the max, but that's not
> implemented anywhere yet upstream. If you're testing with "fastboot"
> instead of U-Boot, that might be re-programming the memory frequencies,
> and hence avoiding this.
> 
> I guess we have a fun time ahead of us with mode validation and memory
> controller programming.

Maybe it's not insufficient memory bandwidth, but just the request
missing the deadline in the memory controller. You may try to adjust the
values in reg MC_LATENCY_ALLOWANCE_DC_0_0
for example.

Regards,
Lucas
