From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/6] ARM: tegra: skip SCU and PL310 code when CPU is
 not Cortex-A9
Date: Thu, 16 May 2013 18:13:17 +0800
Message-ID: <1368699197.7403.28.camel@jlo-ubuntu-64.nvidia.com>
References: <1368613644-11863-1-git-send-email-josephl@nvidia.com>
	 <1368613644-11863-3-git-send-email-josephl@nvidia.com>
	 <519410D7.9060201@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <519410D7.9060201-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, 2013-05-16 at 06:48 +0800, Stephen Warren wrote:
> On 05/15/2013 04:27 AM, Joseph Lo wrote:
> > For supporting single image on all Tegra series, we need to skip some HW
> > support code for Cortex-A9 only.
> 
> > diff --git a/arch/arm/mach-tegra/sleep.S b/arch/arm/mach-tegra/sleep.S
> 
> > +	check_cpu_part_num 0xc09, r9, r10
> > +	movweq	r4, #:lower16:(TEGRA_ARM_PERIF_BASE + 0x3000)
> > +	movteq	r4, #:upper16:(TEGRA_ARM_PERIF_BASE + 0x3000)
> > +	moveq	r5, #0
> > +	streq	r5, [r4, #L2X0_CTRL]
> 
> Do those conditional instructions need a Thumb iteq wrapped around them
> in order to compile in Thumb2 mode? Same comment for the other change,
> although IIRC iteq only supports 4 instructions at a time, so maybe a
> branch would be better there. Using branches might also reduce the size
> of the diff, and make the change more obvious.

IIRC, I had tested this patch series with THUMB2_KERNEL enabled. It's
OK. I can double confirm again later.

Thanks,
Joseph
