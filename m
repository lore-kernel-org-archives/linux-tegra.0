From: Ryan Mallon <rmallon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: Add Kconfig option to use mkimage -T kernel_noload
Date: Thu, 01 Mar 2012 10:53:48 +1100
Message-ID: <4F4EBA8C.1040408@gmail.com>
References: <1330473804-23348-1-git-send-email-swarren@nvidia.com> <20120229122942.GF3318@game.jcrosoft.org> <74CDBE0F657A3D45AFBB94109FB122FF17BDDF206A@HQMAIL01.nvidia.com> <20120229181430.GI3318@game.jcrosoft.org> <4F4E6F96.8080907@am.sony.com> <20120229191209.GN14173@pengutronix.de> <74CDBE0F657A3D45AFBB94109FB122FF17BDDF2122@HQMAIL01.nvidia.com> <20120229194409.GO14173@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120229194409.GO14173-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Tim Bird <tim.bird-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 01/03/12 06:44, Uwe Kleine-K=F6nig wrote:

> On Wed, Feb 29, 2012 at 11:17:41AM -0800, Stephen Warren wrote:
>> Uwe Kleine-K=F6nig wrote at Wednesday, February 29, 2012 12:12 PM:
>>> On Wed, Feb 29, 2012 at 10:33:58AM -0800, Tim Bird wrote:
>>>> On 02/29/2012 10:14 AM, Jean-Christophe PLAGNIOL-VILLARD wrote:
>>>>> On 08:58 Wed 29 Feb     , Stephen Warren wrote:
>>>>>> Jean-Christophe PLAGNIOL-VILLARD wrote at Wednesday, February 29=
, 2012 5:30 AM:
>>>>>>> On 17:03 Tue 28 Feb     , Stephen Warren wrote:

<snip>

>> The existing target works just fine today.
> It depends what you want to achieve. If you want to make everything
> maximally easy for everyone you can optimize the uImage target.
>=20
> If you want to give incentive for U-Boot to improve, drop the target
> today.=20


This assumes that people will upgrade their bootloaders, which is not
always possible or desirable.

~Ryan
