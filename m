From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCHv3 1/4] ARM: tegra: Add Tegra AHB driver
Date: Fri, 4 May 2012 08:17:36 +0200
Message-ID: <20120504.091736.839941449020176796.hdoyu@nvidia.com>
References: <1336061147-10245-1-git-send-email-hdoyu@nvidia.com><4FA2C34F.5060406@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4FA2C34F.5060406-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>, "arnd-r2nGTMty4D4@public.gmane.org" <arnd-r2nGTMty4D4@public.gmane.org>, "ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org" <ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org>, "linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>, "myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCHv3 1/4] ARM: tegra: Add Tegra AHB driver
Date: Thu, 3 May 2012 19:41:35 +0200
Message-ID: <4FA2C34F.5060406-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>

> On 05/03/2012 10:05 AM, Hiroshi DOYU wrote:
> > Tegra AHB Bus conforms to the AMBA Specification (Rev 2.0) Advanced
> > High-performance Bus (AHB) architecture.
> > 
> > The AHB Arbiter controls AHB bus master arbitration. This effectively
> > forms a second level of arbitration for access to the memory
> > controller through the AHB Slave Memory device. The AHB pre-fetch
> > logic can be configured to enhance performance for devices doing
> > sequential access. Each AHB master is assigned to either the high or
> > low priority bin. Both Tegra20/30 have this AHB bus.
> > 
> > Some of configuration param could be passed from DT too.
> 
> > diff --git a/drivers/amba/tegra-ahb.c b/drivers/amba/tegra-ahb.c
> > +static u32 tegra_ahb_gizmo[] = {
> 
> const?

Yes.

> > +static int __init tegra_ahb_module_init(void)
> > +{
> > +	return platform_driver_register(&tegra_ahb_driver);
> > +}
> > +postcore_initcall(tegra_ahb_module_init);
> 
> Can this be a module_init() instead of postcore_initcall()?

Since this driver configures prefetch size from AHB client devices,
it's better to make this driver available before other AHB client
drivers get ready. So "postcore_initcall()" seems to make sense if
there's no other better initcall.

> > +
> > +static void __exit tegra_ahb_module_exit(void)
> > +{
> > +	platform_driver_unregister(&tegra_ahb_driver);
> > +}
> > +module_exit(tegra_ahb_module_exit);
> 
> If so, all of the previous two quoted chunks can be replaced with just:
> 
> module_platform_driver(tegra_ahb_module_init);
