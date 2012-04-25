From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 1/3] ARM: tegra: Add AHB driver
Date: Wed, 25 Apr 2012 09:59:40 -0600
Message-ID: <4F981F6C.2050807@wwwdotorg.org>
References: <1335269116-9578-1-git-send-email-hdoyu@nvidia.com> <20120425083747.466f5c98330af8964d980b8c@nvidia.com> <20120425074639.GB3423@arwen.pp.htv.fi> <201204251215.22889.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201204251215.22889.arnd-r2nGTMty4D4@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: balbi-l0cyMroinI0@public.gmane.org, Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 04/25/2012 06:15 AM, Arnd Bergmann wrote:
> On Wednesday 25 April 2012, Felipe Balbi wrote:
...
>>> Can this driver be located under "drivers/misc"? Or is there any better place?
>>
>> maybe drivers/platform/arm/ ??
> 
> I really wouldn't want to add that directory: It has the risk of letting
> people add random crap there that may or may not be related to ARM (the
> company) and/or ARM (the architecture).
> 
> I think it could go into drivers/amba/ along with the primecell bus driver.
> The two drivers are for two different aspects of the AMBA spec and don't
> actually depend on one another as far as I can tell, but it's at least
> a fitting name, and it doesn't depend on the ARM architecture, which is
> important because the driver could be used on other architectures that
> are connected to an AHB bus.

Hiroshi, is this driver for something (registers/features) that AMBA
actually specifies? AHB might be part of AMBA (I'm not familiar enough
to know), but I don't think this aspect of Tegra's AHB bus is part of
any core AHB/AMBA specification, rather than being some Tegra-specific
control over the bus (given that the registers and bits correspond to
Tegra-specific devices on the bus).

I'm not really convinced that low-level platform-specific drivers like
this shouldn't be in the arch/arm/mach-* directories.
