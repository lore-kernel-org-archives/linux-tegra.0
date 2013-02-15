From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [v2 1/4] ARM: tegra20: create a DT header defining CLK IDs
Date: Fri, 15 Feb 2013 11:24:07 +0200
Message-ID: <20130215092407.GO3073@tbergstrom-lnx.Nvidia.com>
References: <1360868369-20093-1-git-send-email-hdoyu@nvidia.com>
 <1360868369-20093-2-git-send-email-hdoyu@nvidia.com>
 <511D45E0.1080105@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <511D45E0.1080105-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Feb 14, 2013 at 09:15:28PM +0100, Stephen Warren wrote:
> On 02/14/2013 11:59 AM, Hiroshi Doyu wrote:
> > To replace magic number in tegra_car:
> > 
> > -               clocks = <&tegra_car 28>;
> > +               clocks = <&tegra_car CLK_HOST1X>;
> 
> > diff --git a/arch/arm/boot/dts/tegra20-car.h b/arch/arm/boot/dts/tegra20-car.h
> 
> Sorry, forgot a couple small comments the last time around.
> 
> This file should probably have some header indicating which binding it
> describes, rather like the GPIO header in my patch series.
> 
> > +#define CLK_CPU 0
> 
> I'd suggest naming that TEGRA20_CLK_CPU, so that the various different
> clock headers don't conflict. It's not too likely that more than one of
> the /Tegra/ clock headers will be included at once, but it doesn't seem
> that unlikely that a board file could end up having a Tegra clock header
> included plus various other clock headers for some other chip that has
> some clock outputs.
> 

I would suggest removing this clock. It's not actually implemented in the CCF
and rather useless. If you would gate the CPU clock from the CPU by writing to
this register, how would you ungate it? :) Note that this would gate the clock
to all CPUs.

Cheers,

Peter.
