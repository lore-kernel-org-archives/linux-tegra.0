From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 4/7] ARM: tegra30: common: enable csite clock
Date: Thu, 11 Oct 2012 18:28:41 +0800
Message-ID: <1349951321.19413.154.camel@jlo-ubuntu-64.nvidia.com>
References: <1349691981-31038-1-git-send-email-josephl@nvidia.com>
	 <1349691981-31038-5-git-send-email-josephl@nvidia.com>
	 <5074A77D.9080500@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5074A77D.9080500-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, 2012-10-10 at 06:38 +0800, Stephen Warren wrote:
> On 10/08/2012 04:26 AM, Joseph Lo wrote:
> > Enable csite (debug and trace controller) clock at init to prevent it
> > be disabled. And this also the necessary clock for CPU be brought up or
> > resumed from a power-gate low power state (e.g., LP2).
> 
> Does it make sense to enable this clock only when entering LP2? Or do we
> really need to keep it on 100% of the time?

Hmmm. I am not sure does the RealView or Lauterbach ICE can still attach
to the target if the clock is not available. Or even it can be attached
but some functions of the debugger may not work. Because the CoreSight
is a very fancy debug module.

I only test it with a light weight debugger (OpenOCD). It still can work
without turning on the CoreSight clock. Maybe it just because the
openocd debugger only using the jtag interface.

Anyway, I think we need the csite always on for the developer that using
RealView or Lauterbach ICE.

Thanks,
Joseph
