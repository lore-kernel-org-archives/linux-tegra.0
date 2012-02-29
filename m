From: Andre Renaud <andre-7Wk5F4Od5/oYd5yxfr4S2w@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: Add Kconfig option to use mkimage -T kernel_noload
Date: Thu, 01 Mar 2012 11:28:33 +1300
Message-ID: <4F4EA691.9040406@bluewatersys.com>
References: <20120229181430.GI3318@game.jcrosoft.org> <4F4E6F96.8080907@am.sony.com> <20120229191209.GN14173@pengutronix.de> <74CDBE0F657A3D45AFBB94109FB122FF17BDDF2122@HQMAIL01.nvidia.com> <20120229194409.GO14173@pengutronix.de> <74CDBE0F657A3D45AFBB94109FB122FF17BDDF2155@HQMAIL01.nvidia.com> <4F4E86A1.8010506@bluewatersys.com> <20120229201938.GB16999@n2100.arm.linux.org.uk> <4F4E89A8.4080909@bluewatersys.com> <20120229203958.GQ14173@pengutronix.de> <20120229204527.GD16999@n2100.arm.linux.org.uk> <74CDBE0F657A3D45AFBB94109FB122FF17BDDF21A1@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF17BDDF21A1-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, =?ISO-8859-1?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Tim Bird <tim.bird-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 01/03/12 10:27, Stephen Warren wrote:
> Russell King wrote at Wednesday, February 29, 2012 1:45 PM:
> ...
>> So, really, comparing a standard uImage produced by the standard kernel
>> with gzipped Image is far from a fair comparison.  And that's actually
>> another argument for getting rid of the uImage target... it may make
>> people think a bit about what they're doing rather than accepting
>> whatever default location someone else chose for their kernel.
> 
> That seems like more of an argument for making the uImage target use
> -T kernel_noload unconditionally, rather than removing the target.
> Since doing so would solve the issue about the kernel picking a load
> address.
> 
> That is, ignoring any arguments about breaking existing workflows at
> least...

I think this is the case that I was seeing - the current behaviour of
the uImage target, of using the zreladdr as the load/start addresses
essentially guarantees the worst case relocation behaviour.

Regards,
Andre
