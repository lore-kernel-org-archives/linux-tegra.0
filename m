From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 09/11] ARM: tegar: remove the limitation that Tegra114
 can't support suspend
Date: Thu, 27 Jun 2013 18:01:56 +0800
Message-ID: <1372327316.9389.26.camel@jlo-ubuntu-64.nvidia.com>
References: <1372152475-18617-1-git-send-email-josephl@nvidia.com>
	 <1372152475-18617-10-git-send-email-josephl@nvidia.com>
	 <51CB4398.8050900@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <51CB4398.8050900-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, 2013-06-27 at 03:40 +0800, Stephen Warren wrote:
> On 06/25/2013 03:27 AM, Joseph Lo wrote:
> > The Tegra114 can support suspend function now, removing the limitation.
> 
> OK, so this is the first point at which system suspend is enabled on
> Tegra114. However, some of the changes in earlier patches sounded like
> the might affect, or be required by, cpuidle too. Is that the case? If
> so, can you assure me that bisectability of Tegra114 cpuidle is
> maintained across this whole series?

I think you mean one of the patches I changed the init sequence of CPU
idle driver and hook the "tegra_tear_down_cpu" in tegra_init_suspend
(under pm.c). I did that was for fixing the dependence of CPU idle and
suspend driver.

Because we upstreamed the CPU idle "powered-down" support first then
system suspend. So we hook the "tegra_tear_down_cpu" in CPU idle driver.
But it would cause the system suspend function fail when disabling
CPU_IDLE. After reorganizing the sequence, the system suspend is still
working after disabling CPU_IDLE. If the PM is disabled, the CPU idle
driver still supports at least WFI state.

So this series is OK with cpuidle driver. I had tested the previous
series (already merged in the branch for 3.11) is ok for Tegra20/30 as
well.

Thanks for take care.
