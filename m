From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 02/11] ARM: tegra: add a flag for
 tegra_disable_clean_inv_dcache to do LoUIS or ALL
Date: Thu, 27 Jun 2013 18:07:45 +0800
Message-ID: <1372327665.9389.29.camel@jlo-ubuntu-64.nvidia.com>
References: <1372152475-18617-1-git-send-email-josephl@nvidia.com>
	 <1372152475-18617-3-git-send-email-josephl@nvidia.com>
	 <51CB4174.1050700@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <51CB4174.1050700-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, 2013-06-27 at 03:31 +0800, Stephen Warren wrote:
> On 06/25/2013 03:27 AM, Joseph Lo wrote:
> > Adding a flag for tegra_disable_clean_inv_dcache to flush cache as LoUIS
> > or ALL. After this patch, the v7_flush_dcache_louis is used for CPU hotplug
> > and CPU suspend in CPU power down (e.g. CPU idle power-down mode) case. And
> > the v7_flush_dcache_all is used for CPU cluster power down (e.g. suspend to
> > LP2 mode).
> 
> > diff --git a/arch/arm/mach-tegra/sleep.h b/arch/arm/mach-tegra/sleep.h
> 
> > +/* flag of tegra_disable_clean_inv_dcache to do LoUIS or all */
> > +#define TEGRA_FLUSH_CACHE_LOUIS	0x10
> > +#define TEGRA_FLUSH_CACHE_ALL	0x20
> 
> Is there a reason those two values aren't just 0 and 1; they only seem
> to be used internally to switch between two function calls, and not
> passed to those calls or written to HW.

No. Will fix.
