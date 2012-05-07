From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCHv3 1/4] ARM: tegra: Add Tegra AHB driver
Date: Mon, 7 May 2012 09:06:19 +0300
Message-ID: <20120507090619.90932b9f67a4b672abeb887f@nvidia.com>
References: <1336061147-10245-1-git-send-email-hdoyu@nvidia.com>
	<4FA2C34F.5060406@wwwdotorg.org>
	<20120504.091736.839941449020176796.hdoyu@nvidia.com>
	<4FA40878.7070709@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4FA40878.7070709-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>, "arnd-r2nGTMty4D4@public.gmane.org" <arnd-r2nGTMty4D4@public.gmane.org>, "ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org" <ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org>, "linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>, "myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, 4 May 2012 18:48:56 +0200
Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:

> On 05/04/2012 12:17 AM, Hiroshi Doyu wrote:
> > Stephen Warren wrote at Thu, 3 May 2012 19:41:35 +0200:
> >> On 05/03/2012 10:05 AM, Hiroshi DOYU wrote:
> >>> Tegra AHB Bus conforms to the AMBA Specification (Rev 2.0) Advanced
> >>> High-performance Bus (AHB) architecture.
> ...
> >>> +static int __init tegra_ahb_module_init(void)
> >>> +{
> >>> +	return platform_driver_register(&tegra_ahb_driver);
> >>> +}
> >>> +postcore_initcall(tegra_ahb_module_init);
> >>
> >> Can this be a module_init() instead of postcore_initcall()?
> > 
> > Since this driver configures prefetch size from AHB client devices,
> > it's better to make this driver available before other AHB client
> > drivers get ready. So "postcore_initcall()" seems to make sense if
> > there's no other better initcall.
> 
> I believe this only affects when the driver is registered and has no
> influence over when the device itself is probed.
> 
> When booting with board files rather than DT, it was possible to
> register drivers and platform devices early using various initcalls to
> control the order. However, with DT, I believe all the devices are
> instantiated from DT at the same time (well, one by one in whatever
> order as the DT is parsed), so the time when the driver is registered
> isn't relevant.
> 
> So, if the other AHB devices really need this AHB driver to initialize
> first, you'd better move all the AHB devices inside the AHB node in DT,
> so that the AHB driver can influence when the children get probed.
> Still, I'd suggest leaving that to a later patch, since everything
> clearly works fine right now without this driver even existing.

Ok, I'll use module_platform_driver(tegra_ahb_driver). These order would be revisited.
