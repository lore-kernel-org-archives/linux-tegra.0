From: Andre Renaud <andre-7Wk5F4Od5/oYd5yxfr4S2w@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: Add Kconfig option to use mkimage -T kernel_noload
Date: Thu, 01 Mar 2012 09:12:17 +1300
Message-ID: <4F4E86A1.8010506@bluewatersys.com>
References: <1330473804-23348-1-git-send-email-swarren@nvidia.com> <20120229122942.GF3318@game.jcrosoft.org> <74CDBE0F657A3D45AFBB94109FB122FF17BDDF206A@HQMAIL01.nvidia.com> <20120229181430.GI3318@game.jcrosoft.org> <4F4E6F96.8080907@am.sony.com> <20120229191209.GN14173@pengutronix.de> <74CDBE0F657A3D45AFBB94109FB122FF17BDDF2122@HQMAIL01.nvidia.com> <20120229194409.GO14173@pengutronix.de> <74CDBE0F657A3D45AFBB94109FB122FF17BDDF2155@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF17BDDF2155-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: =?ISO-8859-1?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Tim Bird <tim.bird-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 01/03/12 08:59, Stephen Warren wrote:
> Uwe Kleine-K=F6nig wrote at Wednesday, February 29, 2012 12:44 PM:
> ...
>> If you want to give incentive for U-Boot to improve, drop the target
>> today. And note that at least people caring about boot time must not=
 use
>> the kernel's uImage target anyhow.
>=20
> If you enable the new config option in this patch, then the performan=
ce
> issue is solved; U-Boot doesn't copy the kernel image any more, and t=
he
> kernel decompressor can write directly to the appropriate location wi=
thout
> moving the image first (assuming your board boot script loads the uIm=
age
> to a non-conflicting address).

I may have missed part of this, but isn't one of the points regarding
this that the zImage decompressor always runs with data cache disabled,
resulting in a slow decompress, where as if the U-Boot decompressor is
used (ie, gzipping the Image, and telling U-Boot to decompress), then i=
t
can run with caches enabled, improving boot speed?

Thus the relocation issue is not really the speed hit, rather it is the
image decompression.

Regards,
Andre
