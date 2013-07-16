From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: cpuidle: use CPUIDLE_FLAG_TIMER_STOP flag
Date: Tue, 16 Jul 2013 13:19:17 +0300
Message-ID: <20130716101917.GZ21962@tbergstrom-lnx.Nvidia.com>
References: <1372152228-16199-1-git-send-email-josephl@nvidia.com>
 <51E439BC.9030608@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <51E439BC.9030608-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Jul 15, 2013 at 08:04:44PM +0200, Stephen Warren wrote:
> On 06/25/2013 03:23 AM, Joseph Lo wrote:
> > Use the CPUIDLE_FLAG_TIMER_STOP and let the cpuidle framework
> > to handle the CLOCK_EVT_NOTIFY_BROADCAST_ENTER/EXIT when entering
> > this state.
> 
> I tried applying this patch, your series "[PATCH V3 0/3] ARM: tegra114:
> cpuidle: add power down state", and your series "[PATCH V2 00/11] ARM:
> tegra114: add support for system suspend", all on top of v3.11-rc1.
> 
> On Dalmore, the new cpuidle mode /appears/ to work (I see increasing
> values in the sysfs cpuidle "usage" file for all defined cpuidle
> states), but I don't see the "CPU VDD off" LED light up; I'm not
> convinced that the CPU is actually being powered off in the idle mode.

The current patchset only powergates the individual cores on Tegra114. The
entire cluster (including L2 cache etc) isn't railgated as a CPUidle state.
Hence the CPU VDD off LED will never be on.

Cheers,

Peter.
