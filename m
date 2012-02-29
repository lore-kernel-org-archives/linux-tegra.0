From: Andre Renaud <andre-7Wk5F4Od5/oYd5yxfr4S2w@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: Add Kconfig option to use mkimage -T kernel_noload
Date: Thu, 01 Mar 2012 09:25:12 +1300
Message-ID: <4F4E89A8.4080909@bluewatersys.com>
References: <1330473804-23348-1-git-send-email-swarren@nvidia.com> <20120229122942.GF3318@game.jcrosoft.org> <74CDBE0F657A3D45AFBB94109FB122FF17BDDF206A@HQMAIL01.nvidia.com> <20120229181430.GI3318@game.jcrosoft.org> <4F4E6F96.8080907@am.sony.com> <20120229191209.GN14173@pengutronix.de> <74CDBE0F657A3D45AFBB94109FB122FF17BDDF2122@HQMAIL01.nvidia.com> <20120229194409.GO14173@pengutronix.de> <74CDBE0F657A3D45AFBB94109FB122FF17BDDF2155@HQMAIL01.nvidia.com> <4F4E86A1.8010506@bluewatersys.com> <20120229201938.GB16999@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120229201938.GB16999-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, =?ISO-8859-1?Q?Uwe_Kleine-K=F6?= =?ISO-8859-1?Q?nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Tim Bird <tim.bird-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Russell,
>> I may have missed part of this, but isn't one of the points regarding
>> this that the zImage decompressor always runs with data cache disabled,
> 
> Most certainly not.  We've had the data cache enabled for years and
> years.  And I mean 10+ years.  We may have been lacking support on
> some CPUs, but that was because of lack of contributions.
> 
>> resulting in a slow decompress, where as if the U-Boot decompressor is
>> used (ie, gzipping the Image, and telling U-Boot to decompress), then it
>> can run with caches enabled, improving boot speed?
> 
> That's pure FUD.

I don't want to open a can of worms on this, and I certainly haven't
looked into the image decompressor within the Linux kernel, but from a
boot speed point of view we certainly see a significant speed
improvement switching from zImage to gzipped-Image. Do you know which
platforms include the data-cache support in the decompressor?

Regards,
Andre
