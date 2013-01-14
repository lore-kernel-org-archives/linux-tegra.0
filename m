From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: tegra: Use DT /cpu node to detect number of CPU
 core
Date: Mon, 14 Jan 2013 12:35:35 +0000
Message-ID: <20130114123535.GB21142@e102568-lin.cambridge.arm.com>
References: <1358149970-28156-1-git-send-email-hdoyu@nvidia.com>
 <1358149970-28156-2-git-send-email-hdoyu@nvidia.com>
 <20130114092720.GX23505@n2100.arm.linux.org.uk>
 <20130114.114925.1476619399284636466.hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130114.114925.1476619399284636466.hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Jan 14, 2013 at 09:49:25AM +0000, Hiroshi Doyu wrote:
> Hi Russell,
> 
> Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> wrote @ Mon, 14 Jan 2013 10:27:20 +0100:
> 
> > On Mon, Jan 14, 2013 at 09:52:50AM +0200, Hiroshi Doyu wrote:
> > > +	if (!arm_dt_cpu_map_valid())
> > > +		set_cpu_possible(0, true);
> > 
> > You don't need to do any of this (and, therefore, I don't think you even
> > need the first patch.)
> > 
> > The generic boot code will set CPU0 as possible, present and online.  Think
> > about it: you're booting on that very CPU so it better be possible, present
> > and online.  If it isn't, what CPU is executing your code?
> > 
> > arm_dt_init_cpu_maps() will only ever set _additional_ CPUs in the possible
> > map.
> > 
> > Ergo, by the time the above code is run, CPU0 will already be marked as
> > possible.  Therefore, the above code and arm_dt_cpu_map_valid() is not
> > required.
> 
> Right.
> 
> In Tegra, we've decided to not use SCU based detection at all any more
> and to continue with a single core even when DT cpu detection
> fails. For Tegra, "arm_dt_cpu_map_valid()" is not necessary. For other
> SoCs, this would be necessary when they want to detect again with
> SCU.

Correct. I will keep my patch around and repost it if and when we want other
platforms to rely on legacy HW number of cores count discovery.

Given that's going to be temporary legacy code anyway, I hope we won't need it
at all.

Lorenzo
